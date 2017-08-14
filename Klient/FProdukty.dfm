object Frame2: TFrame2
  Left = 0
  Top = 0
  Width = 991
  Height = 538
  TabOrder = 0
  object lbl3: TLabel
    Left = 9
    Top = 1
    Width = 73
    Height = 23
    Caption = 'Produkty'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl4: TLabel
    Left = 9
    Top = 237
    Width = 36
    Height = 23
    Caption = 'Opis'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnProduktyDodaj: TButton
    Left = 1
    Top = 366
    Width = 75
    Height = 25
    Caption = 'Dodaj'
    TabOrder = 0
    OnClick = btnProduktyDodajClick
  end
  object btnProduktyEdytuj: TButton
    Left = 104
    Top = 366
    Width = 75
    Height = 25
    Caption = 'Edytuj'
    TabOrder = 1
    OnClick = btnProduktyEdytujClick
  end
  object btnProduktyUsun: TButton
    Left = 185
    Top = 366
    Width = 75
    Height = 25
    Caption = 'Usu'#324
    TabOrder = 2
    OnClick = btnProduktyUsunClick
  end
  object dbgrdProdukty: TDBGrid
    Left = 0
    Top = 30
    Width = 465
    Height = 201
    DataSource = DataModule1.dsprodukty
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'nazwa'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cena'
        Visible = True
      end>
  end
  object dbmmoopis: TDBMemo
    Left = 0
    Top = 266
    Width = 641
    Height = 89
    DataField = 'opis'
    DataSource = DataModule1.dsprodukty
    ReadOnly = True
    TabOrder = 4
  end
end
