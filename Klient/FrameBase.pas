unit FrameBase;

interface
  uses
  Vcl.Forms,Vcl.Dialogs,System.Classes;

  type
  TFrameBase = class(TFrame)

  public
  procedure Przycisk(tekst : string; typ : TMsgDlgType);
  constructor Create(AOwner: TComponent); reintroduce; overload;
  end;

  implementation
  constructor TFrameBase.Create(AOwner: TComponent);
  begin
    inherited;
    if csDesignInstance in ComponentState then InitInheritedComponent(Self, TFrame);

  end;

  procedure TFrameBase.Przycisk(tekst: string;typ : TMsgDlgType);
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