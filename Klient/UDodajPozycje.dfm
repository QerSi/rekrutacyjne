object DodajPozycje: TDodajPozycje
  Left = 0
  Top = 0
  Caption = 'DodajPozycje'
  ClientHeight = 376
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 9
    Top = 295
    Width = 26
    Height = 16
    Caption = 'Ilo'#347#263
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object dbgrd: TDBGrid
    Left = 0
    Top = 0
    Width = 633
    Height = 185
    DataSource = DataModule1.dsprodukty
    TabOrder = 0
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
      end
      item
        Expanded = False
        FieldName = 'opis'
        Visible = True
      end>
  end
  object edtIlosc: TEdit
    Left = 56
    Top = 294
    Width = 65
    Height = 21
    NumbersOnly = True
    TabOrder = 1
    Text = 'edtIlosc'
    OnChange = edtIloscChange
  end
  object btnDodaj: TButton
    Left = 8
    Top = 330
    Width = 75
    Height = 25
    Caption = 'Dodaj'
    TabOrder = 2
    OnClick = btnDodajClick
  end
  object btnAnuluj: TButton
    Left = 552
    Top = 330
    Width = 75
    Height = 25
    Caption = 'Anuluj'
    TabOrder = 3
  end
  object dbmmoOpis: TDBMemo
    Left = 0
    Top = 191
    Width = 633
    Height = 89
    DataField = 'opis'
    DataSource = DataModule1.dsprodukty
    TabOrder = 4
  end
end
