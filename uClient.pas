unit uClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uMQTTComps, Vcl.ExtCtrls;

type
  TClientMQTT = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    COnlineTxt: TLabel;
    CEnableTxt: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    CMsgTxt: TLabel;
    Label16: TLabel;
    CQosTxt: TLabel;
    Memo2: TMemo;
    Memo3: TMemo;
    Panel2: TPanel;
    TTClient: TMQTTClient;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label13: TLabel;
    Label18: TLabel;
    ClientIDTxt: TLabel;
    Label12: TLabel;
    Button17: TButton;
    Button18: TButton;
    Button24: TButton;
    rb1: TRadioButton;
    rb2: TRadioButton;
    rb3: TRadioButton;
    Button1: TButton;
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
    procedure AddrTxtDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ClientMQTT: TClientMQTT;

implementation

{$R *.dfm}

uses uUtils;

procedure TClientMQTT.AddrTxtDblClick(Sender: TObject);
begin
  AddrTxt.Clear;
  AddrTxt.Text := uUtils.TTUtil.fLocalIP;
end;

end.
