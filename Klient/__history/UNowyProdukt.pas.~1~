unit UNowyProdukt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TNowyProdukt = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl4: TLabel;
    edtNazwa: TEdit;
    edtcena: TEdit;
    btndodaj: TButton;
    btnanuluj: TButton;
    mmoOpis: TMemo;
    procedure FormShow(Sender: TObject);
    procedure edtNazwaChange(Sender: TObject);
    procedure edtcenaChange(Sender: TObject);
    procedure btnanulujClick(Sender: TObject);
    procedure btndodajClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NowyProdukt: TNowyProdukt;

implementation

{$R *.dfm}

uses Produkt, UData, UProdukty;

procedure TNowyProdukt.btnanulujClick(Sender: TObject);
begin
self.Close;
end;

procedure TNowyProdukt.btndodajClick(Sender: TObject);
  var
   produkt : TProdukt ;
   cenad : Double;
begin
  try
    cenad := strtofloat(edtcena.Text);
    produkt := TProdukt.Create(0,Trim(edtNazwa.Text),cenad,Trim(mmoOpis.Text));
    try
      produkt.Insert;
      with DataModule1.zqryprodukty, SQL do
      begin
          Close;
          Clear;
          Add('SELECT * from public.produkty ORDER BY nazwa');
          Open;
      end;
      with CreateMessageDialog('Produkt dodany',  mtConfirmation, [mbOK],  mbOK ) do
      try
        Position := poDesigned;
        Left:=Self.Left+(Self.Width-Width) Div 2;
        Top:=Self.Top+(Self.Height-Height) Div 2;
        ShowModal
      finally
        Free

      end;
      Self.Close;
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
      with CreateMessageDialog('Nieprawid³owa cena. Wzór: 10,10', mtError, [mbOK],  mbOK ) do
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
end;

procedure TNowyProdukt.edtcenaChange(Sender: TObject);
begin
if (edtNazwa.Text='') or (edtCena.Text='') then
 begin
   btndodaj.Enabled:=False;
 end
 else
 btndodaj.Enabled:=True;
end;

procedure TNowyProdukt.edtNazwaChange(Sender: TObject);
begin
 if (edtNazwa.Text='') or (edtCena.Text='') then
 begin
   btndodaj.Enabled:=False;
 end
 else
 btndodaj.Enabled:=True;
end;

procedure TNowyProdukt.FormShow(Sender: TObject);
begin
  mmoOpis.Lines.Clear;
  NowyProdukt.Top := Produkty.Top + 50;
  NowyProdukt.Left := Produkty.Left + 50;
end;

end.
