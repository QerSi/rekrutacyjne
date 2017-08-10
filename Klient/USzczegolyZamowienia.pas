unit USzczegolyZamowienia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,UData,
  Vcl.StdCtrls, Vcl.ExtCtrls, UZamowienia,Pozycja;

type
  TSzczegolyZamowienia = class(TForm)
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
    btnZapisz: TButton;
    btnUzun: TButton;
    btnAnuluj: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnZmienClick(Sender: TObject);
    procedure cbb1Select(Sender: TObject);
    procedure btnAnulujClick(Sender: TObject);
    procedure btnUzunClick(Sender: TObject);
    procedure btnAnulujStatClickClick(Sender: TObject);
  private
    { Private declarations }
  public
    cbbStatus : TComboBox;
    btnAnulujStat : TButton;
    { Public declarations }
  end;

var
  SzczegolyZamowienia: TSzczegolyZamowienia;
  statusy : array[0..3] of String;
  index : integer;
implementation

{$R *.dfm}

procedure TSzczegolyZamowienia.btnAnulujClick(Sender: TObject);
begin
DataModule1.zqryzam.Refresh;
self.Close;
end;

procedure TSzczegolyZamowienia.btnAnulujStatClickClick(Sender: TObject);
begin
  cbbStatus.Free;
  btnAnulujStat.Free;
  btnZmien.Enabled :=True;
end;

procedure TSzczegolyZamowienia.btnUzunClick(Sender: TObject);
begin
if wybraneZamowienie.idstatusy=3 then
  begin
    try
      wybraneZamowienie.Delete;
      ShowMessage('Sukces');
    except
       ShowMessage('B��d');
    end;

    Self.Close;
    DataModule1.zqryzam.Refresh;
  end
else
  begin
    ShowMessage('Zamowienie musi mie� status "Anulowane"');
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
  with CreateMessageDialog('Status zosta� zmieniony',  mtConfirmation, [mbOK],  mbOK ) do
    try
      Position := poDesigned;
      Left:=Self.Left+(Self.Width-Width) Div 2;
      Top:=Self.Top+(Self.Height-Height) Div 2;
      ShowModal
    finally
      Free

    end;
    cbbStatus.Free;
    btnAnulujStat.Free;
  except
  with CreateMessageDialog('B��d podczas zmiany statusu', mtError, [mbOK],  mbOK ) do
    try
      Position := poDesigned;
      Left:=Self.Left+(Self.Width-Width) Div 2;
      Top:=Self.Top+(Self.Height-Height) Div 2;
      ShowModal
    finally
      Free
    end;
  cbbStatus.Free;
  btnZmien.Enabled := True;

  end;
   DataModule1.zqryzam.Refresh;
end;

procedure TSzczegolyZamowienia.FormShow(Sender: TObject);
begin
  SzczegolyZamowienia.Top := Zamowienia.Top + 50;
  SzczegolyZamowienia.Left := Zamowienia.Left + 50;
  with DataModule1.zqryszczegoly, SQL do
  begin
    Close;
    Clear;
    Add('select produkty.nazwa, produkty.cena, COUNT(zamowienia.idprodukty) From produkty,zamowienia WHERE zamowienia.idprodukty=produkty.idprodukty AND zamowienia.numer_zamowienia=:numer GROUP BY produkty.nazwa, produkty.cena');
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
  index :=0;
  while not DataModule1.zqrystatusy.Eof do
  begin
    statusy[index] := DataModule1.zqrystatusy.FieldByName('status').AsString;
    index := index+1;
    DataModule1.zqrystatusy.Next;
  end;

  while not DataModule1.zqryszczegoly.Eof do
  begin
    SetLength(wybraneZamowienie.pozycje,Length(wybraneZamowienie.pozycje)+1);
    wybraneZamowienie.pozycje[Length(wybraneZamowienie.pozycje)-1] := TPozycja.Create(DataModule1.zqryszczegoly.FieldByName('nazwa').AsString,DataModule1.zqryszczegoly.FieldByName('cena').AsFloat,DataModule1.zqryszczegoly.FieldByName('count').AsInteger);
    DataModule1.zqryszczegoly.Next;
  end;


  edtImie.Text := DataModule1.zqryzam.FieldByName('imie').AsString;
  edtLogin.Text := DataModule1.zqryzam.FieldByName('login').AsString;
  edtNazwisko.Text := DataModule1.zqryzam.FieldByName('nazwisko').AsString;
  edtData.Text := DataModule1.zqryzam.FieldByName('data_zamowienia').AsString;
  edtStatus.Text := DataModule1.zqryzam.FieldByName('status').AsString;
end;

end.
