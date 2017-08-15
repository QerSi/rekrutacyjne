unit FRapMiesieczny;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,UData,DateUtils,
  Vcl.DBGrids, Vcl.StdCtrls;

type
  TRaportMiesieczny = class(TFrame)
    lbl1: TLabel;
    btn1: TButton;
    edtMiesiac: TEdit;
    edtRok: TEdit;
    lbl2: TLabel;
    dbgrdZamowienia: TDBGrid;
  private
    miesiac,rok : Integer;
    data : TDate;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}


