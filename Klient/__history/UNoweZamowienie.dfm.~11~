object NoweZamowienie: TNoweZamowienie
  Left = 0
  Top = 0
  Caption = 'NoweZamowienie'
  ClientHeight = 547
  ClientWidth = 628
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
    Left = 16
    Top = 8
    Width = 108
    Height = 23
    Caption = 'Zamawiaj'#261'cy'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl6: TLabel
    Left = 16
    Top = 179
    Width = 100
    Height = 23
    Caption = 'Zam'#243'wienie'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object pnl1: TPanel
    Left = 8
    Top = 100
    Width = 577
    Height = 73
    Color = clSilver
    ParentBackground = False
    TabOrder = 0
    object lbl2: TLabel
      Left = 8
      Top = 5
      Width = 25
      Height = 13
      Caption = 'Login'
    end
    object lbl3: TLabel
      Left = 208
      Top = 5
      Width = 20
      Height = 13
      Caption = 'Imi'#281
    end
    object lbl4: TLabel
      Left = 424
      Top = 5
      Width = 44
      Height = 13
      Caption = 'Nazwisko'
    end
    object edtLogin: TEdit
      Left = 8
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'edtLogin'
    end
    object edtImie: TEdit
      Left = 208
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'edtLogin'
    end
    object edtNazwisko: TEdit
      Left = 424
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'edtLogin'
    end
  end
  object dbgrd1: TDBGrid
    Left = 8
    Top = 208
    Width = 577
    Height = 161
    DataSource = DataModule1.dsszczegoly
    ReadOnly = True
    TabOrder = 1
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
        FieldName = 'count'
        Visible = True
      end>
  end
  object btnAnuluj: TButton
    Left = 510
    Top = 456
    Width = 75
    Height = 25
    Caption = 'Wyjd'#378
    TabOrder = 2
    OnClick = btnAnulujClick
  end
  object btnUsunPozycje: TButton
    Left = 153
    Top = 375
    Width = 104
    Height = 25
    Caption = 'Usu'#324' pozycj'#281
    TabOrder = 3
  end
  object btnDodajPozycje: TButton
    Left = 8
    Top = 375
    Width = 107
    Height = 25
    Caption = 'Dodaj Pozycje'
    TabOrder = 4
    OnClick = btnDodajPozycjeClick
  end
  object cbbKlient: TComboBox
    Left = 16
    Top = 56
    Width = 145
    Height = 21
    TabOrder = 5
    Text = 'Wybierz klienta'
    OnChange = cbbKlientChange
  end
end
