unit UProdukty;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Produkt;

type
  TProdukty = class(TForm)
    btnDodaj: TButton;
    btnUsun: TButton;
    btnEdytuj: TButton;
    btnAnuluj: TButton;
    dbgrd1: TDBGrid;
    dbmmoopis: TDBMemo;
    lbl1: TLabel;
    lbl2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnAnulujClick(Sender: TObject);
    procedure btnDodajClick(Sender: TObject);
    procedure btnEdytujClick(Sender: TObject);
    procedure btnUsunClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Produkty: TProdukty;
  wybranyProdukt : TProdukt;
implementation

{$R *.dfm}

uses UData, UNowyProdukt, UEdytujUzytkownika, UEdytujProdukt, UMain;

procedure TProdukty.btnAnulujClick(Sender: TObject);
begin
  self.Close;
end;

procedure TProdukty.btnDodajClick(Sender: TObject);
begin
  NowyProdukt.ShowModal;
end;

procedure TProdukty.btnEdytujClick(Sender: TObject);
begin
  wybranyProdukt := TProdukt.Create(DataModule1.zqryprodukty.FieldByName('idprodukty').AsInteger,DataModule1.zqryprodukty.FieldByName('nazwa').AsString,DataModule1.zqryprodukty.FieldByName('cena').AsFloat,DataModule1.zqryprodukty.FieldByName('opis').AsString);
  EdytujProdukt.FormShow(wybranyProdukt);
  EdytujProdukt.ShowModal;
end;

procedure TProdukty.btnUsunClick(Sender: TObject);
begin
   wybranyProdukt := TProdukt.Create(DataModule1.zqryprodukty.FieldByName('idprodukty').AsInteger,DataModule1.zqryprodukty.FieldByName('nazwa').AsString,DataModule1.zqryprodukty.FieldByName('cena').AsFloat,DataModule1.zqryprodukty.FieldByName('opis').AsString);

  begin
    if Application.MessageBox('Czy napewno chcesz usun�� produkt ', 'Uwaga!',
      MB_YESNO + MB_ICONWARNING + MB_DEFBUTTON2) = IDYES then
    begin
      try
      wybranyProdukt.Delete;
      ShowMessage('Produkt zosta� usuni�ty');
      except
        ShowMessage('B��d podczas usuwania');
      end;
    end;
    with DataModule1.zqryprodukty, SQL do
      begin
          Close;
          Clear;
          Add('SELECT * from public.produkty ORDER BY nazwa');
          Open;
      end;
    wybranyProdukt.Free;
  end;
end;

procedure TProdukty.FormShow(Sender: TObject);
begin
Produkty.Top := main.Top + 50;
Produkty.Left := main.Left + 50;
with DataModule1.zqryprodukty, SQL do
  begin
      Close;
      Clear;
      Add('SELECT * from public.produkty ORDER BY nazwa');
      Open;
      First;
  end;
end;

end.
