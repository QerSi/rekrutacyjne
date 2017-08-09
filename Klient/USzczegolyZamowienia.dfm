object SzczegolyZamowienia: TSzczegolyZamowienia
  Left = 0
  Top = 0
  Caption = 'SzczegolyZamowienia'
  ClientHeight = 576
  ClientWidth = 650
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
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
  object lbl5: TLabel
    Left = 8
    Top = 122
    Width = 104
    Height = 16
    Caption = 'Data Zam'#243'wienia:'
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
  object lbl7: TLabel
    Left = 365
    Top = 122
    Width = 41
    Height = 16
    Caption = 'Status:'
  end
  object pnl1: TPanel
    Left = 8
    Top = 40
    Width = 634
    Height = 73
    TabOrder = 0
    object lbl2: TLabel
      Left = 32
      Top = 5
      Width = 30
      Height = 16
      Caption = 'Login'
    end
    object lbl3: TLabel
      Left = 232
      Top = 5
      Width = 25
      Height = 16
      Caption = 'Imi'#281
    end
    object lbl4: TLabel
      Left = 440
      Top = 5
      Width = 53
      Height = 16
      Caption = 'Nazwisko'
    end
    object edtLogin: TEdit
      Left = 32
      Top = 27
      Width = 121
      Height = 24
      ReadOnly = True
      TabOrder = 0
      Text = 'edtLogin'
    end
    object edtImie: TEdit
      Left = 232
      Top = 27
      Width = 145
      Height = 24
      ReadOnly = True
      TabOrder = 1
      Text = 'edtImie'
    end
    object edtNazwisko: TEdit
      Left = 440
      Top = 27
      Width = 145
      Height = 24
      ReadOnly = True
      TabOrder = 2
      Text = 'edtNazwisko'
    end
  end
  object edtData: TEdit
    Left = 118
    Top = 119
    Width = 121
    Height = 24
    ReadOnly = True
    TabOrder = 1
  end
  object dbgrd1: TDBGrid
    Left = 8
    Top = 208
    Width = 577
    Height = 161
    DataSource = DataModule1.dsszczegoly
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
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
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'count'
        Width = 64
        Visible = True
      end>
  end
  object edtStatus: TEdit
    Left = 412
    Top = 119
    Width = 121
    Height = 24
    ReadOnly = True
    TabOrder = 3
    Text = 'edtStatus'
  end
  object btnZmien: TButton
    Left = 412
    Top = 149
    Width = 121
    Height = 25
    Caption = 'Zmie'#324' status'
    TabOrder = 4
    OnClick = btnZmienClick
  end
  object btnZapisz: TButton
    Left = 16
    Top = 416
    Width = 75
    Height = 25
    Caption = 'btnZapisz'
    TabOrder = 5
  end
  object btnUzun: TButton
    Left = 118
    Top = 416
    Width = 121
    Height = 25
    Caption = 'Uzu'#324' zam'#243'wienie'
    TabOrder = 6
    OnClick = btnUzunClick
  end
  object btnAnuluj: TButton
    Left = 536
    Top = 416
    Width = 75
    Height = 25
    Caption = 'Anuluj'
    TabOrder = 7
    OnClick = btnAnulujClick
  end
end
