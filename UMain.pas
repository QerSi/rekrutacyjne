unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TMain = class(TForm)
    mmglowne: TMainMenu;
    Program1: TMenuItem;
    Wyloguj1: TMenuItem;
    Wyjd1: TMenuItem;
    Zamownia1: TMenuItem;
    Uzytkownicy1: TMenuItem;
    Produkty1: TMenuItem;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure m(Sender: TObject);
    procedure Wyjd1Click(Sender: TObject);
    procedure Uzytkownicy1Click(Sender: TObject);
    procedure Produkty1Click(Sender: TObject);
    procedure Zamownia1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

{$R *.dfm}

uses ULogowanie, UUzytkownicy, UProdukty, UZamowienia;

procedure TMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
Main.Hide;
Logowanie.Show;
end;

procedure TMain.m(Sender: TObject);
begin
  Main.Hide;
  Logowanie.Show;
  ShowMessage('Dopisz czyszczenie!');
end;

procedure TMain.Produkty1Click(Sender: TObject);
begin
  Produkty.ShowModal;
end;

procedure TMain.Uzytkownicy1Click(Sender: TObject);
begin
  Uzytkownicy.ShowModal;
end;

procedure TMain.Wyjd1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TMain.Zamownia1Click(Sender: TObject);
begin
  Zamowienia.ShowModal;
end;

end.
