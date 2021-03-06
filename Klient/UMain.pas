unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.IniFiles,Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, UData,Uzytkownik,ULogowanie,
  Produkt,Zamowienie,FZamowienia,FProdukty,FUzytkownicy,FRaportMsc,FRaportUzytkownik,FormBase;

type
  TMain = class(TFormBase)
    mmglowne: TMainMenu;
    Program1: TMenuItem;
    Wyloguj1: TMenuItem;
    Wyjd1: TMenuItem;
    Zamownia1: TMenuItem;
    Uzytkownicy1: TMenuItem;
    Produkty1: TMenuItem;
    pnlGlowny: TPanel;
    a1: TMenuItem;
    Raportmiesiczny: TMenuItem;
    Zamwienieuytkownika1: TMenuItem;
    procedure m(Sender: TObject);
    procedure Wyjd1Click(Sender: TObject);
    procedure Uzytkownicy1Click(Sender: TObject);
    procedure Produkty1Click(Sender: TObject);
    procedure Zamownia1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RaportmiesicznyClick(Sender: TObject);
    procedure Zamwienieuytkownika1Click(Sender: TObject);
  private
    { Private declarations }
  public
    FZamowienia : TZamowienia;
    FProdukty : TFrame2;
    Fuzytkownicy : TUzytkownicy;
    FRapMsc : TRaportMsc;
    uzzalogowany : Tuzytkownik;
    FRapUz : TFRAportUzyt;
  end;

var
  Main: TMain;
  ini : TINIFile;
implementation

{$R *.dfm}

uses UEdytujProdukt;

procedure TMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Application.Terminate;
end;

procedure TMain.FormShow(Sender: TObject);
begin
  INI := TINIFile.Create(ExtractFilePath(Application.ExeName) + 'setup.ini');
       try
          Main.Left := INI.ReadInteger('Main', 'PositionLeft', 100);
          Main.Top := INI.ReadInteger('Main', 'PositionTop', 100);
          Main.Height := INI.ReadInteger('Main', 'height', 600);
          Main.Width := INI.ReadInteger('Main', 'Width', 800);
          finally
            INI.Free;
          end;

end;

procedure TMain.m(Sender: TObject);
begin
  Self.Hide;
  uzzalogowany := nil;
  Logowanie.Show;
end;

procedure TMain.Produkty1Click(Sender: TObject);
begin
 try
  with DataModule1.zqryprodukty, SQL do
  begin
      Close;
      Clear;
      Add('SELECT * from public.produkty ORDER BY nazwa');
      Open;
      First;
  end;
  FProdukty.Free;
  FProdukty := TFrame2.Create(self);
  FProdukty.Parent:= pnlGlowny;
  FProdukty.Align:= alClient;
 except
    self.Przycisk('B��d po��czenia z baz�',mtError);
 end;
end;

procedure TMain.RaportmiesicznyClick(Sender: TObject);
begin
  try
     with DataModule1.zqryRaportMsc, SQL do
    begin
      Close;
      Clear;
      Add('select login,imie,nazwisko,numer_zamowienia,data_zamowienia,idstatusy, SUM(produkty.cena) ');
      Add('From zamowienia,uzytkownicy,produkty WHERE data_zamowienia <'+QuotedStr('2017-12-12')+'AND zamowienia.idprodukty=produkty.idprodukty AND zamowienia.iduzytkownicy=uzytkownicy.iduzytkownicy');
      Add('GROUP BY login,imie,nazwisko,numer_zamowienia,data_zamowienia,idstatusy');
      Open;
    end;
    FRapMsc.Free;
    FRapMsc := TRaportMsc.Create(self);
    FRapMsc.Parent:= pnlGlowny;
    FRapMsc.Align:= alClient;
  except
      self.Przycisk('B��d po��czenia z baz�',mtError);
  end;
end;

procedure TMain.Uzytkownicy1Click(Sender: TObject);
begin

try
  with DataModule1.zqry, SQL do
  begin
      Close;
      Clear;
      Add('SELECT * from public.uzytkownicy ORDER BY login');
      Open;
      First;
  end;
  Fuzytkownicy.Free;
  Fuzytkownicy := TUzytkownicy.Create(uzzalogowany);
  Fuzytkownicy.setUZalogowany(uzzalogowany);
  Fuzytkownicy.Parent:= pnlGlowny;
  Fuzytkownicy.Align:= alClient; 
except
    self.Przycisk('B��d po��czenia z baz�',mtError);
end;


end;
procedure TMain.Wyjd1Click(Sender: TObject);
begin
  INI := TINIFile.Create(ExtractFilePath(Application.ExeName) + 'setup.ini');
   try
        INI.WriteInteger('Main', 'PositionTop', Main.Top);
        INI.WriteInteger('Main', 'PositionLeft', Main.Left);
        INI.WriteInteger('Main', 'height', Main.Height);
        INI.WriteInteger('Main', 'Width', Main.Width);
      finally
        INI.Free;
      end;
  Application.Terminate;
end;

procedure TMain.Zamownia1Click(Sender: TObject);
begin
  try
     with DataModule1.zqryzam, SQL do
      begin
        Close;
        Clear;
        Add('select distinct on (z.numer_zamowienia) z.idzamowienia, z.idprodukty, z.iduzytkownicy, z.idstatusy, z.numer_zamowienia,z.data_zamowienia,u.login,u.imie,u.nazwisko,s.idstatusy,s.status,p.nazwa,p.cena,p.idprodukty'
        +' FROM zamowienia AS z,statusy AS s,uzytkownicy AS u,produkty AS p'
        +' WHERE z.iduzytkownicy=u.iduzytkownicy AND z.idstatusy = s.idstatusy AND z.idprodukty = p.idprodukty');
        Open;
      end;
      FZamowienia.Free;
      FZamowienia := TZamowienia.Create(pnlGlowny);
      FZamowienia.Parent:= pnlGlowny;
      FZamowienia.Align:= alClient;
  except
    self.Przycisk('B��d po��czenia z baz�',mtError);
  end;
end;

procedure TMain.Zamwienieuytkownika1Click(Sender: TObject);
begin
  try
    with DataModule1.zqry, SQL do
    begin
        Close;
        Clear;
        Add('SELECT * from public.uzytkownicy');
        Open;
    end;

  except
    self.Przycisk('B��d po��czenia z baz�',mtError);
  end;
      FRapUz.Free;
    FRapUz := TFRAportUzyt.Create(pnlGlowny);
    FRapUz.Parent:= pnlGlowny;
    FRapUz.Align:= alClient;
end;

end.
