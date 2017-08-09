program Project1;

uses
  Vcl.Forms,
  ULogowanie in 'ULogowanie.pas' {Logowanie},
  UData in 'UData.pas' {DataModule1: TDataModule},
  UMain in 'UMain.pas' {Main},
  UUzytkownicy in 'UUzytkownicy.pas' {Uzytkownicy},
  UNowyUzytkownik in 'UNowyUzytkownik.pas' {NowyUzytkownik},
  Uzytkownik in 'Uzytkownik.pas',
  UEdytujUzytkownika in 'UEdytujUzytkownika.pas' {EdytujUzytkownika},
  UProdukty in 'UProdukty.pas' {Produkty},
  Produkt in 'Produkt.pas',
  UNowyProdukt in 'UNowyProdukt.pas' {NowyProdukt},
  UEdytujProdukt in 'UEdytujProdukt.pas' {EdytujProdukt},
  UZamowienia in 'UZamowienia.pas' {Zamowienia},
  USzczegolyZamowienia in 'USzczegolyZamowienia.pas' {SzczegolyZamowienia},
  Zamowienie in 'Zamowienie.pas',
  Pozycja in 'Pozycja.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TLogowanie, Logowanie);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TUzytkownicy, Uzytkownicy);
  Application.CreateForm(TNowyUzytkownik, NowyUzytkownik);
  Application.CreateForm(TEdytujUzytkownika, EdytujUzytkownika);
  Application.CreateForm(TProdukty, Produkty);
  Application.CreateForm(TNowyProdukt, NowyProdukt);
  Application.CreateForm(TEdytujProdukt, EdytujProdukt);
  Application.CreateForm(TZamowienia, Zamowienia);
  Application.CreateForm(TSzczegolyZamowienia, SzczegolyZamowienia);
  Application.Run;
end.
