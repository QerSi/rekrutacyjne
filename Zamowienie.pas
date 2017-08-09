unit Zamowienie;

interface
uses
Data.DB,UData,dialogs,Pozycja;

type
  TZamowienie = class

  public
   Data_zamowienia : string;
   idzamowienia : Integer;
   idprodukty : Integer;
   iduzytkownicy: Integer;
   idstatusy: Integer;
   numer_zamowienia : Integer;
   pozycje : array of TPozycja;




  constructor Create(Data_zamowienia : string; idzamowienia: Integer; idprodukty: Integer; iduzytkownicy:Integer; idstatusy: integer; numer_zamowienia:Integer); overload;
  //procedure Insert;
  procedure Update;
  procedure Delete;
  //destructor Destroy(); override;

end;

implementation
constructor TZamowienie.Create(Data_zamowienia : string; idzamowienia: Integer; idprodukty: Integer; iduzytkownicy:Integer; idstatusy: integer; numer_zamowienia:Integer);
begin
   Self.Data_zamowienia := Data_zamowienia;
   Self.idzamowienia := idzamowienia;
   Self.idprodukty := idprodukty;
   Self.iduzytkownicy := iduzytkownicy;
   Self.idstatusy := idstatusy;
   Self.numer_zamowienia := numer_zamowienia;
end;


procedure TZamowienie.Update;
begin
  with DataModule1.zqryinsert, SQL do
  begin
      Close;
      Clear;
      Add('UPDATE zamowienia SET idstatusy=:idstat where numer_zamowienia=:num');
      ParamByName('idstat').AsInteger:=Self.idstatusy;
      ParamByName('num').AsInteger:=Self.numer_zamowienia;
      ExecSQL;
      Close;
  end;
end;

procedure TZamowienie.Delete;
begin
   with DataModule1.zqryinsert, SQL do
  begin
      Close;
      Clear;
      Add('Delete From zamowienia where numer_zamowienia=:numer');
      ParamByName('numer').AsInteger:=Self.numer_zamowienia;
      ExecSQL;
      Close;
  end;
end;
end.
