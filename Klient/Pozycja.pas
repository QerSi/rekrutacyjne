unit Pozycja;

interface
uses
Data.DB,UData,dialogs,Produkt;

type
  TPozycja = class

  public
   idpozycje : Integer;
   nazwa : string;
   cena : Double;
   ilosc : Integer;
   waro�� : Double;





  constructor Create(idpozycje : Integer;nazwa : string; cena : Double ; ilosc : Integer);
  procedure DeleteNumer(numer : Integer);
  procedure Insert(iduzytkownicy,idstatusy,numer_zamowienia : Integer;data:string);
  procedure AktualizujWartosc;

end;

implementation
 constructor TPozycja.Create(idpozycje : Integer;nazwa: string; cena: Double; ilosc: Integer);
 begin
   Self.idpozycje := idpozycje;
   self.nazwa := nazwa;
   Self.cena := cena;
   Self.ilosc := ilosc;
   self.waro�� := cena*ilosc;
 end;

 procedure TPozycja.DeleteNumer(numer: Integer);
 begin
  with DataModule1.zqryinsert, SQL do
  begin
      Close;
      Clear;
      Add('DELETE FROM zamowienia WHERE idzamowienia = any (array(SELECT idzamowienia FROM zamowienia where numer_zamowienia=:numer and idprodukty=:id LIMIT 1 ))');
      ParamByName('numer').AsInteger:=numer;
      ParamByName('id').AsInteger:=Self.idpozycje;
      ExecSQL;
      Close;
  end;
 end;

 procedure TPozycja.Insert(iduzytkownicy,idstatusy,numer_zamowienia : Integer;data:string);
 begin
   with DataModule1.zqryinsert, SQL do
  begin
      Close;
      Clear;
      Add('INSERT INTO zamowienia VALUES(:data,default,:idprodukty,:iduzytkownicy,:idstatusy,:numer)');
      ParamByName('idprodukty').AsInteger:=Self.idpozycje;
      ParamByName('iduzytkownicy').AsInteger:=iduzytkownicy;
      ParamByName('idstatusy').AsInteger := idstatusy;
      ParamByName('numer').AsInteger := numer_zamowienia;
      ParamByName('data').AsString := data;
      ExecSQL;
      Close;
  end;
 end;

 procedure TPozycja.AktualizujWartosc;
 begin
  self.waro�� := Self.cena*self.ilosc;
 end;


end.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         