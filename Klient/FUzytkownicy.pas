unit FUzytkownicy;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, UData, Vcl.StdCtrls, Uzytkownik, System.Generics.Collections, UNowyUzytkownik,
  Data.DB, Vcl.DBGrids;

type
  TUzytkownicy = class(TFrame)
    lbl1: TLabel;
    lbl2: TLabel;
    dbgrd1: TDBGrid;
    btnDodaj: TButton;
    btnUsun: TButton;
    btnEdytuj: TButton;
    edtszukaj: TEdit;
    procedure btnDodajClick(Sender: TObject);
    procedure btnEdytujClick(Sender: TObject);
    procedure btnUsunClick(Sender: TObject);
    procedure setUZalogowany(uzzalogowany : TUzytkownik);
    procedure edtszukajChange(Sender: TObject);
  private
    wybranyUzytkownik : TUzytkownik;
    uzzalogowany : TUzytkownik;
  public


  end;

implementation

{$R *.dfm}

uses UEdytujUzytkownika;


procedure TUzytkownicy.setUZalogowany(uzzalogowany : TUzytkownik);
begin
   self.uzzalogowany := uzzalogowany
end;
procedure TUzytkownicy.btnDodajClick(Sender: TObject);
begin
  NowyUzytkownik := TNowyUzytkownik.Create(self);
  NowyUzytkownik.ShowModal;
end;

procedure TUzytkownicy.btnEdytujClick(Sender: TObject);
begin
  wybranyUzytkownik := TUzytkownik.Create(DataModule1.zqry.FieldByName('iduzytkownicy').AsInteger,DataModule1.zqry.FieldByName('login').AsString,DataModule1.zqry.FieldByName('haslo').AsString,DataModule1.zqry.FieldByName('imie').AsString,DataModule1.zqry.FieldByName('nazwisko').AsString,DataModule1.zqry.FieldByName('administrator').AsBoolean,DataModule1.zqry.FieldByName('liczba_zamowien').AsInteger);
  EdytujUzytkownika := TEdytujUzytkownika.Create(wybranyUzytkownik);
  EdytujUzytkownika.ShowModal;
end;

procedure TUzytkownicy.btnUsunClick(Sender: TObject);
begin
  wybranyUzytkownik := TUzytkownik.Create(DataModule1.zqry.FieldByName('iduzytkownicy').AsInteger,DataModule1.zqry.FieldByName('login').AsString,DataModule1.zqry.FieldByName('haslo').AsString,DataModule1.zqry.FieldByName('imie').AsString,DataModule1.zqry.FieldByName('nazwisko').AsString,DataModule1.zqry.FieldByName('administrator').AsBoolean,DataModule1.zqry.FieldByName('liczba_zamowien').AsInteger);
  if wybranyUzytkownik.iduzytkownicy = uzzalogowany.iduzytkownicy then
  begin
  with CreateMessageDialog('Nie mo�esz usun�� w�asnego konta',  mtInformation, [mbOK],  mbOK ) do
    try
      Position := poDesigned;
      Left:=Self.Left+(Self.Width-Width) Div 2;
      Top:=Self.Top+(Self.Height-Height) Div 2;
      ShowModal
    finally
      Free

    end;
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

end.
