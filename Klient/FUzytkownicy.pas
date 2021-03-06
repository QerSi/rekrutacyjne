unit FUzytkownicy;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, UData, Vcl.StdCtrls, Uzytkownik, System.Generics.Collections, UNowyUzytkownik,
  Data.DB, Vcl.DBGrids,FrameBase, Vcl.ExtCtrls;

type
  TUzytkownicy = class(TFrame)
    lbl2: TLabel;
    dbgrd1: TDBGrid;
    btnDodaj: TButton;
    btnUsun: TButton;
    btnEdytuj: TButton;
    edtszukaj: TEdit;
    pnl1: TPanel;
    lbl1: TLabel;
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

uses UEdytujUzytkownika, UMain;


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
  if DataModule1.zqry.RecordCount<>0 then
  begin
  wybranyUzytkownik := TUzytkownik.Create(DataModule1.zqry.FieldByName('iduzytkownicy').AsInteger,DataModule1.zqry.FieldByName('login').AsString,DataModule1.zqry.FieldByName('haslo').AsString,DataModule1.zqry.FieldByName('imie').AsString,DataModule1.zqry.FieldByName('nazwisko').AsString,DataModule1.zqry.FieldByName('administrator').AsBoolean,DataModule1.zqry.FieldByName('liczba_zamowien').AsInteger);
  EdytujUzytkownika := TEdytujUzytkownika.Create(wybranyUzytkownik);
  EdytujUzytkownika.ShowModal;;
  end;
end;

procedure TUzytkownicy.btnUsunClick(Sender: TObject);
begin
  wybranyUzytkownik := TUzytkownik.Create(DataModule1.zqry.FieldByName('iduzytkownicy').AsInteger,DataModule1.zqry.FieldByName('login').AsString,DataModule1.zqry.FieldByName('haslo').AsString,DataModule1.zqry.FieldByName('imie').AsString,DataModule1.zqry.FieldByName('nazwisko').AsString,DataModule1.zqry.FieldByName('administrator').AsBoolean,DataModule1.zqry.FieldByName('liczba_zamowien').AsInteger);
  if wybranyUzytkownik.iduzytkownicy = uzzalogowany.iduzytkownicy then
  begin
    main.Przycisk('nie mozna usun�� w�asnego konta',mtInformation);
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
