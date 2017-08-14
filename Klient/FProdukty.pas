unit FProdukty;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TFrame2 = class(TFrame)
    lbl3: TLabel;
    lbl4: TLabel;
    btnProduktyDodaj: TButton;
    btnProduktyUsun: TButton;
    btnProduktyEdytuj: TButton;
    dbgrdProdukty: TDBGrid;
    dbmmoopis: TDBMemo;
    procedure btnProduktyDodajClick(Sender: TObject);
    procedure btnProduktyEdytujClick(Sender: TObject);
    procedure btnProduktyUsunClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses UNowyProdukt, UEdytujProdukt, UData,Produkt;

var
wybranyProdukt : TProdukt;

procedure TFrame2.btnProduktyDodajClick(Sender: TObject);
begin
 NowyProdukt:=TNowyProdukt.Create(self);
 NowyProdukt.ShowModal;
end;

procedure TFrame2.btnProduktyEdytujClick(Sender: TObject);
begin
   wybranyProdukt := TProdukt.Create(DataModule1.zqryprodukty.FieldByName('idprodukty').AsInteger,DataModule1.zqryprodukty.FieldByName('nazwa').AsString,DataModule1.zqryprodukty.FieldByName('cena').AsFloat,DataModule1.zqryprodukty.FieldByName('opis').AsString);
  EdytujProdukt := TEdytujProdukt.Create(wybranyProdukt);
  EdytujProdukt.ShowModal;
end;

procedure TFrame2.btnProduktyUsunClick(Sender: TObject);
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
    wybranyprodukt.Free; 
  end;

end;

end.
