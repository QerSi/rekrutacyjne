object NowyProdukt: TNowyProdukt
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'NowyProdukt'
  ClientHeight = 299
  ClientWidth = 334
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
    Top = 13
    Width = 32
    Height = 13
    Caption = 'Nazwa'
  end
  object lbl2: TLabel
    Left = 192
    Top = 16
    Width = 25
    Height = 13
    Caption = 'Cena'
  end
  object lbl4: TLabel
    Left = 8
    Top = 80
    Width = 21
    Height = 13
    Caption = 'Opis'
  end
  object edtNazwa: TEdit
    Left = 8
    Top = 35
    Width = 121
    Height = 21
    MaxLength = 50
    TabOrder = 0
    OnChange = edtNazwaChange
  end
  object edtcena: TEdit
    Left = 192
    Top = 35
    Width = 121
    Height = 21
    MaxLength = 7
    TabOrder = 1
    OnChange = edtcenaChange
  end
  object btndodaj: TButton
    Left = 8
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Dodaj'
    Enabled = False
    TabOrder = 2
    OnClick = btndodajClick
  end
  object btnanuluj: TButton
    Left = 251
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Anuluj'
    TabOrder = 3
    OnClick = btnanulujClick
  end
  object mmoOpis: TMemo
    Left = 8
    Top = 99
    Width = 318
    Height = 143
    Lines.Strings = (
      'mmoOpis')
    MaxLength = 100
    TabOrder = 4
  end
end
