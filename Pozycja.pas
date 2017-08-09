unit Pozycja;

interface
uses
Data.DB,UData,dialogs;

type
  TPozycja = class

  public
   nazwa : string;
   cena : Double;
   iloœæ : Integer;
   waroœæ : Double;





  constructor Create(nazwa : string; cena : Double ; ilosc : Integer);

end;

implementation
 constructor TPozycja.Create(nazwa: string; cena: Double; ilosc: Integer);
 begin
   self.nazwa := nazwa;
   Self.cena := cena;
   Self.iloœæ := ilosc;
   self.waroœæ := cena*ilosc;
 end;
end.
