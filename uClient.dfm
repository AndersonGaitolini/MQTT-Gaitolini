object ClientMQTT: TClientMQTT
  Left = 0
  Top = 0
  Caption = 'MQTT Client'
  ClientHeight = 281
  ClientWidth = 935
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 465
    Height = 281
    Align = alLeft
    TabOrder = 0
    ExplicitTop = -6
    object Label2: TLabel
      Left = 16
      Top = 19
      Width = 27
      Height = 13
      Caption = 'Client'
    end
    object Label4: TLabel
      Left = 378
      Top = 19
      Width = 30
      Height = 13
      Caption = 'Online'
    end
    object COnlineTxt: TLabel
      Left = 414
      Top = 19
      Width = 15
      Height = 13
      Caption = 'NO'
    end
    object CEnableTxt: TLabel
      Left = 356
      Top = 19
      Width = 15
      Height = 13
      Caption = 'NO'
    end
    object Label3: TLabel
      Left = 312
      Top = 19
      Width = 38
      Height = 13
      Caption = 'Enabled'
    end
    object Label8: TLabel
      Left = 53
      Top = 19
      Width = 42
      Height = 13
      Caption = 'Last Msg'
    end
    object CMsgTxt: TLabel
      Left = 101
      Top = 19
      Width = 40
      Height = 13
      Caption = '<none>'
    end
    object Label16: TLabel
      Left = 181
      Top = 19
      Width = 19
      Height = 13
      Caption = 'Qos'
    end
    object CQosTxt: TLabel
      Left = 206
      Top = 19
      Width = 6
      Height = 13
      Caption = '  '
    end
    object Memo2: TMemo
      Left = 15
      Top = 38
      Width = 279
      Height = 194
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object Memo3: TMemo
      Left = 300
      Top = 38
      Width = 133
      Height = 194
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 465
    Top = 0
    Width = 470
    Height = 281
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 471
    ExplicitTop = 8
    ExplicitHeight = 494
    object Label5: TLabel
      Left = 18
      Top = 84
      Width = 91
      Height = 13
      Caption = 'Subscription Topics'
    end
    object Label6: TLabel
      Left = 169
      Top = 119
      Width = 42
      Height = 13
      Caption = 'Message'
    end
    object Label7: TLabel
      Left = 324
      Top = 79
      Width = 85
      Height = 13
      Caption = 'Quality of Service'
    end
    object Label13: TLabel
      Left = 240
      Top = 54
      Width = 20
      Height = 13
      Caption = 'Port'
    end
    object Label18: TLabel
      Left = 168
      Top = 83
      Width = 25
      Height = 13
      Caption = 'Topic'
    end
    object ClientIDTxt: TLabel
      Left = 20
      Top = 65
      Width = 38
      Height = 13
      Caption = 'ClientID'
    end
    object Label12: TLabel
      Left = 240
      Top = 30
      Width = 22
      Height = 13
      Caption = 'Host'
    end
    object Button17: TButton
      Left = 88
      Top = 22
      Width = 69
      Height = 27
      Caption = 'Stop'
      TabOrder = 0
    end
    object Button18: TButton
      Left = 18
      Top = 22
      Width = 69
      Height = 27
      Caption = 'Start'
      TabOrder = 1
    end
    object Button24: TButton
      Left = 168
      Top = 209
      Width = 69
      Height = 25
      Caption = 'Publish'
      TabOrder = 2
    end
    object rb1: TRadioButton
      Left = 322
      Top = 95
      Width = 87
      Height = 17
      Caption = 'At Most Once'
      TabOrder = 3
    end
    object rb2: TRadioButton
      Tag = 1
      Left = 322
      Top = 111
      Width = 91
      Height = 17
      Caption = 'At Least Once'
      Checked = True
      TabOrder = 4
      TabStop = True
    end
    object rb3: TRadioButton
      Tag = 2
      Left = 322
      Top = 127
      Width = 87
      Height = 17
      Caption = 'Exactly Once'
      TabOrder = 5
    end
    object Button1: TButton
      Left = 18
      Top = 235
      Width = 69
      Height = 25
      Caption = 'Show'
      TabOrder = 6
    end
    object Button3: TButton
      Left = 160
      Top = 22
      Width = 69
      Height = 27
      Caption = 'Kill'
      TabOrder = 7
    end
    object CPortTxt: TEdit
      Left = 270
      Top = 51
      Width = 85
      Height = 21
      TabOrder = 8
      Text = '1883'
    end
    object TopicsTxt: TMemo
      Left = 18
      Top = 99
      Width = 144
      Height = 104
      Lines.Strings = (
        'j5/estado/tela'
        'j5/estado/wifi'
        'j5/estado/bateria')
      TabOrder = 9
    end
    object Button5: TButton
      Left = 18
      Top = 209
      Width = 69
      Height = 25
      Caption = 'Subscribe'
      TabOrder = 10
    end
    object Button6: TButton
      Left = 93
      Top = 209
      Width = 69
      Height = 25
      Caption = 'Unsubscribe'
      TabOrder = 11
    end
    object TopicTxt: TEdit
      Left = 168
      Top = 102
      Width = 146
      Height = 21
      TabOrder = 12
    end
    object MsgBox: TMemo
      Left = 168
      Top = 134
      Width = 145
      Height = 69
      TabOrder = 13
    end
    object CMBox2: TCheckBox
      Left = 322
      Top = 197
      Width = 97
      Height = 17
      Caption = 'Client Monitor'
      Checked = True
      State = cbChecked
      TabOrder = 14
    end
    object BounceBox2: TCheckBox
      Left = 322
      Top = 181
      Width = 97
      Height = 17
      Caption = ' Local Bounce'
      TabOrder = 15
    end
    object CleanBox2: TCheckBox
      Left = 322
      Top = 148
      Width = 97
      Height = 17
      Caption = 'Clean'
      TabOrder = 16
    end
    object Button4: TButton
      Left = 361
      Top = 50
      Width = 53
      Height = 23
      Caption = 'Update'
      TabOrder = 17
    end
    object RetainBox: TCheckBox
      Left = 322
      Top = 163
      Width = 97
      Height = 17
      Caption = 'Retain'
      TabOrder = 18
    end
    object Button8: TButton
      Left = 143
      Top = 235
      Width = 50
      Height = 25
      Caption = 'Send'
      TabOrder = 19
    end
    object Button9: TButton
      Left = 356
      Top = 214
      Width = 50
      Height = 25
      Caption = 'Off'
      TabOrder = 20
    end
    object JTxt: TEdit
      Left = 261
      Top = 216
      Width = 33
      Height = 21
      TabOrder = 21
      Text = '3'
    end
    object Edit1: TEdit
      Left = 205
      Top = 239
      Width = 89
      Height = 21
      TabOrder = 22
      Text = '3'
    end
    object Button10: TButton
      Left = 304
      Top = 214
      Width = 50
      Height = 25
      Caption = 'On'
      TabOrder = 23
    end
    object AddrTxt: TEdit
      Left = 268
      Top = 24
      Width = 129
      Height = 21
      TabOrder = 24
      Text = '127.0.0.1'
      OnDblClick = AddrTxtDblClick
    end
  end
  object TTClient: TMQTTClient
    KeepAlive = 10
    MaxRetries = 8
    RetryTime = 60
    Clean = True
    Broker = True
    AutoSubscribe = False
    Username = 'admin'
    Password = 'password'
    Host = '127.0.0.1'
    Port = 1883
    LocalBounce = False
    Left = 324
    Top = 78
  end
end
