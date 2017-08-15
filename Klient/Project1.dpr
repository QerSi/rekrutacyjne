program Project1;

uses
  Vcl.Forms,
  ULogowanie in 'ULogowanie.pas' {Logowanie},
  UData in 'UData.pas' {DataModule1: TDataModule},
  UMain in 'UMain.pas' {Main},
  UNowyUzytkownik in 'UNowyUzytkownik.pas' {NowyUzytkownik},
  Uzytkownik in 'Uzytkownik.pas',
  UEdytujUzytkownika in 'UEdytujUzytkownika.pas' {EdytujUzytkownika},
  Produkt in 'Produkt.pas',
  UNowyProdukt in 'UNowyProdukt.pas' {NowyProdukt},
  UEdytujProdukt in 'UEdytujProdukt.pas' {EdytujProdukt},
  USzczegolyZamowienia in 'USzczegolyZamowienia.pas' {SzczegolyZamowienia},
  Pozycja in 'Pozycja.pas',
  UDodajPozycje in 'UDodajPozycje.pas' {DodajPozycje},
  FProdukty in 'FProdukty.pas' {Frame2: TFrame},
  FZamowienia in 'FZamowienia.pas' {Zamowienia: TFrame},
  Zamowienie in 'Zamowienie.pas',
  FUzytkownicy in 'FUzytkownicy.pas' {Uzytkownicy: TFrame},
  FRaportMsc in 'FRaportMsc.pas' {RaportMsc: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TLogowanie, Logowanie);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.ShowMainForm := False;
  Application.Run;
end.
