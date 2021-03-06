unit UEdytujProdukt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,Produkt,FormBase;

type
  TEdytujProdukt = class(TFormBase)
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
    wybranyProdukt : TProdukt;
  public
    constructor Create(AOwner: TComponent); reintroduce; overload;
    constructor Create(wybranyProdukt : TProdukt); reintroduce; overload;
  end;

var
  EdytujProdukt: TEdytujProdukt;
  wybranyProdukt: TProdukt;
implementation

{$R *.dfm}

uses UData, UMain;
constructor TEdytujProdukt.Create(AOwner: TComponent);
begin
inherited;
end;

constructor TEdytujProdukt.Create(wybranyProdukt : TProdukt);
begin
inherited Create(Application);
Self.wybranyProdukt := wybranyProdukt;
end;

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
    wybranyProdukt.cena := cenad;
     wybranyProdukt.nazwa := Trim(edtNazwa.Text);
    wybranyProdukt.opis := Trim(mmoOpis.Text);
    wybranyProdukt.update;
    Przycisk('Zmiany zapisane',  mtConfirmation);
    Close;
  except
    Przycisk('B��d', mtError);
  end;
  except
    Przycisk('Nieprawid�owa cena Wz�r: 10,10', mtError);
  end;

 DataModule1.zqryprodukty.Refresh

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
