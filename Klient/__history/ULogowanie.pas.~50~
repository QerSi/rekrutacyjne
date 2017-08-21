unit ULogowanie;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, UData, Uzytkownik,
  Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Imaging.pngimage,System.IniFiles,FormBase;

type
  TLogowanie = class(TFormBase)
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
    INI := TINIFile.Create(ExtractFilePath(Application.ExeName) + 'setup.ini');
   try
        INI.WriteInteger('Main', 'PositionTop', Main.Top);
        INI.WriteInteger('Main', 'PositionLeft', Main.Left);
        INI.WriteInteger('Main', 'height', Main.Height);
        INI.WriteInteger('Main', 'Width', Main.Width);
      finally
        INI.Free;
      end;
    Application.Terminate;
end;

end;

procedure TLogowanie.btnLoginClick(Sender: TObject);

begin

  with DataModule1.zqry, SQL do
  begin
      try
        Close;
        Clear;
        Add('SELECT * from public.uzytkownicy where login=:login and haslo=:haslo');
        ParamByName('login').AsString:=edtLogin.Text;
        ParamByName('haslo').AsString:=edtHaslo.Text;
        Open;
      except
      self.Przycisk('B³¹d po³¹czenia z baz¹',mtError);
      end;

  end;
  if not DataModule1.zqry.FieldByName('administrator').AsBoolean then
  begin
    self.Przycisk('Konto nie ma uprawnieñ aby korzystaæ z tego programu',mtError);
  end
  else if edtLogin.Text=DataModule1.zqry.FieldByName('login').AsString then
    begin
     
      Main.mmglowne.Items[0][0].Enabled := True;
      Main.mmglowne.Items[1].Enabled := True;
      Main.mmglowne.Items[2].Enabled := True;
      Main.mmglowne.Items[3].Enabled := True;
      edtLogin.Text:='';
      edtHaslo.Text:='';
      Main.uzzalogowany := TUzytkownik.Create(DataModule1.zqry.FieldByName('iduzytkownicy').AsInteger,DataModule1.zqry.FieldByName('login').AsString,DataModule1.zqry.FieldByName('imie').AsString,DataModule1.zqry.FieldByName('nazwisko').AsString,DataModule1.zqry.FieldByName('administrator').AsBoolean,DataModule1.zqry.FieldByName('liczba_zamowien').AsInteger);
      self.hide;
      main.show;
    end
  else
  begin
    self.Przycisk('B³¹d logowania',mtError);
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
