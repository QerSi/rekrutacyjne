object SzczegolyZamowienia: TSzczegolyZamowienia
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'SzczegolyZamowienia'
  ClientHeight = 561
  ClientWidth = 596
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
    Width = 577
    Height = 73
    TabOrder = 0
    object lbl2: TLabel
      Left = 8
      Top = 5
      Width = 30
      Height = 16
      Caption = 'Login'
    end
    object lbl3: TLabel
      Left = 208
      Top = 5
      Width = 25
      Height = 16
      Caption = 'Imi'#281
    end
    object lbl4: TLabel
      Left = 424
      Top = 5
      Width = 53
      Height = 16
      Caption = 'Nazwisko'
    end
    object edtLogin: TEdit
      Left = 8
      Top = 27
      Width = 121
      Height = 24
      ReadOnly = True
      TabOrder = 0
      Text = 'edtLogin'
    end
    object edtImie: TEdit
      Left = 208
      Top = 27
      Width = 145
      Height = 24
      ReadOnly = True
      TabOrder = 1
      Text = 'edtImie'
    end
    object edtNazwisko: TEdit
      Left = 424
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
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = dbgrd1CellClick
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
  object btnUzun: TButton
    Left = 8
    Top = 456
    Width = 121
    Height = 25
    Caption = 'Uzu'#324' zam'#243'wienie'
    TabOrder = 5
    OnClick = btnUzunClick
  end
  object btnAnuluj: TButton
    Left = 510
    Top = 456
    Width = 75
    Height = 25
    Caption = 'Wyjd'#378
    TabOrder = 6
    OnClick = btnAnulujClick
  end
  object btnUsunPozycje: TButton
    Left = 145
    Top = 375
    Width = 104
    Height = 25
    Caption = 'Usu'#324' pozycj'#281
    TabOrder = 7
    OnClick = btnUsunPozycjeClick
  end
  object btnDodajPozycje: TButton
    Left = 8
    Top = 375
    Width = 107
    Height = 25
    Caption = 'Dodaj Pozycje'
    TabOrder = 8
    OnClick = btnDodajPozycjeClick
  end
  object btnDrukuj: TButton
    Left = 286
    Top = 375
    Width = 75
    Height = 25
    Caption = 'Drukuj'
    TabOrder = 9
    OnClick = btnDrukujClick
  end
  object frxReportSzczegolyZamowienia: TfrxReport
    Version = '5.6.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42961.683251701400000000
    ReportOptions.LastChange = 42961.863532592600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 224
    Top = 464
    Datasets = <
      item
        DataSet = frxdb1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Fill.BackColor = 14211288
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Fill.BackColor = 15790320
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Fill.BackColor = 15790320
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftTop]
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 200.315090000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 45.354360000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 14211288
          HAlign = haCenter
          Memo.UTF8W = (
            'Zam'#243'wienie nr [frxDBDataset1."numer_zamowienia"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Top = 52.913420000000000000
          Width = 721.299692880000000000
          Height = 94.488250000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 15790320
          Memo.UTF8W = (
            'Zamawiaj'#261'cy:'
            ''
            'Imi'#281': [frxDBDataset1."imie"]'
            'Nazwisko: [frxDBDataset1."nazwisko"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 241.889920000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Width = 718.110236220471900000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
        object Memo3: TfrxMemoView
          Width = 313.110452880000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 15790320
          Memo.UTF8W = (
            'nazwa')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 313.110452880000000000
          Width = 113.887420510000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 15790320
          HAlign = haCenter
          Memo.UTF8W = (
            'cena')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 426.997873390000000000
          Width = 198.751264490000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = 15790320
          HAlign = haCenter
          Memo.UTF8W = (
            'Ilo'#347#263)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 624.281329310000000000
          Width = 93.828906910000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 15790320
          HAlign = haCenter
          Memo.UTF8W = (
            'Warto'#347#263)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.DropShadow = True
        Height = 22.677180000000000000
        Top = 325.039580000000000000
        Width = 718.110700000000000000
        DataSet = frxdb1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo10: TfrxMemoView
          Width = 313.110452880000000000
          Height = 22.677180000000000000
          DataField = 'nazwa'
          DataSet = frxdb1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            '[frxDBDataset1."nazwa"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 313.110452880000000000
          Width = 113.887420510000000000
          Height = 22.677180000000000000
          DataSet = frxdb1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."cena"] z'#322)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 426.997873390000000000
          Width = 198.751264490000000000
          Height = 22.677180000000000000
          DataField = 'count'
          DataSet = frxdb1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."count"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 624.281329310000000000
          Width = 93.828906910000000000
          Height = 22.677180000000000000
          DataField = 'sum'
          DataSet = frxdb1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset1."sum"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 453.543600000000000000
        Width = 718.110700000000000000
        object Memo16: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo17: TfrxMemoView
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Memo.UTF8W = (
            '[Date] [Time]')
        end
        object Memo18: TfrxMemoView
          Align = baRight
          Left = 642.520100000000000000
          Top = 1.000000000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Page [Page#]')
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 408.189240000000000000
        Width = 718.110700000000000000
        object Memo14: TfrxMemoView
          Left = 529.134200000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            'Suma:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 627.401980000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            '[SUM(<frxDBDataset1."sum">,MasterData1,3)] z'#322)
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxdb1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSource = DataModule1.dsszczegoly
    BCDToCurrency = False
    Left = 328
    Top = 488
  end
end
