object Main: TMain
  Left = 0
  Top = 0
  Caption = 'Zarz'#261'dzanie zam'#243'wniami'
  ClientHeight = 541
  ClientWidth = 840
  Color = clBtnFace
  Constraints.MinHeight = 600
  Constraints.MinWidth = 800
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mmglowne
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object mmglowne: TMainMenu
    Left = 16
    Top = 24
    object Program1: TMenuItem
      Caption = 'Program'
      object Wyloguj1: TMenuItem
        Caption = 'Wyloguj'
        OnClick = m
      end
      object Wyjd1: TMenuItem
        Caption = 'Wyjd'#378
        OnClick = Wyjd1Click
      end
    end
    object Zamownia1: TMenuItem
      Caption = 'Zamownia'
      OnClick = Zamownia1Click
    end
    object Uzytkownicy1: TMenuItem
      Caption = 'Uzytkownicy'
      OnClick = Uzytkownicy1Click
    end
    object Produkty1: TMenuItem
      Caption = 'Produkty'
      OnClick = Produkty1Click
    end
  end
end
