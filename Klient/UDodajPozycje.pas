unit UDodajPozycje;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids,UData, Vcl.DBCtrls, USzczegolyZamowienia, UZamowienia, Pozycja;

type
  TDodajPozycje = class(TForm)
    dbgrd: TDBGrid;
    lbl1: TLabel;
    edtIlosc: TEdit;
    btnDodaj: TButton;
    btnAnuluj: TButton;
    dbmmoOpis: TDBMemo;
    procedure FormCreate(Sender: TObject);
    procedure edtIloscChange(Sender: TObject);
    procedure btnDodajClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DodajPozycje: TDodajPozycje;
  wybranaPozycja : TPozycja;
implementation

{$R *.dfm}

procedure TDodajPozycje.btnDodajClick(Sender: TObject);
var i : integer;
begin
try
  for I := 1 to StrToInt(edtIlosc.Text) do
 begin
 wybranaPozycja:= TPozycja.Create(DataModule1.zqryprodukty.FieldByName('idprodukty').AsInteger,DataModule1.zqryprodukty.FieldByName('nazwa').AsString,DataModule1.zqryprodukty.FieldByName('cena').AsFloat,1);
 wybraneZamowienie.Insert(wybranaPozycja);
 end;
 ShowMessage('Dodanie zako�czone sukcesem');
 self.Close;
 DataModule1.zqryszczegoly.Refresh;
except
  ShowMessage('Wyst�pi� b��d');
end;

end;

procedure TDodajPozycje.edtIloscChange(Sender: TObject);
begin

  if (edtIlosc.Text<>'') and (StrToInt(edtIlosc.Text)<1) then
  begin
    edtIlosc.Text := '1';
  end;
end;

procedure TDodajPozycje.FormCreate(Sender: TObject);
begin
edtIlosc.Text := '1';
end;

procedure TDodajPozycje.FormShow(Sender: TObject);
begin
  with DataModule1.zqryprodukty, SQL do
  begin
      Close;
      Clear;
      Add('SELECT * from public.produkty ORDER BY nazwa');
      Open;
      First;
  end;
end;

end.
