object sss: Tsss
  Left = 0
  Top = 0
  Width = 714
  Height = 442
  TabOrder = 0
  object lbl1: TLabel
    Left = 16
    Top = 32
    Width = 42
    Height = 16
    Caption = 'Miesi'#261'c'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 16
    Top = 68
    Width = 21
    Height = 16
    Caption = 'Rok'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btn1: TButton
    Left = 16
    Top = 384
    Width = 75
    Height = 25
    Caption = 'btn1'
    TabOrder = 0
    OnClick = btn1Click
  end
  object edtMiesiac: TEdit
    Left = 63
    Top = 31
    Width = 121
    Height = 21
    MaxLength = 2
    NumbersOnly = True
    TabOrder = 1
  end
  object edtRok: TEdit
    Left = 63
    Top = 63
    Width = 121
    Height = 21
    MaxLength = 4
    NumbersOnly = True
    TabOrder = 2
    OnExit = edtRokExit
  end
  object dbgrdZamowienia: TDBGrid
    Left = 3
    Top = 112
    Width = 702
    Height = 257
    DataSource = DataModule1.dsRaportMsc
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'login'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'imie'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nazwisko'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'numer_zamowienia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data_zamowienia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sum'
        Visible = True
      end>
  end
end
