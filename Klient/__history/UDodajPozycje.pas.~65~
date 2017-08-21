unit UDodajPozycje;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids,UData, Vcl.DBCtrls, USzczegolyZamowienia, Pozycja,Zamowienie,FormBase;

type
  TDodajPozycje = class(TFormBase)
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
    procedure btnAnulujClick(Sender: TObject);

  private
    wybraneZamowienie : TZamowienie;
  public
    constructor Create(AOwner: TComponent); reintroduce; overload;
    constructor Create(wybraneZamowienie : TZamowienie); reintroduce; overload;
  end;

var
  DodajPozycje: TDodajPozycje;
  wybranaPozycja : TPozycja;

implementation

{$R *.dfm}

constructor TDodajPozycje.Create(AOwner: TComponent);
begin
inherited;
end;

constructor TDodajPozycje.Create(wybraneZamowienie : TZamowienie);
begin
inherited Create(Application);
Self.wybraneZamowienie := wybraneZamowienie;
end;

procedure TDodajPozycje.btnAnulujClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TDodajPozycje.btnDodajClick(Sender: TObject);
begin
try
 DodajPozycje.Enabled := False;
 wybranaPozycja:= TPozycja.Create(DataModule1.zqryprodukty.FieldByName('idprodukty').AsInteger,DataModule1.zqryprodukty.FieldByName('nazwa').AsString,DataModule1.zqryprodukty.FieldByName('cena').AsFloat,StrToInt(edtIlosc.Text));
 wybraneZamowienie.Insert(wybranaPozycja);
 Przycisk('Dodawanie zakoñczone sukcesem', mtConfirmation);
 DodajPozycje.Enabled := True;
 self.Close;
 DataModule1.zqryszczegoly.Refresh;
except
  DodajPozycje.Enabled := True;
  Przycisk('B³¹d', mtError);
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

  edtIlosc.Text :='1';
  DataModule1.zqryprodukty.Refresh;
end;

end.
