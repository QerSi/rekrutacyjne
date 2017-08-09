unit Uzytkownik;

interface
uses
Data.DB,UData,dialogs;

type
  TUzytkownik = class(TDataSet)

  public
  iduzytkownicy : Integer;
  login : String;
  haslo : String;
  imie  : String;
  nazwisko : String;
  zamowien : Integer;
  administrator : Boolean;


  constructor Create(Id : Integer; Log : string; Imie : string; Nazwisko : string; Adm : Boolean;zamowien : Integer);overload;
  constructor Create(Id : Integer; Log : string; haslo : string; Imie : string; Nazwisko : string; Adm : Boolean;zamowien : Integer); overload;
  procedure Insert;
  procedure Update;
  procedure Delete;
  //destructor Destroy(); override;

end;

implementation

constructor TUzytkownik.Create(Id : Integer; Log : string; Imie : string; Nazwisko : string; Adm : Boolean;zamowien : Integer);
begin
  Self.iduzytkownicy := Id;
  self.login := Log;
  self.haslo := ' ';
  self.imie := Imie;
  self.nazwisko := Nazwisko;
  Self.administrator := Adm;
  Self.zamowien := zamowien;

end;

constructor TUzytkownik.Create(Id : Integer; Log : string; haslo : string; Imie : string; Nazwisko : string; Adm : Boolean;zamowien : Integer);
begin
  Self.iduzytkownicy := Id;
  self.login := Log;
  self.haslo := haslo;
  self.imie := Imie;
  self.nazwisko := Nazwisko;
  Self.administrator := Adm;
  Self.zamowien := zamowien;

end;

procedure TUzytkownik.insert;
begin
  with DataModule1.zqryinsert, SQL do
  begin
      Close;
      Clear;
      Add('INSERT INTO uzytkownicy VALUES(:login,:haslo,:imie,:nazwisko,:administrator,0,default)');
      ParamByName('login').AsString:=Self.login;
      ParamByName('haslo').AsString:=Self.haslo;
      ParamByName('imie').AsString:=Self.imie;
      ParamByName('nazwisko').AsString:=Self.nazwisko;
      ParamByName('administrator').AsBoolean:=Self.administrator;
      ExecSQL;
      Close;
  end;
end;

procedure TUzytkownik.update;
begin
   with DataModule1.zqryinsert, SQL do
  begin
      Close;
      Clear;
      Add('UPDATE uzytkownicy SET login=:login,haslo=:haslo,imie=:imie,nazwisko=:nazwisko,administrator=:administrator,liczba_zamowien=:zamowien where iduzytkownicy=:id');
      ParamByName('login').AsString:=Self.login;
      ParamByName('haslo').AsString:=Self.haslo;
      ParamByName('imie').AsString:=Self.imie;
      ParamByName('nazwisko').AsString:=Self.nazwisko;
      ParamByName('zamowien').AsInteger:=Self.zamowien;
      ParamByName('administrator').AsBoolean:=Self.administrator;
      ParamByName('id').AsInteger:=Self.iduzytkownicy;
      ExecSQL;
      Close;
  end;
end;

procedure TUzytkownik.Delete;
begin
  with DataModule1.zqryinsert, SQL do
  begin
      Close;
      Clear;
      Add('DELETE FROM uzytkownicy where iduzytkownicy=:id');
      ParamByName('id').AsInteger:=Self.iduzytkownicy;
      ExecSQL;
      Close;
  end;
end;
end.
