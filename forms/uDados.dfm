object Dm: TDm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 405
  Width = 547
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=C:\AtendTecnologia\Dados\BANCOLOJA.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Port=3050'
      'CharacterSet=WIN1252'
      'DriverID=FB')
    LoginPrompt = False
    Transaction = FDTransaction
    Left = 72
    Top = 128
  end
  object qryVendedor: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM CADASTROVENDEDOR'
      'WHERE STATUSVENDEDOR = '#39'1'#39)
    Left = 144
    Top = 16
  end
  object FDTransaction: TFDTransaction
    Connection = Conexao
    Left = 72
    Top = 192
  end
end
