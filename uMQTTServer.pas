unit uMQTTServer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMQTTComps, Vcl.StdCtrls, uMQTT,
  uBrokers,
  Vcl.WinXCtrls, Vcl.ExtCtrls, DosCommand, Registry, System.RegularExpressions;

type
  TServerMQTT = class(TForm)
    Memo1: TMemo;
    Label10: TLabel;
    MQTTServer: TMQTTServer;
    Panel2: TPanel;
    btnShowClients: TButton;
    BounceBox: TCheckBox;
    CMBox: TCheckBox;
    btnBrokers: TButton;
    PortTxt: TEdit;
    swtStartStop: TToggleSwitch;
    DosCommand1: TDosCommand;
    Button1: TButton;
    MQTTClient1: TMQTTClient;
    Panel1: TPanel;
    CIDTxt: TLabel;
    Label1: TLabel;
    SClientsTxt: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    SMsgTxt: TLabel;
    Label14: TLabel;
    SQosTxt: TLabel;
    Label15: TLabel;
    SEnableTxt: TLabel;
    Label2: TLabel;
    edt_User: TEdit;
    Label5: TLabel;
    Edit3: TEdit;
    procedure MQTTServerCheckUser(Sender: TObject; aUser, aPass: UTF8String;
      var Allowed: Boolean);
    procedure MQTTServerClientsChange(Sender: TObject; anID: Word);
    procedure MQTTServerFailure(Sender: TObject; aReason: Integer;
      var CloseClient: Boolean);
    procedure MQTTServerEnableChange(Sender: TObject);
    procedure MQTTServerMon(Sender: TObject; aStr: string);
    procedure MQTTServerRestoreSession(Sender: TObject; aClientID: UTF8String);
    procedure MQTTServerStoreSession(Sender: TObject; aClientID: UTF8String);
    procedure MQTTServerDeleteSession(Sender: TObject; aClientID: UTF8String);
    procedure MQTTServerObituary(Sender: TObject;
      var aTopic, aMessage: UTF8String; var aQos: TMQTTQOSType);
    procedure MQTTServerSubscription(Sender: TObject; aTopic: UTF8String;
      var RequestedQos: TMQTTQOSType);
    procedure MQTTServerBrokerOffline(Sender: TObject; Graceful: Boolean);
    procedure MQTTServerBrokerOnline(Sender: TObject);
    procedure MQTTServerBrokerEnableChange(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure swtStartStopClick(Sender: TObject);
    procedure StartServer;
    procedure StopServer;
    procedure btnBrokersClick(Sender: TObject);
    procedure btnShowClientsClick(Sender: TObject);
    procedure ExecuteCommand(CommandText: string);
    procedure DosCommand1NewLine(ASender: TObject; const ANewLine: string;
      AOutputType: TOutputType);
    procedure FormShow(Sender: TObject);
    procedure DosCommand1TerminateProcess(ASender: TObject;
      var ACanTerminate: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PortTxtExit(Sender: TObject);
    procedure DosCommand1Terminated(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SLPortPID: TStringList;
    SLPIDProcess: TStringList;
  end;

var
  ServerMQTT: TServerMQTT;

implementation

{$R *.dfm}
{ TForm3 }

procedure TServerMQTT.PortTxtExit(Sender: TObject);
var sPorta: string;
    idx: Integer;
    I: Integer;
begin
  sPorta :=  Trim(PortTxt.Text);
  if SLPortPID.Count > 0 then
  begin
    idx := SLPortPID.IndexOfName(sPorta);
//    for I := 0 to SLPortPID.Count-1 do

    if SLPortPID.IndexOf(sPorta) >= 0 then
     begin
       MessageDlg(format('A porta %s já está em uso!',[PortTxt.Text]), mtInformation, [mbOk],0);
       exit;
     end;
  end;
end;

procedure TServerMQTT.btnBrokersClick(Sender: TObject);
begin
  BrokerForm.FServer := MQTTServer;
  BrokerForm.Show;
end;

procedure TServerMQTT.btnShowClientsClick(Sender: TObject);
var
  i, j: Integer;
  aClient: TClient;
  x: cardinal;
begin
  for i := 0 to MQTTServer.Server.ClientCount - 1 do
  begin
    aClient := TClient(MQTTServer.Server.Client[i]);
    Memo1.Lines.Add('');
    Memo1.Lines.Add('------ Client ' + string(aClient.Parser.ClientID) + ' -------');
    Memo1.Lines.Add(format('Username "%s" Password "%s"', [aClient.Parser.Username, aClient.Parser.Password]));
    Memo1.Lines.Add(format('Keep Alive "%d" Retry Time "%d" Max Retries "%d"',
      [aClient.Parser.KeepAlive, aClient.Parser.RetryTime, aClient.Parser.MaxRetries]));

    Memo1.Lines.Add(format('Will Topic "%s" Message "%s" @ %s', [aClient.Parser.WillTopic, aClient.Parser.WillMessage,
      QosNames[aClient.Parser.WillQos]]));

    Memo1.Lines.Add('Subscriptions ----');

    for j := 0 to aClient.Subscriptions.Count - 1 do
    begin
      x := cardinal(aClient.Subscriptions.Objects[j]) and $03;
      Memo1.Lines.Add('  "' + aClient.Subscriptions[j] + '" @ ' +
        QosNames[TMQTTQOSType(x)]);
    end;
  end;
end;

procedure TServerMQTT.btnStartClick(Sender: TObject);
begin
  MQTTServer.Port := StrToIntDef(PortTxt.Text, 1883);
  MQTTServer.Activate(true);
end;

procedure TServerMQTT.Button1Click(Sender: TObject);
begin
  ExecuteCommand('netstat -a -o -n');


end;

procedure TServerMQTT.DosCommand1NewLine(ASender: TObject; const ANewLine: string; AOutputType: TOutputType);
  var PortStr, ExecName: String;
      iPos, iLen : Integer;
      RegEx : TRegEx;
    sExpressao1 : string;
begin

  if AOutputType = otEntireLine then
  begin
        if not Assigned(SLPortPID) then
          SLPortPID := TStringList.Create;

        SLPortPID.Clear;

           sExpressao1 := '\:\d{2}\b |\:\d{3} \b |\:\d{4} |\:\d{5} \b';
          if TRegEx.IsMatch(ANewLine,  sExpressao1) then
          begin
             PortStr := StringReplace(TRegEx.Match(ANewLine, sExpressao1).Value, ':', '',[rfReplaceAll]);
             PortStr := Trim(PortStr);
             if SLPortPID.IndexOf(PortStr) < 0 then
               SLPortPID.Add(PortStr);
          end;



end;
  end;


procedure TServerMQTT.DosCommand1Terminated(Sender: TObject);
begin
  ShowMessage('Terminou de carregar.'+#10#13+ SLPortPID.Text);
end;

procedure TServerMQTT.DosCommand1TerminateProcess(ASender: TObject;
  var ACanTerminate: Boolean);
begin
   //
end;

procedure TServerMQTT.ExecuteCommand(CommandText: string);
var
  SL: TStringList;
  sFile: String;
  Espera: Boolean;
  I: Integer;
begin
  I := 0;
  Espera := False;

  try
      DosCommand1.CommandLine :=  Trim(CommandText); //'netstat -a -o -n'; // ' cmd /c "dir"';
      DosCommand1.CurrentDir := 'c:\windows';
      DosCommand1.Execute;

  except
    on E: Exception do
  end;

end;

procedure TServerMQTT.FormCreate(Sender: TObject);
begin
  SLPortPID := TStringList.Create;
  SLPIDProcess := TStringList.Create;
end;

procedure TServerMQTT.FormDestroy(Sender: TObject);
begin
  FreeAndNil(SLPortPID);
  FreeAndNil(SLPIDProcess);
end;

procedure TServerMQTT.FormShow(Sender: TObject);
begin
//  MostraPortasCom;
  ExecuteCommand('netstat -a -o -n');
end;

procedure TServerMQTT.MQTTServerEnableChange(Sender: TObject);
begin
  SEnableTxt.Caption := ny[MQTTServer.Enabled];
end;

procedure TServerMQTT.StartServer;
begin

  MQTTServer.Port := StrToIntDef(Trim(PortTxt.Text), 1883);

  MQTTServer.Activate(true);
end;

procedure TServerMQTT.StopServer;
begin
  MQTTServer.Activate(false);
end;

procedure TServerMQTT.swtStartStopClick(Sender: TObject);
begin
  case swtStartStop.state of
    tssOff:
      StopServer;
    tssOn:
      StartServer;
  end;

end;

procedure TServerMQTT.MQTTServerBrokerEnableChange(Sender: TObject);
begin
  if BrokerForm.Visible then
    BrokerForm.RefreshTree;
end;

procedure TServerMQTT.MQTTServerBrokerOffline(Sender: TObject;
  Graceful: Boolean);
begin
  if BrokerForm.Visible then
    BrokerForm.RefreshTree;
end;

procedure TServerMQTT.MQTTServerBrokerOnline(Sender: TObject);
begin
  if BrokerForm.Visible then
    BrokerForm.RefreshTree;
end;


procedure TServerMQTT.MQTTServerCheckUser(Sender: TObject;
  aUser, aPass: UTF8String; var Allowed: Boolean);
begin
  Memo1.Lines.Add('Login Approval Username "' + string(aUser) + '" Password "' +
    string(aPass) + '".');
  Allowed := true;
end;


procedure TServerMQTT.MQTTServerClientsChange(Sender: TObject; anID: Word);
begin
  SClientsTxt.Caption := IntToStr(anID);
end;

procedure TServerMQTT.MQTTServerDeleteSession(Sender: TObject;
  aClientID: UTF8String);
begin
  Memo1.Lines.Add('Delete Session for "' + string(aClientID) + '".');
end;

procedure TServerMQTT.MQTTServerFailure(Sender: TObject; aReason: Integer;
  var CloseClient: Boolean);
begin
  Memo1.Lines.Add('---- Failure Reported ' + FailureNames(aReason));
end;

procedure TServerMQTT.MQTTServerMon(Sender: TObject; aStr: string);
begin
  if CMBox.Checked then
    Memo1.Lines.Add(aStr);
end;

procedure TServerMQTT.MQTTServerObituary(Sender: TObject;
  var aTopic, aMessage: UTF8String; var aQos: TMQTTQOSType);
begin
  if not(Sender is TClient) then
    exit;

  Memo1.Lines.Add('Obituary Approval "' + string(aTopic) + '" with message "' +
    string(aMessage) + '"');
  with TClient(Sender) do
  begin
    aMessage := Parser.ClientID + ' failed at ' + UTF8String(TimeToStr(now)) +
      ' - ' + aMessage;
  end;
end;

procedure TServerMQTT.MQTTServerRestoreSession(Sender: TObject;
  aClientID: UTF8String);
begin
  Memo1.Lines.Add('Restore Session for "' + string(aClientID) + '".');
end;

procedure TServerMQTT.MQTTServerStoreSession(Sender: TObject;
  aClientID: UTF8String);
begin
  Memo1.Lines.Add('Store Session for "' + string(aClientID) + '".');
end;

procedure TServerMQTT.MQTTServerSubscription(Sender: TObject;
  aTopic: UTF8String; var RequestedQos: TMQTTQOSType);
begin
  Memo1.Lines.Add('Subscription Approval "' + string(aTopic) + '" @ ' +
    QosNames[RequestedQos]);
end;

end.
