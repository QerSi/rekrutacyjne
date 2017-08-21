unit USzczegolyZamowienia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,UData,
  Vcl.StdCtrls, Vcl.ExtCtrls,Pozycja,FZamowienia,Zamowienie, frxDBSet, frxClass,FormBase;

type
  TSzczegolyZamowienia = class(TFormBase)
    pnl1: TPanel;
    edtLogin: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    edtImie: TEdit;
    lbl3: TLabel;
    edtNazwisko: TEdit;
    lbl4: TLabel;
    lbl5: TLabel;
    edtData: TEdit;
    dbgrd1: TDBGrid;
    lbl6: TLabel;
    lbl7: TLabel;
    edtStatus: TEdit;
    btnZmien: TButton;
    btnUzun: TButton;
    btnAnuluj: TButton;
    btnUsunPozycje: TButton;
    btnDodajPozycje: TButton;
    frxReportSzczegolyZamowienia: TfrxReport;
    frxdb1: TfrxDBDataset;
    btnDrukuj: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnZmienClick(Sender: TObject);
    procedure cbb1Select(Sender: TObject);
    procedure btnAnulujClick(Sender: TObject);
    procedure btnUzunClick(Sender: TObject);
    procedure btnAnulujStatClickClick(Sender: TObject);
    procedure btnUsunPozycjeClick(Sender: TObject);
    procedure btnDodajPozycjeClick(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure btnPotwierdzUsunClick(Sender: TObject);
    procedure btnDrukujClick(Sender: TObject);
  private
    wybraneZamowienie : TZamowienie;
  public
    cbbStatus : TComboBox;
    btnAnulujStat : TButton;
    lbWybierzIlosc : TLabel;
    cbbIlosc : TComboBox;
    btnPotwierdzUsun : TButton;
    constructor Create(wybraneZamowienie : TZamowienie); reintroduce; overload;
    { Public declarations }
  end;

var
  SzczegolyZamowienia: TSzczegolyZamowienia;
  statusy : array[0..3] of String;
  index : integer;
  cbbIloscIst : Boolean;

implementation

{$R *.dfm}

uses UDodajPozycje, UMain;

constructor TSzczegolyZamowienia.Create(wybraneZamowienie : TZamowienie);
begin
inherited Create(Application);
Self.wybraneZamowienie := wybraneZamowienie;
end;

procedure TSzczegolyZamowienia.btnAnulujClick(Sender: TObject);
begin
DataModule1.zqryzam.Refresh;
if cbbIloscIst then
begin
  btnPotwierdzUsun.Free;
  cbbIlosc.Free;
end;
self.Close;
end;

procedure TSzczegolyZamowienia.btnAnulujStatClickClick(Sender: TObject);
begin
  cbbStatus.Free;
  btnAnulujStat.Free;
  btnZmien.Enabled :=True;
end;

procedure TSzczegolyZamowienia.btnDodajPozycjeClick(Sender: TObject);
begin
  DodajPozycje := TDodajPozycje.Create(wybraneZamowienie);
  DodajPozycje.ShowModal;
end;

procedure TSzczegolyZamowienia.btnDrukujClick(Sender: TObject);
begin
frxReportSzczegolyZamowienia.ShowReport(true);
end;

procedure TSzczegolyZamowienia.btnUsunPozycjeClick(Sender: TObject);
begin
  wybraneZamowienie.UsunPozycje(DataModule1.zqryszczegoly.FieldByName('idprodukty').AsInteger);
    cbbIlosc:=TComboBox.Create(self);
    cbbIlosc.Name := 'cbbIlosc';
    cbbIlosc.Parent:=Self;
    cbbIloscIst :=True;
    cbbIlosc.Left:=255;
    cbbIlosc.Top:=375;
    cbbIlosc.Width:=70;
    cbbIlosc.Height:=24;
    for  Index := 1 to DataModule1.zqryszczegoly.FieldByName('count').AsInteger do
    begin
      cbbIlosc.Items.Add(Index.ToString);
    end;
    cbbIlosc.ItemIndex :=0;


    btnPotwierdzUsun:=TButton.Create(self);
    btnPotwierdzUsun.Name := 'btnPotwierdzUsun';
    btnPotwierdzUsun.Caption := 'Usuñ';
    btnPotwierdzUsun.Parent:=Self;
    btnPotwierdzUsun.Left:=145;
    btnPotwierdzUsun.Top:=375;
    btnPotwierdzUsun.Width:=104;
    btnPotwierdzUsun.Height:=25;
    btnPotwierdzUsun.OnClick :=btnPotwierdzUsunClick;
end;

procedure TSzczegolyZamowienia.btnUzunClick(Sender: TObject);
begin
if wybraneZamowienie.idstatusy=3 then
  begin
    try
      wybraneZamowienie.Delete;
      Przycisk('Zamowienie usuniête',mtConfirmation);
    except
       ShowMessage('B³¹d');
       Przycisk('Wyst¹pi³ b³ad',mtError);
    end;
    Self.Close;
    DataModule1.zqryzam.Refresh;
  end
else
  begin
    Przycisk('Zamowienie musi mieæ status "Anulowane"',mtInformation);
  end;


end;

procedure TSzczegolyZamowienia.btnZmienClick(Sender: TObject);

begin
    cbbStatus:=TComboBox.Create(self);
    cbbStatus.Name := 'cbbStatus';
    cbbStatus.Parent:=Self;
    cbbStatus.Left:=412;
    cbbStatus.Top:=119;
    cbbStatus.Width:=121;
    cbbStatus.Height:=24;
    for  Index := 0 to 3 do
    begin
      cbbStatus.Items.Add(statusy[index]);
    end;
      
    cbbStatus.ItemIndex := wybraneZamowienie.idstatusy;
    cbbStatus.Visible:=True;
    cbbStatus.OnSelect := cbb1Select;
    btnZmien.Enabled := False;

    btnAnulujStat := TButton.Create(self);
    btnAnulujStat.Parent := Self;
    btnAnulujStat.Name := 'AnulujStat';
    btnAnulujStat.Caption :='Anuluj';
    btnAnulujStat.Left:=412;
    btnAnulujStat.Top:=149;
    btnAnulujStat.Width:=121;
    btnAnulujStat.Height:=25;
    btnAnulujStat.OnClick := btnAnulujStatClickClick;

end;

procedure TSzczegolyZamowienia.cbb1Select(Sender: TObject);
begin
  try
  wybraneZamowienie.idstatusy := cbbStatus.ItemIndex;

  btnZmien.Enabled := True;
  wybraneZamowienie.Update;
  edtStatus.Text := statusy[wybraneZamowienie.idstatusy];
  Przycisk('Status zosta³ zmieniony',  mtConfirmation);
    cbbStatus.Free;
    btnAnulujStat.Free;
  except
  Przycisk('B³¹d podczas zmiany statusu', mtError);
  cbbStatus.Free;
  btnZmien.Enabled := True;

  end;
   DataModule1.zqryzam.Refresh;
end;

procedure TSzczegolyZamowienia.dbgrd1CellClick(Column: TColumn);
begin
  if cbbIloscIst then
  begin
    cbbIloscIst :=false;
    cbbIlosc.Free;
    btnPotwierdzUsun.Free;
  end;

end;

procedure TSzczegolyZamowienia.FormShow(Sender: TObject);
begin

  Left := Main.Left + (Main.Width - Width) div 2;
  Top := Main.Top + (Main.Height - Height) div 2;
  try
    with DataModule1.zqryszczegoly, SQL do
    begin
      Close;
      Clear;
      Add('select data_zamowienia,numer_zamowienia,produkty.nazwa, produkty.idprodukty, produkty.cena, COUNT(zamowienia.idprodukty),Sum(cena),imie,nazwisko From produkty,zamowienia,uzytkownicy WHERE zamowienia.idprodukty=produkty.idprodukty AND');
      Add('  zamowienia.numer_zamowienia=:numer and zamowienia.iduzytkownicy=uzytkownicy.iduzytkownicy GROUP BY produkty.nazwa, produkty.cena,produkty.idprodukty,imie,nazwisko,numer_zamowienia,data_zamowienia');
      ParamByName('numer').AsInteger := wybraneZamowienie.numer_zamowienia;
      Open;
    end;
    with DataModule1.zqrystatusy, SQL do
    begin
      Close;
      Clear;
      Add('select * from statusy Order By idstatusy');
      Open;
    end;
  except
    Przycisk('B³¹d po³¹czenia z baza',mtError);
  end;

  index :=0;
  while not DataModule1.zqrystatusy.Eof do
  begin
    statusy[index] := DataModule1.zqrystatusy.FieldByName('status').AsString;
    index := index+1;
    DataModule1.zqrystatusy.Next;
  end;

  while not DataModule1.zqryszczegoly.Eof do
  begin
    wybraneZamowienie.DodajPozycje(TPozycja.Create(DataModule1.zqryszczegoly.FieldByName('idprodukty').AsInteger,DataModule1.zqryszczegoly.FieldByName('nazwa').AsString,DataModule1.zqryszczegoly.FieldByName('cena').AsFloat,DataModule1.zqryszczegoly.FieldByName('count').AsInteger));
    DataModule1.zqryszczegoly.Next;
  end;
  edtImie.Text := DataModule1.zqryzam.FieldByName('imie').AsString;
  edtLogin.Text := DataModule1.zqryzam.FieldByName('login').AsString;
  edtNazwisko.Text := DataModule1.zqryzam.FieldByName('nazwisko').AsString;
  edtData.Text := DataModule1.zqryzam.FieldByName('data_zamowienia').AsString;
  edtStatus.Text := DataModule1.zqryzam.FieldByName('status').AsString;

end;

procedure TSzczegolyZamowienia.btnPotwierdzUsunClick(Sender: TObject);
var i : Integer;
    id : Integer;
begin
  id :=DataModule1.zqryszczegoly.FieldByName('idprodukty').AsInteger;
  try
     for I := 1 to cbbIlosc.ItemIndex do
  begin
    wybraneZamowienie.UsunPozycje(id);
  end;
  btnPotwierdzUsun.Free;
  cbbIlosc.Free;
  cbbIloscIst := false;
   Przycisk('Sukces', mtConfirmation);

  except
    Przycisk('Wyst¹pi³ b³¹d', mtError);
  end;
  DataModule1.zqryszczegoly.Refresh;
end;

end.
