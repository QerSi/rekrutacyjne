unit FZamowienia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls,Zamowienie;

type
  TZamowienia = class(TFrame)
    lbl5: TLabel;
    btnSzczegoly: TButton;
    dbgrd1: TDBGrid;
    procedure btnSzczegolyClick(Sender: TObject);

   public
   constructor Create(AOwner: TComponent); reintroduce; overload;
   constructor Create(wybraneZamowienie : TZamowienie); reintroduce; overload;

   private
    wybraneZamowienie : TZamowienie;
  end;

implementation

{$R *.dfm}

uses USzczegolyZamowienia, UData;

procedure TZamowienia.btnSzczegolyClick(Sender: TObject);
begin
  wybraneZamowienie := TZamowienie.Create(DataModule1.zqryzam.FieldByName('data_zamowienia').AsString,DataModule1.zqryzam.FieldByName('idzamowienia').AsInteger,DataModule1.zqryzam.FieldByName('iduzytkownicy').AsInteger,DataModule1.zqryzam.FieldByName('idstatusy').AsInteger,DataModule1.zqryzam.FieldByName('numer_zamowienia').AsInteger);
  SzczegolyZamowienia := TSzczegolyZamowienia.Create(wybraneZamowienie);
  SzczegolyZamowienia.ShowModal;
end;

constructor TZamowienia.Create(AOwner: TComponent);
begin
inherited;
end;

constructor TZamowienia.Create(wybraneZamowienie : TZamowienie);
begin
Self.wybraneZamowienie := wybraneZamowienie;
end;

end.