unit FraportMsc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls,UData,DateUtils;

type
  TRaportMsc = class(TFrame)
    btnGeneruj: TButton;
    edtMiesiac: TEdit;
    edtRok: TEdit;
    dbgrd1: TDBGrid;
    procedure edtRokExit(Sender: TObject);
    procedure btnGenerujClick(Sender: TObject);
  private
    miesiac,rok : Integer;
    datakon, datapocz : TDate;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TRaportMsc.btnGenerujClick(Sender: TObject);
begin
  if edtRok.Text='' then
  begin
    edtRok.Text := IntToStr(YearOf(Date));
    rok :=  StrToInt(edtRok.Text);
  end;
  if edtMiesiac.Text='' then
  begin
    edtMiesiac.Text := IntToStr(MonthOf(Date));
    miesiac :=  StrToInt(edtMiesiac.Text);
  end;
  datakon := EndOfAMonth(2017, 8);
  datapocz := StartOfAMonth(rok, miesiac);
  with DataModule1.zqryRaportMsc, SQL do
  begin
    Close;
    Clear;
    Add('select login,imie,nazwisko,numer_zamowienia,data_zamowienia, SUM(produkty.cena) ');
    Add('From zamowienia,uzytkownicy,produkty WHERE data_zamowienia >=:datapocz AND data_zamowienia <=:datakon AND zamowienia.idprodukty=produkty.idprodukty ');
    Add('GROUP BY login,imie,nazwisko,numer_zamowienia,data_zamowienia');
    ParamByName('datapocz').AsString := FormatDateTime('yyy-mm-dd', datapocz);
    ParamByName('datakon').AsString := FormatDateTime('yyy-mm-dd', datakon);
    Open;
  end;
end;

procedure TRaportMsc.edtRokExit(Sender: TObject);
var dl:Integer;
begin
begin
  dl := Length(edtRok.Text);
  if (dl<4) or (edtRok.Text='') or (StrToInt(edtRok.Text)>YearOf(Date))  then
  begin
    edtRok.Text := IntToStr(YearOf(Date));
    rok :=  StrToInt(edtRok.Text);
  end
  else
  begin
    rok :=  StrToInt(edtRok.Text);
  end;
end;
end;


end.
