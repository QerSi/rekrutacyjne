object NowyUzytkownik: TNowyUzytkownik
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'NowyUzytkownik'
  ClientHeight = 254
  ClientWidth = 324
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
    Left = 8
    Top = 13
    Width = 35
    Height = 16
    Caption = 'Login:'
  end
  object lbl2: TLabel
    Left = 192
    Top = 13
    Width = 37
    Height = 16
    Caption = 'Has'#322'o:'
  end
  object lbl3: TLabel
    Left = 8
    Top = 80
    Width = 30
    Height = 16
    Caption = 'Imi'#281':'
  end
  object lbl4: TLabel
    Left = 192
    Top = 80
    Width = 58
    Height = 16
    Caption = 'Nazwisko:'
  end
  object lbl5: TLabel
    Left = 122
    Top = 146
    Width = 82
    Height = 16
    Caption = 'Administrator:'
  end
  object edtLogin: TEdit
    Left = 8
    Top = 35
    Width = 121
    Height = 24
    MaxLength = 20
    TabOrder = 0
    OnChange = edtLoginChange
  end
  object edtimie: TEdit
    Left = 8
    Top = 102
    Width = 121
    Height = 24
    MaxLength = 20
    TabOrder = 2
  end
  object edtnazwisko: TEdit
    Left = 192
    Top = 102
    Width = 121
    Height = 24
    MaxLength = 30
    TabOrder = 3
  end
  object edthaslo: TEdit
    Left = 192
    Top = 35
    Width = 121
    Height = 24
    MaxLength = 32
    PasswordChar = '*'
    TabOrder = 1
    OnChange = edthasloChange
  end
  object chkadministrator: TCheckBox
    Left = 156
    Top = 168
    Width = 13
    Height = 17
    TabOrder = 4
  end
  object btndodaj: TButton
    Left = 8
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Dodaj'
    Enabled = False
    TabOrder = 5
    OnClick = btndodajClick
  end
  object btnanuluj: TButton
    Left = 243
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Anuluj'
    TabOrder = 6
    OnClick = btnanulujClick
  end
end
