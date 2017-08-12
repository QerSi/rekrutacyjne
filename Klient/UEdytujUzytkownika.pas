unit UEdytujUzytkownika;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TEdytujUzytkownika = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    edtLogin: TEdit;
    edtimie: TEdit;
    edthaslo: TEdit;
    chkadministrator: TCheckBox;
    btndodaj: TButton;
    btnanuluj: TButton;
    edtnazwisko: TEdit;
    procedure btnanulujClick(Sender: TObject);
    procedure btndodajClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtLoginChange(Sender: TObject);
    procedure edthasloChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EdytujUzytkownika: TEdytujUzytkownika;

implementation

{$R *.dfm}

uses UUzytkownicy, UData, UProdukty;

procedure TEdytujUzytkownika.btnanulujClick(Sender: TObject);
begin
Self.Close;
end;

procedure TEdytujUzytkownika.btndodajClick(Sender: TObject);
begin
  wybranyUzytkownik.imie :=Trim(edtimie.Text);
  wybranyUzytkownik.login :=  Trim(edtLogin.Text);
  wybranyUzytkownik.haslo := Trim(edthaslo.Text);
  if chkadministrator.Checked = true then
  begin
     wybranyUzytkownik.administrator:=true;
  end
  else
  begin
     wybranyUzytkownik.administrator:=False;
  end;
  edtnazwisko.Text := wybranyUzytkownik.nazwisko;
  try
    wybranyUzytkownik.update;
    with CreateMessageDialog('Zamiany zosta³y zapisane',  mtConfirmation, [mbOK],  mbOK ) do
    try
      Position := poDesigned;
      Left:=Self.Left+(Self.Width-Width) Div 2;
      Top:=Self.Top+(Self.Height-Height) Div 2;
      ShowModal
    finally
      Free

    end;
    self.Close;
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
  with DataModule1.zqry, SQL do
    begin
        Close;
        Clear;
        Add('SELECT * from public.uzytkownicy ORDER BY login');
        Open;
    end;

end;

procedure TEdytujUzytkownika.edthasloChange(Sender: TObject);
begin
 if (edtLogin.Text='') or (edthaslo.Text='') then
 begin
   btndodaj.Enabled:=False;
 end
 else
 btndodaj.Enabled:=True;
end;

procedure TEdytujUzytkownika.edtLoginChange(Sender: TObject);
begin
 if (edtLogin.Text='') or (edthaslo.Text='') then
 begin
   btndodaj.Enabled:=False;
 end
 else
 btndodaj.Enabled:=True;
end;

procedure TEdytujUzytkownika.FormShow(Sender: TObject);
begin
  EdytujUzytkownika.Top := Uzytkownicy.Top + 20;
  EdytujUzytkownika.Left := Uzytkownicy.Left + 20;
  edtimie.Text := wybranyUzytkownik.imie;
  edtLogin.Text := wybranyUzytkownik.login;
  edthaslo.Text := wybranyUzytkownik.haslo;
  if wybranyUzytkownik.administrator=true then
  begin
    chkadministrator.Checked := True;
  end
  else
  begin
     chkadministrator.Checked := false;
  end;
  edtnazwisko.Text := wybranyUzytkownik.nazwisko;
end;

end.
