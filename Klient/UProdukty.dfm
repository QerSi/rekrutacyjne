object Produkty: TProdukty
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Produkty'
  ClientHeight = 409
  ClientWidth = 663
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 3
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
  object lbl2: TLabel
    Left = 8
    Top = 239
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
  object btnDodaj: TButton
    Left = 8
    Top = 376
    Width = 75
    Height = 25
    Caption = 'Dodaj'
    TabOrder = 0
    OnClick = btnDodajClick
  end
  object btnUsun: TButton
    Left = 200
    Top = 376
    Width = 75
    Height = 25
    Caption = 'Usu'#324
    TabOrder = 1
    OnClick = btnUsunClick
  end
  object btnEdytuj: TButton
    Left = 104
    Top = 376
    Width = 75
    Height = 25
    Caption = 'Edytuj'
    TabOrder = 2
    OnClick = btnEdytujClick
  end
  object btnAnuluj: TButton
    Left = 574
    Top = 376
    Width = 75
    Height = 25
    Caption = 'Wyjd'#378
    TabOrder = 3
    OnClick = btnAnulujClick
  end
  object dbgrd1: TDBGrid
    Left = 8
    Top = 32
    Width = 465
    Height = 201
    DataSource = DataModule1.dsprodukty
    ReadOnly = True
    TabOrder = 4
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
    Left = 8
    Top = 268
    Width = 641
    Height = 89
    DataField = 'opis'
    DataSource = DataModule1.dsprodukty
    ReadOnly = True
    TabOrder = 5
  end
end
