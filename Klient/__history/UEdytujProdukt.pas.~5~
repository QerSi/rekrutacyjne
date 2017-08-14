unit UEdytujProdukt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,UProdukty;

type
  TEdytujProdukt = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl4: TLabel;
    edtNazwa: TEdit;
    edtcena: TEdit;
    btndodaj: TButton;
    btnanuluj: TButton;
    mmoOpis: TMemo;
    procedure edtNazwaChange(Sender: TObject);
    procedure edtcenaChange(Sender: TObject);
    procedure btnanulujClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btndodajClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EdytujProdukt: TEdytujProdukt;

implementation

{$R *.dfm}

uses UData, UMain;

procedure TEdytujProdukt.btnanulujClick(Sender: TObject);
begin
self.Close;
end;

procedure TEdytujProdukt.btndodajClick(Sender: TObject);
var cenad : Double;
begin
 try
    cenad := strtofloat(edtcena.Text);
     try
    wybranyProdukt.update;
    with CreateMessageDialog('Zmiany zapisane',  mtConfirmation, [mbOK],  mbOK ) do
    try
      Position := poDesigned;
      Left:=Self.Left+(Self.Width-Width) Div 2;
      Top:=Self.Top+(Self.Height-Height) Div 2;
      ShowModal
    finally
      Free

    end;
    Close;
  except
    with CreateMessageDialog('B³¹d', mtError, [mbOK],  mbOK ) do
    try
      Position := poDesigned;
      Left:=Self.Left+(Self.Width-Width) Div 2;
      Top:=Self.Top+(Self.Height-Height) Div 2;
      ShowModal
    finally
      Free
    end;
  end;
  except
    on E: EConvertError do
    begin
      with CreateMessageDialog('Nieprawid³owa cena Wzór: 10,10', mtError, [mbOK],  mbOK ) do
    try
      Position := poDesigned;
      Left:=Self.Left+(Self.Width-Width) Div 2;
      Top:=Self.Top+(Self.Height-Height) Div 2;
      ShowModal
    finally
      Free
    end;
    end;
  end;
 wybranyProdukt.nazwa := Trim(edtNazwa.Text);
 wybranyProdukt.cena := cenad;
 wybranyProdukt.opis := Trim(mmoOpis.Text);
 
  with DataModule1.zqryprodukty, SQL do
    begin
        Close;
        Clear;
        Add('SELECT * from public.produkty ORDER BY nazwa');
        Open;
    end;
end;

procedure TEdytujProdukt.edtcenaChange(Sender: TObject);
begin
 if (edtNazwa.Text='') or (edtCena.Text='') then
 begin
   btndodaj.Enabled:=False;
 end
 else
 btndodaj.Enabled:=True;
end;

procedure TEdytujProdukt.edtNazwaChange(Sender: TObject);
begin
 if (edtNazwa.Text='') or (edtCena.Text='') then
 begin
   btndodaj.Enabled:=False;
 end
 else
 btndodaj.Enabled:=True;
end;

procedure TEdytujProdukt.FormShow(Sender: TObject);
begin
  Left := Main.Left + (Main.Width - Width) div 2;
  Top := Main.Top + (Main.Height - Height) div 2;
  edtNazwa.Text := wybranyProdukt.nazwa;
  edtcena.Text := FloatToStr(wybranyProdukt.cena);
  mmoOpis.Text := wybranyProdukt.opis;
end;

end.
