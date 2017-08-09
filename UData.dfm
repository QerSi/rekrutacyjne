object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 383
  Width = 508
  object ZCon: TZConnection
    ControlsCodePage = cCP_UTF16
    ClientCodepage = 'UTF8'
    Catalog = ''
    Properties.Strings = (
      'codepage=UTF8'
      'controls_cp=CP_UTF16')
    Connected = True
    HostName = 'localhost'
    Port = 5432
    Database = 'zad_rekr'
    User = 'postgres'
    Password = 'Haslo123'
    Protocol = 'postgresql-9'
    LibraryLocation = 
      'C:\Users\wisni\Desktop\postgresql-9.5.7-1-windows-binaries\pgsql' +
      '\bin\libpq.dll'
    Left = 16
  end
  object zqry: TZQuery
    Connection = ZCon
    SQL.Strings = (
      'select * from public.uzytkownicy')
    Params = <>
    Left = 72
    object zqry_iduzytkownicy: TIntegerField
      FieldName = 'iduzytkownicy'
      Required = True
    end
    object zqry_login: TWideStringField
      FieldName = 'login'
      Required = True
    end
    object zqry_haslo: TWideStringField
      FieldName = 'haslo'
      Required = True
      Size = 32
    end
    object zqry_imie: TWideStringField
      FieldName = 'imie'
      Required = True
    end
    object zqry_nazwisko: TWideStringField
      FieldName = 'nazwisko'
      Required = True
      Size = 30
    end
    object zqry_administrator: TBooleanField
      FieldName = 'administrator'
      Required = True
    end
    object zqry_liczba_zamowien: TIntegerField
      FieldName = 'liczba_zamowien'
      Required = True
    end
  end
  object ds: TDataSource
    DataSet = zqry
    Left = 120
  end
  object zqryinsert: TZQuery
    Connection = ZCon
    SQL.Strings = (
      'select login from uzytkownicy')
    Params = <>
    DataSource = dsinsert
    Left = 408
    Top = 8
  end
  object dsinsert: TDataSource
    Left = 456
    Top = 8
  end
  object zqryprodukty: TZQuery
    Connection = ZConprodukty
    SQL.Strings = (
      'select * from public.produkty')
    Params = <>
    Left = 80
    Top = 96
    object nazwa: TWideStringField
      FieldName = 'nazwa'
      Required = True
      Size = 50
    end
    object cena: TFloatField
      FieldName = 'cena'
      Required = True
    end
    object opis: TWideStringField
      FieldName = 'opis'
      Size = 100
    end
    object idprodukty: TIntegerField
      FieldName = 'idprodukty'
      Required = True
    end
  end
  object dsprodukty: TDataSource
    DataSet = zqryprodukty
    Left = 136
    Top = 96
  end
  object ZConprodukty: TZConnection
    ControlsCodePage = cCP_UTF16
    ClientCodepage = 'UTF8'
    Catalog = ''
    Properties.Strings = (
      'codepage=UTF8'
      'controls_cp=CP_UTF16')
    Connected = True
    HostName = 'localhost'
    Port = 5432
    Database = 'zad_rekr'
    User = 'postgres'
    Password = 'Haslo123'
    Protocol = 'postgresql-9'
    LibraryLocation = 
      'C:\Users\wisni\Desktop\postgresql-9.5.7-1-windows-binaries\pgsql' +
      '\bin\libpq.dll'
    Left = 16
    Top = 96
  end
  object ZConzamowienia: TZConnection
    ControlsCodePage = cCP_UTF16
    ClientCodepage = 'UTF8'
    Catalog = ''
    Properties.Strings = (
      'codepage=UTF8'
      'controls_cp=CP_UTF16')
    Connected = True
    HostName = 'localhost'
    Port = 5432
    Database = 'zad_rekr'
    User = 'postgres'
    Password = 'Haslo123'
    Protocol = 'postgresql-9'
    LibraryLocation = 
      'C:\Users\wisni\Desktop\postgresql-9.5.7-1-windows-binaries\pgsql' +
      '\bin\libpq.dll'
    Left = 8
    Top = 168
  end
  object zqryzam: TZQuery
    Connection = ZConzamowienia
    Active = True
    SQL.Strings = (
      
        'select distinct on (z.numer_zamowienia) z.idzamowienia, z.idprod' +
        'ukty, z.iduzytkownicy, z.idstatusy, z.numer_zamowienia,z.data_za' +
        'mowienia,u.login,u.imie,u.nazwisko,s.idstatusy,s.status,p.nazwa,' +
        'p.cena,p.idprodukty FROM zamowienia AS z,statusy AS s,uzytkownic' +
        'y AS u,produkty AS p'
      
        'WHERE z.iduzytkownicy=u.iduzytkownicy AND z.idstatusy = s.idstat' +
        'usy AND z.idprodukty = p.idprodukty')
    Params = <>
    Left = 80
    Top = 168
    object intgrfldzqryzamidzamowienia: TIntegerField
      FieldName = 'idzamowienia'
      Required = True
    end
    object intgrfldzqryzamidprodukty: TIntegerField
      FieldName = 'idprodukty'
    end
    object intgrfldzqryzamiduzytkownicy: TIntegerField
      FieldName = 'iduzytkownicy'
      Required = True
    end
    object intgrfldzqryzamidstatusy: TIntegerField
      FieldName = 'idstatusy'
      Required = True
    end
    object intgrfld_zamowienia: TIntegerField
      FieldName = 'numer_zamowienia'
    end
    object dtfld_zamowienia: TDateField
      FieldName = 'data_zamowienia'
      Required = True
    end
    object wdstrngfldzqryzamlogin: TWideStringField
      FieldName = 'login'
      Required = True
    end
    object wdstrngfldzqryzamimie: TWideStringField
      FieldName = 'imie'
      Required = True
    end
    object wdstrngfldzqryzamnazwisko: TWideStringField
      FieldName = 'nazwisko'
      Required = True
      Size = 30
    end
    object intgrfld_1: TIntegerField
      FieldName = 'idstatusy_1'
      Required = True
    end
    object wdstrngfldzqryzamstatus: TWideStringField
      FieldName = 'status'
      Required = True
    end
    object wdstrngfldzqryzamnazwa: TWideStringField
      FieldName = 'nazwa'
      Required = True
      Size = 50
    end
    object fltfldzqryzamcena: TFloatField
      FieldName = 'cena'
      Required = True
    end
    object intgrfld_11: TIntegerField
      FieldName = 'idprodukty_1'
      Required = True
    end
  end
  object dszam: TDataSource
    DataSet = zqryzam
    Left = 136
    Top = 184
  end
  object zqryszczegoly: TZQuery
    Connection = ZConzamowienia
    SQL.Strings = (
      
        'select produkty.nazwa, produkty.cena, COUNT(zamowienia.idprodukt' +
        'y) From produkty,zamowienia WHERE zamowienia.idprodukty=produkty' +
        '.idprodukty AND zamowienia.numer_zamowienia=1 GROUP BY produkty.' +
        'nazwa, produkty.cena;')
    Params = <>
    Left = 80
    Top = 264
    object wdstrngfldzqryszczegolynazwa: TWideStringField
      FieldName = 'nazwa'
      Required = True
      Size = 50
    end
    object fltfldzqryszczegolycena: TFloatField
      FieldName = 'cena'
      Required = True
    end
    object lrgntfldzqryszczegolycount: TLargeintField
      FieldName = 'count'
      ReadOnly = True
    end
  end
  object dsszczegoly: TDataSource
    DataSet = zqryszczegoly
    Left = 136
    Top = 272
  end
  object zqrystatusy: TZQuery
    Connection = ZConzamowienia
    SQL.Strings = (
      'select * from statusy Order By idstatusy')
    Params = <>
    Left = 320
    Top = 232
    object wdstrngfldzqrystatusystatus: TWideStringField
      FieldName = 'status'
      Required = True
    end
    object intgrfldzqrystatusyidstatusy: TIntegerField
      FieldName = 'idstatusy'
      Required = True
    end
  end
  object dsstatusy: TDataSource
    DataSet = zqrystatusy
    Left = 376
    Top = 232
  end
end
