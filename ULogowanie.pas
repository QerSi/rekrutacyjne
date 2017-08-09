unit ULogowanie;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, UData, Uzytkownik,
  Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TLogowanie = class(TForm)
    edtLogin: TEdit;
    edtHaslo: TEdit;
    btnLogin: TButton;
    btnAnuluj: TButton;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    img1: TImage;
    procedure btnLoginClick(Sender: TObject);
    procedure edtLoginChange(Sender: TObject);
    procedure edtHasloChange(Sender: TObject);
    procedure btnAnulujClick(Sender: TObject);
    procedure edtHasloKeyPress(Sender: TObject; var Key: Char);
    procedure edtLoginKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    iduzytkownicy : Integer;
  end;

var
  Logowanie: TLogowanie;
  aa: TUzytkownik;

implementation

{$R *.dfm}

uses UOknoGlowne, UMain;

procedure TLogowanie.btnAnulujClick(Sender: TObject);
begin
if Application.MessageBox('Zakoñczyæ pracê?', '', MB_YESNO +
  MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
begin
    Application.Terminate;
end;

end;

procedure TLogowanie.btnLoginClick(Sender: TObject);

begin

  with DataModule1.zqry, SQL do
  begin
      Close;
      Clear;
      Add('SELECT * from public.uzytkownicy where login=:login and haslo=:haslo');
      ParamByName('login').AsString:=edtLogin.Text;
      ParamByName('haslo').AsString:=edtHaslo.Text;
      Open;
  end;

  if edtLogin.Text=DataModule1.zqry.FieldByName('login').AsString then
    begin
      Logowanie.Hide;
      Main.Show;
      edtLogin.Text:='';
      edtHaslo.Text:='';
      iduzytkownicy := DataModule1.zqry.FieldByName('iduzytkownicy').AsInteger;
    end
  else
  begin
    ShowMessage('B³¹d');
  end;

end;

procedure TLogowanie.edtHasloChange(Sender: TObject);
begin
if (edtLogin.Text='') or (edtHaslo.Text='') then
begin
  btnLogin.Enabled := False;
end
else
begin
  btnLogin.Enabled := True;
end;
end;



procedure TLogowanie.edtHasloKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
begin
 btnLogin.Click;
 Key:=#0;
end;


end;

procedure TLogowanie.edtLoginChange(Sender: TObject);
begin
if (edtLogin.Text='') or (edtHaslo.Text='') then
begin
  btnLogin.Enabled := False;
end
else
begin
  btnLogin.Enabled := True;
end;

end;

procedure TLogowanie.edtLoginKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
begin
 btnLogin.Click;
 Key:=#0;
end;

end;

end.
