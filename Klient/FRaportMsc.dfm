object RaportMsc: TRaportMsc
  Left = 0
  Top = 0
  Width = 713
  Height = 433
  TabOrder = 0
  object btnGeneruj: TButton
    Left = 64
    Top = 352
    Width = 75
    Height = 25
    Caption = 'Generuj'
    TabOrder = 0
    OnClick = btnGenerujClick
  end
  object edtMiesiac: TEdit
    Left = 18
    Top = 16
    Width = 121
    Height = 21
    MaxLength = 2
    TabOrder = 1
  end
  object edtRok: TEdit
    Left = 18
    Top = 43
    Width = 121
    Height = 21
    MaxLength = 4
    TabOrder = 2
    OnExit = edtRokExit
  end
  object dbgrd1: TDBGrid
    Left = 0
    Top = 80
    Width = 713
    Height = 266
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
