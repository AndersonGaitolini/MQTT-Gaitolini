program ProjectMQTT;

uses
  Vcl.Forms,
  uMQTTServer in '..\MQTTX\BROKER\uMQTTServer.pas' {ServerMQTT},
  uBrokers in '..\MQTTX\BROKER\uBrokers.pas' {BrokerForm},
  uClient in '..\MQTTX\CLIENT\uClient.pas' {ClientMQTT},
  uUtils in '..\..\UTILS\uUtils.pas',
  uMainMQTT in 'uMainMQTT.pas' {MainMQTT},
  Lca.Orm.Atributos in '..\..\Frameworks\ORM-Basico-Delphi\OrmBasico\Classes\Lca.Orm.Atributos.pas',
  Lca.Orm.Base in '..\..\Frameworks\ORM-Basico-Delphi\OrmBasico\Classes\Lca.Orm.Base.pas',
  Lca.Orm.Comp.FireDac in '..\..\Frameworks\ORM-Basico-Delphi\OrmBasico\Classes\Lca.Orm.Comp.FireDac.pas',
  Lca.Orm.GerarClasse in '..\..\Frameworks\ORM-Basico-Delphi\OrmBasico\Classes\Lca.Orm.GerarClasse.pas',
  Lca.Orm.GerarClasseFireDac in '..\..\Frameworks\ORM-Basico-Delphi\OrmBasico\Classes\Lca.Orm.GerarClasseFireDac.pas',
  DataModuleMQTT in 'DataModuleMQTT.pas' {DataModule1: TDataModule},
  Lca.Orm.GerarClasse.BancoFirebird in '..\..\Frameworks\ORM-Basico-Delphi\OrmBasico\Classes\Lca.Orm.GerarClasse.BancoFirebird.pas',
  Lca.Orm.GerarClasse.BancoMSSQL in '..\..\Frameworks\ORM-Basico-Delphi\OrmBasico\Classes\Lca.Orm.GerarClasse.BancoMSSQL.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainMQTT, MainMQTT);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
