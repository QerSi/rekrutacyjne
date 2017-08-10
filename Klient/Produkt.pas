unit Produkt;

interface
uses
Data.DB,UData,dialogs;

type
  TProdukt = class

  public
  idprodukty : Integer;
  nazwa : string;
  cena : Double;
  opis : string;




  constructor Create(idprodukty : Integer; nazwa : string; cena : Double; opis:string); overload;
  procedure Insert;
  procedure Update;
  procedure Delete;
  //destructor Destroy(); override;

end;

implementation

constructor TProdukt.Create(idprodukty : Integer; nazwa : string; cena : Double; opis:string);
begin
  self.idprodukty := idprodukty;
  self.nazwa := nazwa;
  Self.cena := cena;
  Self.opis := opis;
end;

procedure TProdukt.Insert;
begin
  with DataModule1.zqryinsert, SQL do
  begin
      Close;
      Clear;
      Add('INSERT INTO produkty VALUES(:nazwa,:cena,:opis,default)');
      ParamByName('nazwa').AsString:=Self.nazwa;
      ParamByName('cena').AsFloat:=Self.cena;
      ParamByName('opis').AsString:=Self.opis;
      ExecSQL;
      Close;
  end;
end;

procedure Tprodukt.Update;
begin
   with DataModule1.zqryinsert, SQL do
  begin
      Close;
      Clear;
      Add('UPDATE produkty SET nazwa=:nazwa,cena=:cena,opis=:opis where idprodukty=:id');
      ParamByName('nazwa').AsString:=Self.nazwa;
      ParamByName('cena').AsFloat:=Self.cena;
      ParamByName('opis').AsString:=Self.opis;
      ParamByName('id').AsInteger:=Self.idprodukty;
      ExecSQL;
      Close;
  end;
end;

procedure TProdukt.Delete;
begin
  with DataModule1.zqryinsert, SQL do
  begin
      Close;
      Clear;
      Add('DELETE FROM produkty where idprodukty=:id');
      ParamByName('id').AsInteger:=Self.idprodukty;
      ExecSQL;
      Close;
  end;
end;



end.
