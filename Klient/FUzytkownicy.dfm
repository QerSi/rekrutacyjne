object Uzytkownicy: TUzytkownicy
  Left = 0
  Top = 0
  Width = 813
  Height = 464
  TabOrder = 0
  object lbl2: TLabel
    Left = 40
    Top = 120
    Width = 132
    Height = 16
    Caption = 'Wyszukaj po loginie:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dbgrd1: TDBGrid
    Left = 60
    Top = 154
    Width = 693
    Height = 193
    DataSource = DataModule1.ds
    ParentShowHint = False
    ReadOnly = True
    ShowHint = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'login'
        Width = 144
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
        Width = 155
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'administrator'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'liczba_zamowien'
        ImeMode = imKata
        Width = 125
        Visible = True
      end>
  end
  object btnDodaj: TButton
    Left = 60
    Top = 384
    Width = 75
    Height = 25
    Caption = 'Dodaj'
    TabOrder = 1
    OnClick = btnDodajClick
  end
  object btnUsun: TButton
    Left = 678
    Top = 384
    Width = 75
    Height = 25
    Caption = 'Usu'#324
    TabOrder = 2
    OnClick = btnUsunClick
  end
  object btnEdytuj: TButton
    Left = 230
    Top = 384
    Width = 75
    Height = 25
    Caption = 'Edytuj'
    TabOrder = 3
    OnClick = btnEdytujClick
  end
  object edtszukaj: TEdit
    Left = 184
    Top = 119
    Width = 121
    Height = 21
    TabOrder = 4
    OnChange = edtszukajChange
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 813
    Height = 113
    Align = alTop
    Color = clMoneyGreen
    ParentBackground = False
    TabOrder = 5
    object lbl1: TLabel
      Left = 218
      Top = 34
      Width = 377
      Height = 33
      Caption = 'Zarz'#261'dzanie u'#380'ytkownikami'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
end
