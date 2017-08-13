unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.IniFiles,UUzytkownicy,UProdukty,Uzytkownik;

type
  TMain = class(TForm)
    mmglowne: TMainMenu;
    Program1: TMenuItem;
    Wyloguj1: TMenuItem;
    Wyjd1: TMenuItem;
    Zamownia1: TMenuItem;
    Uzytkownicy1: TMenuItem;
    Produkty1: TMenuItem;
    procedure m(Sender: TObject);
    procedure Wyjd1Click(Sender: TObject);
    procedure Uzytkownicy1Click(Sender: TObject);
    procedure Produkty1Click(Sender: TObject);
    procedure Zamownia1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    uzzalogowany : Tuzytkownik;
  end;

var
  Main: TMain;
  ini : TINIFile;
  fUzytkownicy : TUzytkownicy;
implementation

{$R *.dfm}

uses ULogowanie, UZamowienia;

procedure TMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var i : Integer;
begin
  Application.Terminate;
end;

procedure TMain.FormResize(Sender: TObject);
var i : Integer;
begin
  for i := 0 to MDIChildCount - 1 do
  begin
    MDIChildren[i].Left := 0;
    MDIChildren[i].Top := 0;
    MDIChildren[i].Width := Main.ClientWidth - 4;
    MDIChildren[i].Height := Main.ClientHeight - 4;
  end;

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
var i : Word;
begin
  if MDIChildCount>0 then
  begin
   for i := MDIChildCount-1 downto 0 do
    begin
         Self.MDIChildren[i].Close;
    end;
  end;
  Self.Hide;
  uzzalogowany := nil;
  Logowanie.Show;

end;

procedure TMain.Produkty1Click(Sender: TObject);
var i : Word;
begin
  mmglowne.Items[3].Enabled := False;
  Produkty := TProdukty.Create(self);
  Produkty.Visible := True;
  Produkty.Left := 0;
    Produkty.Top := 0;
    Produkty.Width := Main.ClientWidth - 4;
    Produkty.Height := Main.ClientHeight - 4;

end;

procedure TMain.Uzytkownicy1Click(Sender: TObject);
var i : Word;
begin
  Main.mmglowne.Items[2].Enabled := false;
  Uzytkownicy := TUzytkownicy.Create(self);
  Uzytkownicy.Visible := True;
 Uzytkownicy.Left := 0;
    Uzytkownicy.Top := 0;
    Uzytkownicy.Width := Main.ClientWidth - 4;
    Uzytkownicy.Height := Main.ClientHeight - 4;


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
var i : Word;
begin
  
  Zamowienia := TZamowienia.Create(self);
  Zamowienia.Visible := True;
  Zamowienia.Left := 0;
  Zamowienia.Top := 0;
  Zamowienia.Width := Main.ClientWidth - 4;
  Zamowienia.Height := Main.ClientHeight - 4;
end;

end.
