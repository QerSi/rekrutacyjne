unit FormBase;

interface
  uses
  Vcl.Forms,Vcl.Dialogs,System.Classes;

  type
  TFormBase = class(TForm)
  public
  //procedure DodajPozycje;
  procedure Przycisk(tekst : string; typ : TMsgDlgType);
  constructor Create(AOwner: TComponent); reintroduce; overload;
  end;
implementation
  constructor TFormBase.Create(AOwner: TComponent);
  begin
  inherited;
  end;

  procedure TFormBase.Przycisk(tekst: string;typ : TMsgDlgType);
  begin
  with CreateMessageDialog(tekst,  typ, [mbOK],  mbOK ) do
    try
      Position := poDesigned;
      Left:=Self.Left+(Self.Width-Width) Div 2;
      Top:=Self.Top+(Self.Height-Height) Div 2;
      ShowModal
    finally
      Free

    end;
  end;
end.

