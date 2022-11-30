unit uDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Vcl.Forms;

type
  TDm = class(TDataModule)
    Conexao: TFDConnection;
    qryVendedor: TFDQuery;
    FDTransaction: TFDTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ConectaBanco;
  public
    { Public declarations }
  end;

var
  Dm: TDm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses ulib, uAcesso;

{$R *.dfm}

{ TDataModule1 }

procedure TDm.ConectaBanco;
begin
  try
   Conexao.Params.Database := GetValorIni(ExtractFilePath(Application.ExeName) + 'config.ini', 'CONFIGURACAO', 'BANCO_LOJA');
   Conexao.Connected := True;
  except on E: Exception do
    begin
      E.Create('Erro ao acessar o Banco de Dados.');
    end;
  end;
end;

procedure TDm.DataModuleCreate(Sender: TObject);
begin
  ConectaBanco;
end;

end.
