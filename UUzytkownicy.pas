unit UUzytkownicy;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, UData, Vcl.StdCtrls, Uzytkownik, System.Generics.Collections, UNowyUzytkownik,
  Data.DB, Vcl.DBGrids;

type
  TUzytkownicy = class(TForm)
    dbgrd1: TDBGrid;
    btnDodaj: TButton;
    btnUsun: TButton;
    btnEdytuj: TButton;
    btnAnuluj: TButton;
    lbl1: TLabel;
    edtszukaj: TEdit;
    lbl2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnDodajClick(Sender: TObject);
    procedure btnAnulujClick(Sender: TObject);
    procedure btnEdytujClick(Sender: TObject);
    procedure btnUsunClick(Sender: TObject);
    procedure edtszukajChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Uzytkownicy: TUzytkownicy;
  wybranyUzytkownik : TUzytkownik;

implementation

{$R *.dfm}

uses UEdytujUzytkownika, ULogowanie, UMain;



procedure TUzytkownicy.btnAnulujClick(Sender: TObject);
begin
  self.Close;
end;

procedure TUzytkownicy.btnDodajClick(Sender: TObject);
begin
 NowyUzytkownik.ShowModal;
end;

procedure TUzytkownicy.btnEdytujClick(Sender: TObject);
begin
  wybranyUzytkownik := TUzytkownik.Create(DataModule1.zqry.FieldByName('iduzytkownicy').AsInteger,DataModule1.zqry.FieldByName('login').AsString,DataModule1.zqry.FieldByName('haslo').AsString,DataModule1.zqry.FieldByName('imie').AsString,DataModule1.zqry.FieldByName('nazwisko').AsString,DataModule1.zqry.FieldByName('administrator').AsBoolean,DataModule1.zqry.FieldByName('liczba_zamowien').AsInteger);
  EdytujUzytkownika.FormShow(wybranyUzytkownik);
  EdytujUzytkownika.ShowModal;
  end;

procedure TUzytkownicy.btnUsunClick(Sender: TObject);
begin
  wybranyUzytkownik := TUzytkownik.Create(DataModule1.zqry.FieldByName('iduzytkownicy').AsInteger,DataModule1.zqry.FieldByName('login').AsString,DataModule1.zqry.FieldByName('haslo').AsString,DataModule1.zqry.FieldByName('imie').AsString,DataModule1.zqry.FieldByName('nazwisko').AsString,DataModule1.zqry.FieldByName('administrator').AsBoolean,DataModule1.zqry.FieldByName('liczba_zamowien').AsInteger);
  if wybranyUzytkownik.iduzytkownicy = Logowanie.iduzytkownicy then
  begin
    ShowMessage('Nie mo�esz usun�� w�asnego konta');
  end
  else
  begin
    if Application.MessageBox('Czy napewno chcesz usun�� u�ytkownika ', 'Uwaga!',
      MB_YESNO + MB_ICONWARNING + MB_DEFBUTTON2) = IDYES then
    begin
      wybranyUzytkownik.Delete;
    end;
    with DataModule1.zqry, SQL do
      begin
          Close;
          Clear;
          Add('SELECT * from public.uzytkownicy ORDER BY login');
          Open;
      end;
    wybranyUzytkownik.Free;
  end;
end;

procedure TUzytkownicy.edtszukajChange(Sender: TObject);
begin
 if edtszukaj.Text='' then
 begin
   DataModule1.zqry.Filtered := False;
 end
 else
 begin
  DataModule1.zqry.FilterOptions:=[foCaseInsensitive];
   DataModule1.zqry.Filter :='login like '+QuotedStr('' + edtszukaj.Text + '*');
   DataModule1.zqry.Filtered := True;
 end;

end;

procedure TUzytkownicy.FormShow(Sender: TObject);
begin
Uzytkownicy.Top := main.Top + 50;
Uzytkownicy.Left := main.Left + 50;
with DataModule1.zqry, SQL do
  begin
      Close;
      Clear;
      Add('SELECT * from public.uzytkownicy ORDER BY login');
      Open;
      First;
  end;
end;

end.
