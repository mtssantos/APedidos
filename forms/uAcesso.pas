unit uAcesso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.DBCtrls,
  Data.DB, Vcl.Mask, Vcl.Imaging.pngimage, Vcl.TitleBarCtrls, midaslib;

type
  TFormLogin = class(TForm)
    pnl: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtSenha: TEdit;
    btn_entrar: TButton;
    ComboboxVendedor: TDBComboBox;
    Image1: TImage;
    titlebarpanel: TTitleBarPanel;
    Panel1: TPanel;
    lbl_version: TLabel;
    Panel2: TPanel;
    dsVend: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btn_entrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure RealizarLogin;
  public
    { Public declarations }
    procedure PuxarUser;
  end;

var
  FormLogin: TFormLogin;

implementation

{$R *.dfm}

uses uDados;


{ TFormLogin }



function FileVersion(const FileName: TFileName): String;
var
  VerInfoSize: Cardinal;
  VerValueSize: Cardinal;
  Dummy: Cardinal;
  PVerInfo: Pointer;
  PVerValue: PVSFixedFileInfo;
begin
  Result := '';
  VerInfoSize := GetFileVersionInfoSize(PChar(FileName), Dummy);
  GetMem(PVerInfo, VerInfoSize);
  try
    if GetFileVersionInfo(PChar(FileName), 0, VerInfoSize, PVerInfo) then
      if VerQueryValue(PVerInfo, '\', Pointer(PVerValue), VerValueSize) then
        with PVerValue^ do
          Result := Format('v%d.%d.%d.%d', [
            HiWord(dwFileVersionMS), //Major
            LoWord(dwFileVersionMS), //Minor
            HiWord(dwFileVersionLS), //Release
            LoWord(dwFileVersionLS)]); //Build
  finally
    FreeMem(PVerInfo, VerInfoSize);
  end;
end;

procedure TFormLogin.PuxarUser;
begin

end;


procedure TFormLogin.RealizarLogin;
var
  user, senha: string;
  index: Integer;
begin
 

end;



procedure TFormLogin.FormCreate(Sender: TObject);
begin
  lbl_version.Caption := 'Versão: ' + FileVersion(Application.ExeName);
end;

procedure TFormLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TFormLogin.FormShow(Sender: TObject);
begin
  PuxarUser;
end;

procedure TFormLogin.btn_entrarClick(Sender: TObject);
begin
 RealizarLogin;
end;

end.
