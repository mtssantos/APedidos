unit ulib;

interface
uses IniFIles, System.SysUtils, Vcl.Forms;
    procedure SetValorIni(pLocal, pSessao, pSubSessao: string; pValor: string);
    function GetValorIni(pLocal, pSessao, pSubSessao: string): string;


implementation
  procedure SetValorIni(pLocal, pSessao, pSubSessao: string; pValor: string);
  var
  vArquivo: TIniFile;
  begin
   //Processo de "criação" do arquivo .ini
   vArquivo := TIniFile.Create(pLocal);
   //Escrevendo no Arquivo .ini
   vArquivo.WriteString(pSessao, pSubSessao, pValor);
   //Liberando o arquivo da memória para ter melhor funcionamento
   vArquivo.Free;

  end;

function GetValorIni(pLocal, pSessao, pSubSessao: string): string;
var
vArquivo: TIniFile;
begin
    //Processo de "criação" do arquivo ini
    vArquivo := TIniFile.Create(pLocal);
    //Lendo o arquivo .ini com os parametros pSessao, pSubsessao e se nao encontrar define nulo
    Result := vArquivo.ReadString(pSessao, pSubSessao, '');
    //Liberando o arquivo da memória para ter melhor funcionamento
    vArquivo.Free;
end;

end.
