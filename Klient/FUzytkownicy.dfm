object Uzytkownicy: TUzytkownicy
  Left = 0
  Top = 0
  Width = 780
  Height = 483
  TabOrder = 0
  object lbl1: TLabel
    Left = 8
    Top = 3
    Width = 101
    Height = 23
    Caption = 'U'#380'ytkownicy'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 136
    Top = 21
    Width = 113
    Height = 16
    Caption = 'Wyszukaj po loginie'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object dbgrd1: TDBGrid
    Left = 3
    Top = 70
    Width = 633
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
        FieldName = 'administrator'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'liczba_zamowien'
        ImeMode = imKata
        Visible = True
      end>
  end
  object btnDodaj: TButton
    Left = 8
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Dodaj'
    TabOrder = 1
    OnClick = btnDodajClick
  end
  object btnUsun: TButton
    Left = 216
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Usu'#324
    TabOrder = 2
    OnClick = btnUsunClick
  end
  object btnEdytuj: TButton
    Left = 112
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Edytuj'
    TabOrder = 3
    OnClick = btnEdytujClick
  end
  object edtszukaj: TEdit
    Left = 136
    Top = 43
    Width = 121
    Height = 21
    TabOrder = 4
    OnChange = edtszukajChange
  end
end
