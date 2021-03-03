object ServerMQTT: TServerMQTT
  Left = 0
  Top = 0
  Caption = 'ServerMQTT'
  ClientHeight = 358
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 41
    Width = 450
    Height = 317
    Align = alClient
    ScrollBars = ssVertical
    TabOrder = 0
    ExplicitHeight = 258
  end
  object Panel2: TPanel
    Left = 450
    Top = 41
    Width = 185
    Height = 317
    Align = alRight
    TabOrder = 1
    ExplicitTop = 47
    object Label10: TLabel
      Left = 10
      Top = 9
      Width = 20
      Height = 13
      Caption = 'Port'
    end
    object Label2: TLabel
      Left = 40
      Top = 152
      Width = 22
      Height = 13
      Caption = 'User'
    end
    object Label5: TLabel
      Left = 16
      Top = 178
      Width = 46
      Height = 13
      Caption = 'Password'
    end
    object btnShowClients: TButton
      Left = 6
      Top = 110
      Width = 80
      Height = 27
      Caption = 'Show Clients'
      TabOrder = 0
      OnClick = btnShowClientsClick
    end
    object BounceBox: TCheckBox
      Left = 24
      Top = 54
      Width = 97
      Height = 17
      Caption = ' Local Bounce'
      TabOrder = 1
    end
    object CMBox: TCheckBox
      Left = 24
      Top = 31
      Width = 97
      Height = 17
      Caption = 'Client Monitor'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object btnBrokers: TButton
      Left = 49
      Top = 77
      Width = 80
      Height = 27
      Caption = 'Brokers'
      TabOrder = 3
      OnClick = btnBrokersClick
    end
    object PortTxt: TEdit
      Left = 44
      Top = 6
      Width = 85
      Height = 21
      TabOrder = 4
      Text = '1883'
      OnExit = PortTxtExit
    end
    object swtStartStop: TToggleSwitch
      Left = 46
      Top = 268
      Height = 20
      StateCaptions.CaptionOn = 'Start'
      StateCaptions.CaptionOff = 'Stop'
      TabOrder = 5
      OnClick = swtStartStopClick
    end
    object Button1: TButton
      Left = 92
      Top = 110
      Width = 80
      Height = 27
      Caption = 'Show Ports'
      TabOrder = 6
      OnClick = Button1Click
    end
    object edt_User: TEdit
      Left = 68
      Top = 149
      Width = 85
      Height = 21
      TabOrder = 7
      Text = 'admin'
      OnExit = PortTxtExit
    end
    object Edit3: TEdit
      Left = 68
      Top = 176
      Width = 85
      Height = 21
      TabOrder = 8
      Text = 'password'
      OnExit = PortTxtExit
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 41
    Align = alTop
    TabOrder = 2
    object CIDTxt: TLabel
      Left = 370
      Top = 8
      Width = 3
      Height = 13
      AutoSize = False
    end
    object Label1: TLabel
      Left = 8
      Top = 6
      Width = 32
      Height = 13
      Caption = 'Server'
    end
    object SClientsTxt: TLabel
      Left = 412
      Top = 6
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label9: TLabel
      Left = 370
      Top = 6
      Width = 32
      Height = 13
      Caption = 'Clients'
    end
    object Label11: TLabel
      Left = 46
      Top = 6
      Width = 42
      Height = 13
      Caption = 'Last Msg'
    end
    object SMsgTxt: TLabel
      Left = 94
      Top = 6
      Width = 40
      Height = 13
      Caption = '<none>'
    end
    object Label14: TLabel
      Left = 173
      Top = 6
      Width = 19
      Height = 13
      Caption = 'Qos'
    end
    object SQosTxt: TLabel
      Left = 198
      Top = 6
      Width = 3
      Height = 13
      Caption = ' '
    end
    object Label15: TLabel
      Left = 304
      Top = 6
      Width = 38
      Height = 13
      Caption = 'Enabled'
    end
    object SEnableTxt: TLabel
      Left = 348
      Top = 6
      Width = 15
      Height = 13
      Caption = 'NO'
    end
  end
  object MQTTServer: TMQTTServer
    MaxRetries = 4
    RetryTime = 60
    Port = 1883
    LocalBounce = False
    OnFailure = MQTTServerFailure
    OnStoreSession = MQTTServerStoreSession
    OnRestoreSession = MQTTServerRestoreSession
    OnDeleteSession = MQTTServerDeleteSession
    OnBrokerOnline = MQTTServerBrokerOnline
    OnBrokerOffline = MQTTServerBrokerOffline
    OnBrokerEnableChange = MQTTServerBrokerEnableChange
    OnEnableChange = MQTTServerEnableChange
    OnSubscription = MQTTServerSubscription
    OnClientsChange = MQTTServerClientsChange
    OnCheckUser = MQTTServerCheckUser
    OnObituary = MQTTServerObituary
    OnMon = MQTTServerMon
    Left = 550
    Top = 254
  end
  object DosCommand1: TDosCommand
    InputToOutput = False
    MaxTimeAfterBeginning = 0
    MaxTimeAfterLastOutput = 0
    OnNewLine = DosCommand1NewLine
    OnTerminated = DosCommand1Terminated
    OnTerminateProcess = DosCommand1TerminateProcess
    Left = 482
    Top = 249
  end
  object MQTTClient1: TMQTTClient
    KeepAlive = 10
    MaxRetries = 8
    RetryTime = 60
    Clean = False
    Broker = False
    AutoSubscribe = False
    Port = 1883
    LocalBounce = False
    Left = 594
    Top = 321
  end
end
