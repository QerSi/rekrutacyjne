object Zamowienia: TZamowienia
  Left = 0
  Top = 0
  Width = 813
  Height = 464
  TabOrder = 0
  object btnSzczegoly: TButton
    Left = 101
    Top = 378
    Width = 129
    Height = 41
    Caption = 'Szczeg'#243#322'y Zam'#243'wienia'
    TabOrder = 0
    OnClick = btnSzczegolyClick
  end
  object dbgrd1: TDBGrid
    Left = 101
    Top = 119
    Width = 611
    Height = 233
    DataSource = DataModule1.dszam
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'data_zamowienia'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'login'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'status'
        Width = 134
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'numer_zamowienia'
        Width = 158
        Visible = True
      end>
  end
  object pnl2: TPanel
    Left = 0
    Top = 0
    Width = 813
    Height = 113
    Align = alTop
    Color = clMoneyGreen
    ParentBackground = False
    TabOrder = 2
    object lbl4: TLabel
      Left = 324
      Top = 34
      Width = 165
      Height = 33
      Caption = 'Zam'#243'wienia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object btnDodaj: TButton
    Left = 607
    Top = 378
    Width = 105
    Height = 41
    Caption = 'Dodaj zam'#243'wienie'
    TabOrder = 3
    OnClick = btnDodajClick
  end
end
