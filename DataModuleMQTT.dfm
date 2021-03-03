object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 150
  Width = 215
  object conMQTT: TFDConnection
    Params.Strings = (
      'ConnectionDef=GaitoliniBD-MSSQL')
    Left = 24
    Top = 24
  end
end
