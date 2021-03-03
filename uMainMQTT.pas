// ---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

// ---------------------------------------------------------------------------

unit uMainMQTT;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.ImageList,
  System.Actions,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.WinXCtrls,
  Vcl.StdCtrls,
  Vcl.CategoryButtons,
  Vcl.Buttons,
  Vcl.ImgList,
  Vcl.Imaging.PngImage,
  Vcl.ComCtrls,
  Vcl.ActnList, Vcl.WinXPanels,
  uMQTTComps,
  uMQTT,
  DosCommand,
  System.IniFiles,
  System.RegularExpressions,
  uUtils, VirtualTrees, Vcl.AppAnalytics, Vcl.Samples.Gauges, Vcl.Samples.Spin;

type
  TDeviceClient = class(TObject)
  private
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }

  published
    { published declarations }
  end;
  TMainMQTT = class(TForm)
    pnlToolbar: TPanel;
    SV: TSplitView;
    catMenuItems: TCategoryButtons;
    imlIcons: TImageList;
    imgMenu: TImage;
    ActionList1: TActionList;
    actHome: TAction;
    actLayout: TAction;
    actPower: TAction;
    lblTitle: TLabel;
    actMenu: TAction;
    ImageList1: TImageList;
    CardPanel1: TCardPanel;
    CardConfigTela: TCard;
    pnlSettings: TPanel;
    lblLog: TLabel;
    lblVclStyle: TLabel;
    grpDisplayMode: TRadioGroup;
    grpPlacement: TRadioGroup;
    grpCloseStyle: TRadioGroup;
    lstLog: TListBox;
    grpAnimation: TGroupBox;
    lblAnimationDelay: TLabel;
    lblAnimationStep: TLabel;
    chkUseAnimation: TCheckBox;
    trkAnimationDelay: TTrackBar;
    trkAnimationStep: TTrackBar;
    chkCloseOnMenuClick: TCheckBox;
    cbxVclStyles: TComboBox;
    CardClientMQTT: TCard;
    CardBrokerMQTT: TCard;
    DosCommand1: TDosCommand;
    MQTTServer: TMQTTServer;
    pnlServerMQTT: TPanel;
    pnlViews: TPanel;
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
    Label3: TLabel;
    pnlConfig: TPanel;
    lblPort_Broker: TLabel;
    lblUser_Broker: TLabel;
    Label5: TLabel;
    btnShowClients_Broker: TButton;
    chkLocalBounce_Broker: TCheckBox;
    btnBrokersList_Broker: TButton;
    edtPort_Broker: TEdit;
    tswStartStop_Broker: TToggleSwitch;
    btnShowPort_Broker: TButton;
    edt_User_Broker: TEdit;
    edtPassword_Broker: TEdit;
    Memo1: TMemo;
    Panel1: TPanel;
    Label4: TLabel;
    Label6: TLabel;
    COnlineTxt: TLabel;
    CEnableTxt: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    CMsgTxt: TLabel;
    Label16: TLabel;
    CQosTxt: TLabel;
    Memo2: TMemo;
    Memo3: TMemo;
    MQTTClient: TMQTTClient;
    Panel2: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    ClientIDTxt: TLabel;
    Label19: TLabel;
    Button17: TButton;
    Button18: TButton;
    Button24: TButton;
    Button2: TButton;
    Button3: TButton;
    CPortTxt: TEdit;
    TopicsTxt: TMemo;
    Button5: TButton;
    Button6: TButton;
    TopicTxt: TEdit;
    MsgBox: TMemo;
    CMBox2: TCheckBox;
    BounceBox2: TCheckBox;
    CleanBox2: TCheckBox;
    Button4: TButton;
    RetainBox: TCheckBox;
    Button8: TButton;
    Button9: TButton;
    JTxt: TEdit;
    Edit1: TEdit;
    Button10: TButton;
    AddrTxt: TEdit;
    rgQOS: TRadioGroup;
    actShowBrokers: TAction;
    CardShowBrokers: TCard;
    Panel3: TPanel;
    MonTree: TVirtualStringTree;
    Panel4: TPanel;
    AddBtn: TButton;
    BitBtn1: TBitBtn;
    DelBtn: TButton;
    IPTxt: TEdit;
    Label20: TLabel;
    Label21: TLabel;
    Edit2: TEdit;
    StartBtn: TButton;
    StopBtn: TButton;
    CardPainelCel: TCard;
    Panel5: TPanel;
    btnMyIP: TBitBtn;
    actPainelCel: TAction;
    pnlPainelCelular: TPanel;
    trycn1: TTrayIcon;
    MQTTClientCelular: TMQTTClient;
    pnlConnectBroker: TPanel;
    lblBrokerHost: TLabel;
    lblBrokerPort: TLabel;
    edtBrokerPort: TEdit;
    edtHostPainelCel: TEdit;
    lblSubTopic: TLabel;
    edtSubTopic: TEdit;
    rgQosPainelCel: TRadioGroup;
    cbbBrokerList: TComboBox;
    lblBrokerListPainelCel: TLabel;
    edtName_Broker: TEdit;
    lblName_Broker: TLabel;
    seRetryTime_Broker: TSpinEdit;
    chkClientMonitor_Broker: TCheckBox;
    pnlNovoComps: TPanel;
    svNewComponent: TSplitView;
    gBateria: TGauge;
    lblEstadoBatt: TLabel;
    btnAddComps: TBitBtn;
    tsw1: TToggleSwitch;
    actVariaveis: TAction;
    CardVariaveis: TCard;
    pnlVariavies: TPanel;
    edtIP_Broker: TEdit;
    btnIP_Broker: TBitBtn;
    procedure grpDisplayModeClick(Sender: TObject);
    procedure grpPlacementClick(Sender: TObject);
    procedure grpCloseStyleClick(Sender: TObject);
    procedure SVClosed(Sender: TObject);
    procedure SVClosing(Sender: TObject);
    procedure SVOpened(Sender: TObject);
    procedure SVOpening(Sender: TObject);
    procedure catMenuItemsCategoryCollapase(Sender: TObject;
      const Category: TButtonCategory);
    procedure imgMenuClick(Sender: TObject);
    procedure chkUseAnimationClick(Sender: TObject);
    procedure trkAnimationDelayChange(Sender: TObject);
    procedure trkAnimationStepChange(Sender: TObject);
    procedure actHomeExecute(Sender: TObject);
    procedure actLayoutExecute(Sender: TObject);
    procedure actPowerExecute(Sender: TObject);
    procedure cbxVclStylesChange(Sender: TObject);
    procedure actMenuExecute(Sender: TObject);
    procedure Log(const Msg: string);
    procedure MQTTClientClientID(Sender: TObject; var aClientID: UTF8String);
    procedure MQTTClientEnableChange(Sender: TObject);
    procedure MQTTClientFailure(Sender: TObject; aReason: Integer;
      var CloseClient: Boolean);
    procedure MQTTClientMon(Sender: TObject; aStr: string);
    procedure MQTTClientMsg(Sender: TObject; aTopic: UTF8String;
      aMessage: AnsiString; aQos: TMQTTQOSType; aRetained: Boolean);
    procedure MQTTClientOffline(Sender: TObject; Graceful: Boolean);
    procedure MQTTClientOnline(Sender: TObject);
    procedure MQTTServerBrokerEnableChange(Sender: TObject);
    procedure MQTTServerBrokerOffline(Sender: TObject; Graceful: Boolean);
    procedure MQTTServerBrokerOnline(Sender: TObject);
    procedure MQTTServerCheckUser(Sender: TObject; aUser, aPass: UTF8String;
      var Allowed: Boolean);
    procedure MQTTServerClientsChange(Sender: TObject; anID: Word);
    procedure MQTTServerDeleteSession(Sender: TObject; aClientID: UTF8String);
    procedure MQTTServerEnableChange(Sender: TObject);
    procedure MQTTServerFailure(Sender: TObject; aReason: Integer;
      var CloseClient: Boolean);
    procedure MQTTServerMon(Sender: TObject; aStr: string);
    procedure MQTTServerObituary(Sender: TObject;
      var aTopic, aMessage: UTF8String; var aQos: TMQTTQOSType);
    procedure MQTTServerRestoreSession(Sender: TObject; aClientID: UTF8String);
    procedure MQTTServerStoreSession(Sender: TObject; aClientID: UTF8String);
    procedure MQTTServerSubscription(Sender: TObject; aTopic: UTF8String;
      var RequestedQos: TMQTTQOSType);
    procedure Button5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BounceBox2Click(Sender: TObject);
    procedure BounceBoxClick(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure AddrTxtDblClick(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure rgQOSClick(Sender: TObject);
    procedure CleanBox2Click(Sender: TObject);
    procedure RetainBoxClick(Sender: TObject);
    procedure Memo2DblClick(Sender: TObject);
    procedure DosCommand1NewLine(ASender: TObject; const ANewLine: string;
      AOutputType: TOutputType);
    procedure DosCommand1Terminated(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tswStartStop_BrokerClick(Sender: TObject);
    procedure CPortTxtKeyPress(Sender: TObject; var Key: Char);
    procedure btnShowClients_BrokerClick(Sender: TObject);
    procedure CardPanel1CardChange(Sender: TObject; PrevCard, NextCard: TCard);
    procedure MonTreeChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure MonTreeGetNodeDataSize(Sender: TBaseVirtualTree;
      var NodeDataSize: Integer);
    procedure MonTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure AddBtnClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DelBtnClick(Sender: TObject);
    procedure StartBtnClick(Sender: TObject);
    procedure StopBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnBrokersList_BrokerClick(Sender: TObject);
    procedure btnMyIPClick(Sender: TObject);
    procedure actShowBrokersExecute(Sender: TObject);
    procedure actPainelCelExecute(Sender: TObject);
    procedure seRetryTime_BrokerChange(Sender: TObject);
    procedure btnAddCompsClick(Sender: TObject);
    procedure tsw1Click(Sender: TObject);
    procedure tsw1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure actVariaveisExecute(Sender: TObject);
    procedure btnIP_BrokerClick(Sender: TObject);
  private
    FServer: TMQTTServer;
    SLPortPID: TStringList;
    aQos: TMQTTQOSType;
    aRetain: Boolean;
    procedure StoreSettings;
    procedure LoadSettings;
    procedure CarregaIP;
    procedure SMonHeader(Sender: TObject; aMsgType: TMQTTMessageType;
      aDup: Boolean; aQos: TMQTTQOSType; aRetain: Boolean);
    procedure CMonHeader(Sender: TObject; aMsgType: TMQTTMessageType;
      aDup: Boolean; aQos: TMQTTQOSType; aRetain: Boolean);
    procedure ExecuteCommand(CommandText: string);
    procedure StartServer;
    procedure StopServer;
    procedure IPTxtChange(Sender: TObject);
    procedure RefreshTree;
    procedure Sync;
    procedure UpdateBtnStatus;
    procedure UpdateCompBroker;
    procedure NovoToggleSwitch(pDescendente: TToggleSwitch; pParent: TWinControl);
  public

  end;

var
  MainMQTT: TMainMQTT;

implementation

uses
  Vcl.Themes, uBrokers, uClient, uMQTTServer;

{$R *.dfm}

procedure TMainMQTT.StartServer;
begin

  MQTTServer.Port := StrToIntDef(Trim(edtPort_Broker.Text), 1883);
  MQTTServer.Addr := Trim(edtIP_Broker.Text);

  MQTTServer.Activate(true);
end;

procedure TMainMQTT.StopServer;
begin
  MQTTServer.Activate(False);
end;

procedure TMainMQTT.ExecuteCommand(CommandText: string);
var
  SL: TStringList;
  sFile: String;
  Espera: Boolean;
  I: Integer;
begin
  I := 0;
  Espera := False;

  try
    DosCommand1.CommandLine := Trim(CommandText);
    // 'netstat -a -o -n'; // ' cmd /c "dir"';
    DosCommand1.CurrentDir := 'c:\windows';
    DosCommand1.Execute;

  except
    on E: Exception do
  end;

end;

procedure TMainMQTT.FormCreate(Sender: TObject);
var
  StyleName: string;
begin
  svNewComponent.Opened := False;
  for StyleName in TStyleManager.StyleNames do
    cbxVclStyles.Items.Add(StyleName);

  cbxVclStyles.ItemIndex := cbxVclStyles.Items.IndexOf
    (TStyleManager.ActiveStyle.Name);

  SLPortPID := TStringList.Create;
  aRetain := False;
  LoadSettings;

end;

procedure TMainMQTT.FormDestroy(Sender: TObject);
begin
  FreeAndNil(SLPortPID);
  StoreSettings;
end;

procedure TMainMQTT.FormShow(Sender: TObject);
begin
  {Broker Server MQTT}
  seRetryTime_Broker.Value := MQTTServer.RetryTime;
  edtPort_Broker.Text := IntToStr(MQTTServer.Port);
  CPortTxt.Text := IntToStr(MQTTClient.Port);
  AddrTxt.Text := MQTTClient.Host;
  chkLocalBounce_Broker.Checked := MQTTServer.LocalBounce;
  BounceBox2.Checked := MQTTClient.LocalBounce;
  {Client MQTT}
  rgQOS.ItemIndex := 0;
  CleanBox2.Checked := MQTTClient.Clean;
  ClientIDTxt.Caption := '';
  MQTTServer.FOnMonHdr := SMonHeader;
  MQTTClient.Parser.OnHeader := CMonHeader;
  RetainBox.Checked := aRetain;
  AddrTxt.Clear;
  AddrTxt.Text := uUtils.TTUtil.fLocalIP;
  ExecuteCommand('netstat -a -o -n');
  chkLocalBounce_Broker.Checked := MQTTServer.LocalBounce;
  MQTTServer.FOnMonHdr := SMonHeader;
end;

procedure TMainMQTT.cbxVclStylesChange(Sender: TObject);
begin
  TStyleManager.SetStyle(cbxVclStyles.Text);
end;

procedure TMainMQTT.imgMenuClick(Sender: TObject);
begin
  if SV.Opened then
    SV.Close
  else
    SV.Open;
end;

procedure TMainMQTT.grpDisplayModeClick(Sender: TObject);
begin
  SV.DisplayMode := TSplitViewDisplayMode(grpDisplayMode.ItemIndex);
end;

procedure TMainMQTT.grpCloseStyleClick(Sender: TObject);
begin
  SV.CloseStyle := TSplitViewCloseStyle(grpCloseStyle.ItemIndex);
end;

procedure TMainMQTT.grpPlacementClick(Sender: TObject);
begin
  SV.Placement := TSplitViewPlacement(grpPlacement.ItemIndex);
end;

procedure TMainMQTT.SMonHeader(Sender: TObject; aMsgType: TMQTTMessageType;
  aDup: Boolean; aQos: TMQTTQOSType; aRetain: Boolean);
begin
  SMsgTxt.Caption := MsgNames[aMsgType];
  SQosTxt.Caption := QosNames[aQos];
end;

procedure TMainMQTT.StoreSettings;
var
  anIniFile: string;
begin
  anIniFile := ChangeFileExt(Application.ExeName, '.ini');
  with TIniFile.Create(anIniFile) do
  begin
    WriteInteger('SERVER', 'Port', MQTTServer.Port);
    WriteBool('SERVER', 'Local Bounce', MQTTServer.LocalBounce);
    WriteBool('SERVER', 'Monitor', chkClientMonitor_Broker.Checked);

    writeString('CLIENT', 'Host', MQTTClient.Host);
    WriteInteger('CLIENT', 'Port', MQTTClient.Port);
    WriteInteger('CLIENT', 'Qos', ord(aQos));
    WriteBool('CLIENT', 'Local Bounce', MQTTClient.LocalBounce);
    WriteBool('CLIENT', 'Monitor', CMBox2.Checked);
    Free;
  end;

end;

procedure TMainMQTT.SVClosed(Sender: TObject);
begin
  // When TSplitView is closed, adjust ButtonOptions and Width
  catMenuItems.ButtonOptions := catMenuItems.ButtonOptions - [boShowCaptions];
  if SV.CloseStyle = svcCompact then
    catMenuItems.Width := SV.CompactWidth;
end;

procedure TMainMQTT.SVClosing(Sender: TObject);
begin
  //
end;

procedure TMainMQTT.SVOpened(Sender: TObject);
begin
  // When not animating, change size of catMenuItems when TSplitView is opened
  catMenuItems.ButtonOptions := catMenuItems.ButtonOptions + [boShowCaptions];
  catMenuItems.Width := SV.OpenedWidth;
end;

procedure TMainMQTT.SVOpening(Sender: TObject);
begin
  // When animating, change size of catMenuItems at the beginning of open
  catMenuItems.ButtonOptions := catMenuItems.ButtonOptions + [boShowCaptions];
  catMenuItems.Width := SV.OpenedWidth;
end;


procedure TMainMQTT.tsw1Click(Sender: TObject);
begin
  NovoToggleSwitch(tsw1, pnlNovoComps);
end;

procedure TMainMQTT.tsw1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  ReleaseCapture;
  PostMessage(TToggleSwitch(Sender).Handle, WM_SYSCOMMAND, $F012,0);
end;

procedure TMainMQTT.tswStartStop_BrokerClick(Sender: TObject);
begin
  case tswStartStop_Broker.state of
    tssOff:
      StopServer;
    tssOn:
      StartServer;
  end;
end;

procedure TMainMQTT.chkUseAnimationClick(Sender: TObject);
begin
  SV.UseAnimation := chkUseAnimation.Checked;
  lblAnimationDelay.Enabled := SV.UseAnimation;
  trkAnimationDelay.Enabled := SV.UseAnimation;
  lblAnimationStep.Enabled := SV.UseAnimation;
  trkAnimationStep.Enabled := SV.UseAnimation;
end;

procedure TMainMQTT.CleanBox2Click(Sender: TObject);
begin
  MQTTClient.Clean := CleanBox2.Checked;
end;

procedure TMainMQTT.CMonHeader(Sender: TObject; aMsgType: TMQTTMessageType;
  aDup: Boolean; aQos: TMQTTQOSType; aRetain: Boolean);
begin
  CMsgTxt.Caption := MsgNames[aMsgType];
  CQosTxt.Caption := QosNames[aQos];
end;

procedure TMainMQTT.CPortTxtKeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(Key, ['0' .. '9', #8]) then
    Key := #0;
end;

procedure TMainMQTT.DosCommand1NewLine(ASender: TObject; const ANewLine: string;
  AOutputType: TOutputType);
var
  PortStr, ExecName: String;
  iPos, iLen: Integer;
  RegEx: TRegEx;
  sExpressao1: string;
begin

  if AOutputType = otEntireLine then
  begin
    if not Assigned(SLPortPID) then
      SLPortPID := TStringList.Create;

    SLPortPID.Clear;

    sExpressao1 := '\:\d{2}\b |\:\d{3} \b |\:\d{4} |\:\d{5} \b';
    if TRegEx.IsMatch(ANewLine, sExpressao1) then
    begin
      PortStr := StringReplace(TRegEx.Match(ANewLine, sExpressao1).Value, ':',
        '', [rfReplaceAll]);
      PortStr := Trim(PortStr);
      if SLPortPID.IndexOf(PortStr) < 0 then
        SLPortPID.Add(PortStr);
    end;

  end;
end;

procedure TMainMQTT.DosCommand1Terminated(Sender: TObject);
begin
  // ShowMessage('Terminou de carregar.' + #10#13 + SLPortPID.Text);

  Memo2.Lines.Add('Terminou de carregar.');
  Memo2.Lines.Add(SLPortPID.Text);
end;

procedure TMainMQTT.trkAnimationDelayChange(Sender: TObject);
begin
  SV.AnimationDelay := trkAnimationDelay.Position * 5;
  lblAnimationDelay.Caption := 'Animation Delay (' +
    IntToStr(SV.AnimationDelay) + ')';
end;

procedure TMainMQTT.trkAnimationStepChange(Sender: TObject);
begin
  SV.AnimationStep := trkAnimationStep.Position * 5;
  lblAnimationStep.Caption := 'Animation Step (' +
    IntToStr(SV.AnimationStep) + ')';
end;

procedure TMainMQTT.actHomeExecute(Sender: TObject);
begin
  // Log(actHome.Caption + ' Clicked');

  Log('ClientMQTT Clicked');
  if SV.Opened and chkCloseOnMenuClick.Checked then
    SV.Close;

  CardPanel1.ActiveCard := CardClientMQTT;
end;

procedure TMainMQTT.actLayoutExecute(Sender: TObject);
begin
  Log('Config tela Card Clicked');
  if SV.Opened and chkCloseOnMenuClick.Checked then
    SV.Close;

  CardPanel1.ActiveCard := CardConfigTela;
end;

procedure TMainMQTT.actMenuExecute(Sender: TObject);
begin
  Log(actMenu.Caption + ' Clicked');
  if SV.Opened and chkCloseOnMenuClick.Checked then
    SV.Close;
end;

procedure TMainMQTT.actPainelCelExecute(Sender: TObject);
begin
  Log('Config tela Card Painel Celular');
  if SV.Opened and chkCloseOnMenuClick.Checked then
    SV.Close;

  CardPanel1.ActiveCard := CardPainelCel;
end;

procedure TMainMQTT.actPowerExecute(Sender: TObject);
begin
  // Log(actPower.Caption + ' Clicked');
  Log('Broker Card Clicked');
  if SV.Opened and chkCloseOnMenuClick.Checked then
    SV.Close;

  CardPanel1.ActiveCard := CardBrokerMQTT;
end;

procedure TMainMQTT.actShowBrokersExecute(Sender: TObject);
begin
  Log('Config tela Card Show Brokers');
  if SV.Opened and chkCloseOnMenuClick.Checked then
    SV.Close;

  CardPanel1.ActiveCard := CardShowBrokers;
end;

procedure TMainMQTT.actVariaveisExecute(Sender: TObject);
begin
  Log('Config tela Card Váriaveis');
  if SV.Opened and chkCloseOnMenuClick.Checked then
    SV.Close;

  CardPanel1.ActiveCard := CardShowBrokers;
end;

procedure TMainMQTT.AddrTxtDblClick(Sender: TObject);
begin
  CarregaIP;
end;

procedure TMainMQTT.catMenuItemsCategoryCollapase(Sender: TObject;
  const Category: TButtonCategory);
begin
  // Prevent the catMenuItems Category group from being collapsed
  catMenuItems.Categories[0].Collapsed := False;
end;

procedure TMainMQTT.LoadSettings;
var
  anIniFile: string;
begin
  anIniFile := ChangeFileExt(Application.ExeName, '.ini');
  with TIniFile.Create(anIniFile) do
  begin
    MQTTServer.Port := ReadInteger('SERVER', 'Port', 1883);
    MQTTServer.LocalBounce := ReadBool('SERVER', 'Local Bounce', true);
    MQTTClient.Host := ReadString('CLIENT', 'Host', 'localhost');
    MQTTClient.Port := ReadInteger('CLIENT', 'Port', 1883);
    MQTTClient.LocalBounce := ReadBool('CLIENT', 'Local Bounce', False);
    aQos := TMQTTQOSType(ReadInteger('CLIENT', 'Qos', 1));
    chkClientMonitor_Broker.Checked := ReadBool('SERVER', 'Monitor', true);
    CMBox2.Checked := ReadBool('CLIENT', 'Monitor', true);
    Free;
  end;
end;

procedure TMainMQTT.Log(const Msg: string);
var
  Idx: Integer;
begin
  Idx := lstLog.Items.Add(Msg);
  lstLog.TopIndex := Idx;
end;

{ MQTTServer/Client }

procedure TMainMQTT.Memo2DblClick(Sender: TObject);
begin
  Memo2.Lines.Clear;
end;

procedure TMainMQTT.MQTTClientClientID(Sender: TObject;
  var aClientID: UTF8String);
begin
  MQTTClient.SetWill('will/' + aClientID, 'I''ve had it folks..',
    qtEXACTLY_ONCE);
end;

procedure TMainMQTT.MQTTClientEnableChange(Sender: TObject);
begin
  CEnableTxt.Caption := ny[TMQTTClient(Sender).Enabled];
  if TMQTTClient(Sender).Enabled then
    Memo2.Lines.Add('Client is enabled.')
  else
    Memo2.Lines.Add('Client is disabled.');
end;

procedure TMainMQTT.MQTTClientFailure(Sender: TObject; aReason: Integer;
  var CloseClient: Boolean);
begin
  Memo2.Lines.Add('---- Failure Reported ' + FailureNames(aReason));
end;

procedure TMainMQTT.MQTTClientMon(Sender: TObject; aStr: string);
begin
  if CMBox2.Checked then
    Memo2.Lines.Add(aStr);
end;

procedure TMainMQTT.MQTTClientMsg(Sender: TObject; aTopic: UTF8String;
  aMessage: AnsiString; aQos: TMQTTQOSType; aRetained: Boolean);
var
  I, X: Integer;
  aStr: string;
  ForMe: Boolean;
  t: TStringList;
begin // Sender TMQTTClient
  Memo2.Lines.Add('MESSAGE "' + string(aTopic) + '".');
  Memo2.Lines.Add(IntToStr(length(aMessage)) + ' byte(s) @ ' + QosNames[aQos]);
  if aRetained then
    Memo2.Lines.Add('This is a Retained message.');
  t := SubTopics(aTopic);
  if t[0] = 'will' then
    Memo2.Lines.Add(string(aMessage))
  else if t.Count >= 2 then
  begin
    if t[0] = 'update' then
    begin
      if t[1] = 'memo' then
      begin
        ForMe := true;
        if (t.Count > 2) then
          ForMe := (t[2] = string(MQTTClient.ClientID));
        if ForMe then
        begin
          Memo3.Lines.Clear;
          I := 1;
          while (I + 1) <= length(aMessage) do
          begin
            aStr := '';
            X := ord(aMessage[I]) * $100 + ord(aMessage[I + 1]);
            I := I + 2;
            if (X > 0) then
            begin
              aStr := Copy(string(aMessage), I, X);
              I := I + X;
            end;
            Memo3.Lines.Add(aStr);
          end; // while
          if aRetained then
            Memo3.Lines.Add('(Retained)');
        end; // forme
      end; // [t[1]
    end; // t[0]
  end; // t.Count >= 2
  Memo2.Lines.Add('MESSAGE END');
  t.Free;
end;

procedure TMainMQTT.MQTTClientOffline(Sender: TObject; Graceful: Boolean);
begin
  COnlineTxt.Caption := 'NO';
  ClientIDTxt.Caption := '';
  if Graceful then
    Memo2.Lines.Add('Client Gracefully Disconnected.')
  else
    Memo2.Lines.Add('Client Terminated Unexpectedly.');
end;

procedure TMainMQTT.MQTTClientOnline(Sender: TObject);
begin
  COnlineTxt.Caption := 'YES';
  Memo2.Lines.Add('Client is online.');
  ClientIDTxt.Caption := string(MQTTClient.Parser.ClientID);
  Button5Click(Button5);
end;

procedure TMainMQTT.MQTTServerBrokerEnableChange(Sender: TObject);
begin
  if BrokerForm.Visible then
    BrokerForm.RefreshTree;
end;

procedure TMainMQTT.MQTTServerBrokerOffline(Sender: TObject; Graceful: Boolean);
begin
  if BrokerForm.Visible then
    BrokerForm.RefreshTree;
end;

procedure TMainMQTT.MQTTServerBrokerOnline(Sender: TObject);
begin
  if BrokerForm.Visible then
    BrokerForm.RefreshTree;
end;

procedure TMainMQTT.MQTTServerCheckUser(Sender: TObject;
  aUser, aPass: UTF8String; var Allowed: Boolean);
begin
  Memo1.Lines.Add('Login Approval Username "' + string(aUser) + '" Password "' +
    string(aPass) + '".');
  Allowed := true;
end;

procedure TMainMQTT.MQTTServerClientsChange(Sender: TObject; anID: Word);
begin
  SClientsTxt.Caption := IntToStr(anID);
end;

procedure TMainMQTT.MQTTServerDeleteSession(Sender: TObject;
  aClientID: UTF8String);
begin
  Memo1.Lines.Add('Delete Session for "' + string(aClientID) + '".');
end;

procedure TMainMQTT.MQTTServerEnableChange(Sender: TObject);
begin
  SEnableTxt.Caption := ny[MQTTServer.Enabled];
end;

procedure TMainMQTT.MQTTServerFailure(Sender: TObject; aReason: Integer;
  var CloseClient: Boolean);
begin
  Memo1.Lines.Add('---- Failure Reported ' + FailureNames(aReason));
end;

procedure TMainMQTT.MQTTServerMon(Sender: TObject; aStr: string);
begin
  if chkClientMonitor_Broker.Checked then
    Memo1.Lines.Add(aStr);
end;

procedure TMainMQTT.MQTTServerObituary(Sender: TObject;
  var aTopic, aMessage: UTF8String; var aQos: TMQTTQOSType);
begin
  if not(Sender is TClient) then
    exit;
  Memo1.Lines.Add('Obituary Approval "' + string(aTopic) + '" with message "' +
    string(aMessage) + '"');
  with TClient(Sender) do
  begin
    aMessage := Parser.ClientID + ' failed at ' + UTF8String(TimeToStr(Now)) +
      ' - ' + aMessage;
  end;
end;

procedure TMainMQTT.MQTTServerRestoreSession(Sender: TObject;
  aClientID: UTF8String);
begin
  Memo1.Lines.Add('Restore Session for "' + string(aClientID) + '".');
end;

procedure TMainMQTT.MQTTServerStoreSession(Sender: TObject;
  aClientID: UTF8String);
begin
  Memo1.Lines.Add('Store Session for "' + string(aClientID) + '".');
end;

procedure TMainMQTT.MQTTServerSubscription(Sender: TObject; aTopic: UTF8String;
  var RequestedQos: TMQTTQOSType);
begin
  Memo1.Lines.Add('Subscription Approval "' + string(aTopic) + '" @ ' +
    QosNames[RequestedQos]);
end;

procedure TMainMQTT.NovoToggleSwitch(pDescendente: TToggleSwitch; pParent: TWinControl);
var newToggleSwitch, saveToggleSwitch: TToggleSwitch;
   I: Integer;
   NameComp: String;
const
   cnstNewName = 'Novo_Controle_%s';
begin
   newToggleSwitch:= TToggleSwitch.Create(self);
    I := 0;
   with newToggleSwitch do
   try
     Parent := pParent;
     NameComp :=  cnstNewName;

     NameComp := Format(NameComp, [IntToStr(I)]);
     while  Assigned(Self.FindComponent(NameComp)) do
     begin
       Inc(I);
       NameComp := Format(cnstNewName, [IntToStr(I)]);
       if not Assigned(Self.FindComponent(NameComp)) then
         break;
     end;

     Name    := NameComp;
     Caption := NameComp;
     Left    := Trunc(pParent.Width / 2);
     Top     := Trunc(pParent.Height / 2);
     OnClick := nil;


     OnMouseMove := tsw1MouseMove;
//     if CanFocus then
//       SetFocus;

      Click;

//     OnMouseMove(newToggleSwitch,[],Screen.)

   except on E: Exception do
     if E.ClassType = EComponentError then
     begin
        ShowMessage(E.Message);
       //NovoToggleSwitch(pDescendente, pParent);
     end;

   end;
end;

procedure TMainMQTT.RetainBoxClick(Sender: TObject);
begin
  aRetain := RetainBox.Checked;
end;

procedure TMainMQTT.rgQOSClick(Sender: TObject);
begin
  aQos := TMQTTQOSType(rgQOS.ItemIndex);
end;

procedure TMainMQTT.seRetryTime_BrokerChange(Sender: TObject);
begin
  MQTTServer.RetryTime := seRetryTime_Broker.Value;
end;

procedure TMainMQTT.BounceBox2Click(Sender: TObject);
begin
  MQTTClient.LocalBounce := BounceBox2.Checked;
end;

procedure TMainMQTT.BounceBoxClick(Sender: TObject);
begin
  MQTTServer.LocalBounce := chkLocalBounce_Broker.Checked;
end;

procedure TMainMQTT.btnAddCompsClick(Sender: TObject);
begin
  svNewComponent.Opened := not svNewComponent.Opened;
end;

procedure TMainMQTT.btnBrokersList_BrokerClick(Sender: TObject);
begin
  CardPanel1.ActiveCard := CardShowBrokers;
end;

procedure TMainMQTT.btnIP_BrokerClick(Sender: TObject);
begin
  edtIP_Broker.Text := TTUtil.fPublicIP;
end;

procedure TMainMQTT.btnMyIPClick(Sender: TObject);
begin
  btnMyIP.Enabled := False;
  CarregaIP;
  btnMyIP.Enabled := True;
end;

procedure TMainMQTT.btnShowClients_BrokerClick(Sender: TObject);
var
  j: Integer;
  X: cardinal;
begin
  Memo2.Lines.Add('');
  Memo2.Lines.Add('------ Client ' + string(MQTTClient.Parser.ClientID) +
    ' -------');
  Memo2.Lines.Add(format('Username "%s" Password "%s"',
    [MQTTClient.Parser.Username, MQTTClient.Parser.Password]));
  Memo2.Lines.Add(format('Keep Alive "%d" Retry Time "%d" Max Retries "%d"',
    [MQTTClient.Parser.KeepAlive, MQTTClient.Parser.RetryTime,
    MQTTClient.Parser.MaxRetries]));
  Memo2.Lines.Add(format('Will Topic "%s" Message "%s" @ %s',
    [MQTTClient.Parser.WillTopic, MQTTClient.Parser.WillMessage,
    QosNames[MQTTClient.Parser.WillQos]]));
  Memo2.Lines.Add('Subscriptions ----');
  for j := 0 to MQTTClient.Subscriptions.Count - 1 do
  begin
    X := cardinal(MQTTClient.Subscriptions.Objects[j]) and $03;
    if (cardinal(MQTTClient.Subscriptions.Objects[j]) shr 8) and $FF = $FF then
      Memo2.Lines.Add('  "' + MQTTClient.Subscriptions[j] + '" @ ' +
        QosNames[TMQTTQOSType(X)] + ' Acked.')
    else
      Memo2.Lines.Add('  "' + MQTTClient.Subscriptions[j] + '" @ ' +
        QosNames[TMQTTQOSType(X)]);
  end;
end;

procedure TMainMQTT.Button10Click(Sender: TObject);
begin
  MQTTClient.Publish('csi/pnl/set/state/' + UTF8String(JTxt.Text), '1',
    qtAT_MOST_ONCE, False);
end;

procedure TMainMQTT.Button15Click(Sender: TObject);
begin
  MQTTServer.Port := StrToIntDef(edtPort_Broker.Text, 1883);
  MQTTServer.Activate(true);
end;

procedure TMainMQTT.Button16Click(Sender: TObject);
begin
  MQTTServer.Activate(False);
end;

procedure TMainMQTT.Button17Click(Sender: TObject);
begin
  MQTTClient.Activate(False);
end;

procedure TMainMQTT.Button18Click(Sender: TObject);
begin
  MQTTClient.Host := AddrTxt.Text;
  MQTTClient.Port := StrToIntDef(CPortTxt.Text, 1883);
  MQTTClient.Activate(true);
end;

procedure TMainMQTT.Button22Click(Sender: TObject);
var
  I, j: Integer;
  aClient: TClient;
  X: cardinal;
begin
  for I := 0 to MQTTServer.Server.ClientCount - 1 do
  begin
    aClient := TClient(MQTTServer.Server.Client[I]);
    Memo1.Lines.Add('');
    Memo1.Lines.Add('------ Client ' + string(aClient.Parser.ClientID) +
      ' -------');
    Memo1.Lines.Add(format('Username "%s" Password "%s"',
      [aClient.Parser.Username, aClient.Parser.Password]));
    Memo1.Lines.Add(format('Keep Alive "%d" Retry Time "%d" Max Retries "%d"',
      [aClient.Parser.KeepAlive, aClient.Parser.RetryTime,
      aClient.Parser.MaxRetries]));
    Memo1.Lines.Add(format('Will Topic "%s" Message "%s" @ %s',
      [aClient.Parser.WillTopic, aClient.Parser.WillMessage,
      QosNames[aClient.Parser.WillQos]]));
    Memo1.Lines.Add('Subscriptions ----');
    for j := 0 to aClient.Subscriptions.Count - 1 do
    begin
      X := cardinal(aClient.Subscriptions.Objects[j]) and $03;
      Memo1.Lines.Add('  "' + aClient.Subscriptions[j] + '" @ ' +
        QosNames[TMQTTQOSType(X)]);
    end;
  end;
end;

procedure TMainMQTT.Button24Click(Sender: TObject);
var
  I, X: Integer;
  aStr: AnsiString;
begin
  aStr := '';
  for I := 0 to MsgBox.Lines.Count - 1 do
  begin
    X := length(MsgBox.Lines[I]);
    aStr := aStr + AnsiChar(X div $100) + AnsiChar(X mod $100) +
      AnsiString(MsgBox.Lines[I]);
  end;
  MQTTClient.Publish(UTF8String(TopicTxt.Text), aStr, aQos, aRetain);
end;

procedure TMainMQTT.Button2Click(Sender: TObject);
begin
  BrokerForm.FServer := MQTTServer;
  BrokerForm.Show;
end;

procedure TMainMQTT.Button3Click(Sender: TObject);
begin
  try
    MQTTClient.Link.Close;
  except
  end;
end;

procedure TMainMQTT.Button4Click(Sender: TObject);
begin
  MQTTClient.Publish('request/png/' + MQTTClient.ClientID, '?', qtEXACTLY_ONCE);
end;

procedure TMainMQTT.Button5Click(Sender: TObject);
var
  s: TStringList;
  I: Integer;
begin
  s := TStringList.Create;
  for I := 0 to TopicsTxt.Lines.Count - 1 do
    s.AddObject(TopicsTxt.Lines[I], TObject(aQos));
  MQTTClient.Subscribe(s);
  s.Free;
end;

procedure TMainMQTT.Button6Click(Sender: TObject);
var
  s: TStringList;
  I: Integer;
begin
  s := TStringList.Create;
  for I := 0 to TopicsTxt.Lines.Count - 1 do
    s.Add(TopicsTxt.Lines[I]);
  MQTTClient.Unsubscribe(s);
  s.Free;
end;

procedure TMainMQTT.Button8Click(Sender: TObject);
begin
  //
end;

procedure TMainMQTT.CardPanel1CardChange(Sender: TObject;
  PrevCard, NextCard: TCard);
begin
  if TCard(Sender) = CardShowBrokers then
  begin
    FServer := nil;
    Sync;
    UpdateBtnStatus;
  end;
end;

procedure TMainMQTT.CarregaIP;
begin
  AddrTxt.Clear;
  AddrTxt.Text := uUtils.TTUtil.fLocalIP;
end;

procedure ShowBrokerForm(anOwner: TComponent; aServer: TMQTTServer);
var
  aForm: TMainMQTT;
begin
  aForm := TMainMQTT.Create(anOwner);
  aForm.FServer := aServer;
  aForm.Show;
end;

{ TForm2 }

procedure TMainMQTT.AddBtnClick(Sender: TObject);
var
  aBroker: TMQTTClient;
  aNode: PVirtualNode;
  aData: PDataRec;
begin
  if FServer = nil then
    exit;
  aBroker := FServer.AddBroker(IPTxt.Text, StrToIntDef(edtPort_Broker.Text, 1883));
  Sync;
  aNode := MonTree.GetFirst(False);
  while aNode <> nil do
  begin
    aData := MonTree.GetNodeData(aNode);
    if aData.Broker = aBroker then
    begin
      MonTree.Selected[aNode] := true;
      aNode := nil;
    end
    else
      aNode := MonTree.GetNext(aNode, False);
  end;
end;

procedure TMainMQTT.BitBtn1Click(Sender: TObject);
begin
  hide;
end;

procedure TMainMQTT.DelBtnClick(Sender: TObject);
var
  aNode: PVirtualNode;
  aData: PDataRec;
begin
  if FServer = nil then
    exit;
  aNode := MonTree.GetFirstSelected(False);
  if aNode = nil then
    exit;
  aData := MonTree.GetNodeData(aNode);
  FServer.Brokers.Remove(aData.Broker);
  aData.Broker.Free;
  Sync;
end;

procedure TMainMQTT.IPTxtChange(Sender: TObject);
begin
  UpdateBtnStatus;
end;

procedure TMainMQTT.MonTreeChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
begin
  UpdateBtnStatus;
end;

procedure TMainMQTT.MonTreeGetNodeDataSize(Sender: TBaseVirtualTree;
  var NodeDataSize: Integer);
begin
  NodeDataSize := SizeOf(TDataRec);
end;

procedure TMainMQTT.MonTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
const
  ny: array [Boolean] of string = ('NO', 'YES');
var
  aData: PDataRec;
begin
  aData := Sender.GetNodeData(Node);
  if FServer = nil then
    CellText := ''
  else if FServer.Brokers.IndexOf(aData.Broker) >= 0 then
  begin
    case Column of
      0:
        CellText := aData.Broker.Host;
      1:
        CellText := IntToStr(aData.Broker.Port);
      2:
        CellText := ny[aData.Broker.Enabled];
      3:
        CellText := ny[aData.Broker.Online];
    end;
  end
  else
    CellText := '';
end;

procedure TMainMQTT.RefreshTree;
begin
  MonTree.Invalidate;
end;

procedure TMainMQTT.StartBtnClick(Sender: TObject);
var
  aNode: PVirtualNode;
  aData: PDataRec;
begin
  if FServer = nil then
    exit;
  aNode := MonTree.GetFirstSelected(False);
  if aNode = nil then
    exit;
  aData := MonTree.GetNodeData(aNode);
  aData.Broker.Activate(true);
  MonTree.Invalidate;
end;

procedure TMainMQTT.StopBtnClick(Sender: TObject);
var
  aNode: PVirtualNode;
  aData: PDataRec;
begin
  if FServer = nil then
    exit;
  aNode := MonTree.GetFirstSelected(False);
  if aNode = nil then
    exit;
  aData := MonTree.GetNodeData(aNode);
  aData.Broker.Activate(False);
  MonTree.Invalidate;
end;

procedure TMainMQTT.Sync;
var
  I, X: Integer;
  aData: PDataRec;
  aNode, bNode: PVirtualNode;
begin
  if FServer = nil then
  begin
    MonTree.Clear;
    exit;
  end;
  MonTree.BeginUpdate;
  X := 0;
  aNode := MonTree.GetFirst(False);
  while (aNode <> nil) and (X < FServer.Brokers.Count) do
  begin
    aData := MonTree.GetNodeData(aNode);
    aData.Broker := FServer.Brokers[X];
    X := X + 1;
    aNode := MonTree.GetNext(aNode, False);
  end;
  if aNode = nil then // ran out of existing
  begin
    for I := X to FServer.Brokers.Count - 1 do
    begin
      aNode := MonTree.AddChild(nil);
      aData := MonTree.GetNodeData(aNode);
      aData.Broker := FServer.Brokers[X];
    end;
  end
  else // delete any extra
  begin
    while aNode <> nil do
    begin
      bNode := MonTree.GetNext(aNode, False);
      MonTree.DeleteNode(aNode, False);
      aNode := bNode;
    end;
  end;
  MonTree.EndUpdate;
end;

procedure TMainMQTT.UpdateBtnStatus;
begin
  AddBtn.Enabled := (length(IPTxt.Text) > 0);
  DelBtn.Enabled := MonTree.GetFirstSelected(False) <> nil;
  StartBtn.Enabled := MonTree.GetFirstSelected(False) <> nil;
  StopBtn.Enabled := MonTree.GetFirstSelected(False) <> nil;
end;

procedure TMainMQTT.UpdateCompBroker;
begin

end;

end.
