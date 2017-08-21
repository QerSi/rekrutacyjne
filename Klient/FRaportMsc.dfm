object RaportMsc: TRaportMsc
  Left = 0
  Top = 0
  Width = 787
  Height = 464
  Align = alTop
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  ExplicitWidth = 451
  object lbl1: TLabel
    Left = 74
    Top = 418
    Width = 584
    Height = 16
    Caption = 
      '* Pozostawienie pustych p'#243'l miesi'#261'c i rok spowoduje wygenerowani' +
      'e raportu dla aktualnego miesi'#261'ca'
  end
  object dbgrd1: TDBGrid
    Left = 66
    Top = 222
    Width = 681
    Height = 190
    DataSource = DataModule1.dsRaportMsc
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
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
  object pnl1: TPanel
    Left = 66
    Top = 135
    Width = 681
    Height = 73
    Color = clSilver
    ParentBackground = False
    TabOrder = 1
    object lbl2: TLabel
      Left = 41
      Top = 3
      Width = 42
      Height = 16
      Caption = 'Miesi'#261'c'
    end
    object lbl3: TLabel
      Left = 208
      Top = 3
      Width = 21
      Height = 16
      Caption = 'Rok'
    end
    object chkAnulowane: TCheckBox
      Left = 8
      Top = 55
      Width = 221
      Height = 17
      Caption = 'Uwzgl'#281'dnij anulowane zam'#243'wienia'
      TabOrder = 0
    end
    object edtMiesiac: TEdit
      Left = 8
      Top = 25
      Width = 121
      Height = 24
      MaxLength = 2
      TabOrder = 1
    end
    object edtRok: TEdit
      Left = 160
      Top = 25
      Width = 121
      Height = 24
      MaxLength = 4
      TabOrder = 2
      OnExit = edtRokExit
    end
    object btnGeneruj: TButton
      Left = 488
      Top = 24
      Width = 113
      Height = 25
      Caption = 'Generuj raport'
      TabOrder = 3
      OnClick = btnGenerujClick
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 0
    Width = 787
    Height = 113
    Align = alTop
    Color = clMoneyGreen
    ParentBackground = False
    TabOrder = 2
    ExplicitWidth = 451
    object lbl4: TLabel
      Left = 273
      Top = 34
      Width = 266
      Height = 33
      Caption = 'Raporty miesi'#281'czne'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object frxRaportMsc: TfrxReport
    Version = '5.6.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42962.677177129600000000
    ReportOptions.LastChange = 42968.596805937500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 680
    Top = 24
    Datasets = <
      item
        DataSet = frxdbRaportMsc
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Fill.BackColor = clBlack
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Fill.BackColor = clBlack
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Fill.BackColor = 52479
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
        Font.Style = [fsBold]
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
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = clBlack
          HAlign = haCenter
          Memo.UTF8W = (
            'Zestawienie zam'#243'wie'#324)
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 113.385900000000000000
        Top = 105.826840000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBDataset1."numer_zamowienia"'
        object Memo2: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          DataSet = frxdbRaportMsc
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Fill.BackColor = 52479
          Memo.UTF8W = (
            'Numer zam'#243'wienia : [frxDBDataset1."numer_zamowienia"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Top = 26.456709999999990000
          Width = 114.000000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Fill.BackColor = clBlack
          Memo.UTF8W = (
            'login')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 114.000000000000000000
          Top = 26.456709999999990000
          Width = 151.000000000000000000
          Height = 18.897650000000000000
          DataField = 'login'
          DataSet = frxdbRaportMsc
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."login"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo5: TfrxMemoView
          Top = 45.354360000000010000
          Width = 114.000000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = clBlack
          Memo.UTF8W = (
            'Imi'#281' i nazwisko')
          ParentFont = False
          Style = 'Header'
        end
        object Memo6: TfrxMemoView
          Left = 113.779530000000000000
          Top = 45.354360000000010000
          Width = 313.519790000000000000
          Height = 18.897650000000000000
          DataSet = frxdbRaportMsc
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."imie"] [frxDBDataset1."nazwisko"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo9: TfrxMemoView
          Top = 64.252010000000010000
          Width = 114.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Fill.BackColor = clBlack
          Memo.UTF8W = (
            'Data zam'#243'wienia')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 113.779530000000000000
          Top = 68.031540000000010000
          Width = 78.000000000000000000
          Height = 18.897650000000000000
          DataField = 'data_zamowienia'
          DataSet = frxdbRaportMsc
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."data_zamowienia"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo11: TfrxMemoView
          Left = 597.165740000000000000
          Top = 90.708720000000000000
          Width = 121.559060000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = clBlack
          Memo.UTF8W = (
            'Kwota : [frxDBDataset1."sum"] z'#322)
          ParentFont = False
          Style = 'Header'
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Top = 241.889920000000000000
        Width = 718.110700000000000000
        DataSet = frxdbRaportMsc
        DataSetName = 'frxDBDataset1'
        RowCount = 0
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 404.409710000000000000
        Width = 718.110700000000000000
        object Memo13: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo14: TfrxMemoView
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Memo.UTF8W = (
            '[Date] [Time]')
        end
        object Memo15: TfrxMemoView
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
        Height = 79.370130000000000000
        Top = 302.362400000000000000
        Width = 718.110700000000000000
        object Memo7: TfrxMemoView
          Align = baWidth
          Top = 7.559059999999988000
          Width = 718.110700000000000000
          Height = 64.252010000000000000
          DataSet = frxdbRaportMsc
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Fill.BackColor = 52479
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 166.299320000000000000
          Top = 30.236240000000010000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Fill.BackColor = clBlack
          Memo.UTF8W = (
            '[SUM(<frxDBDataset1."idstatusy"> = 3,MasterData1,1)]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 3.779530000000000000
          Top = 30.236240000000010000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Fill.BackColor = clBlack
          Memo.UTF8W = (
            'Zam'#243'wienia anulowane:')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 525.354670000000000000
          Top = 30.236240000000010000
          Width = 185.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = clBlack
          Memo.UTF8W = (
            'Warto'#347#263' zam'#243'wie'#324': [SUM(<frxDBDataset1."sum">,MasterData1,3)] z'#322)
          ParentFont = False
          Style = 'Header'
        end
      end
    end
  end
  object frxdbRaportMsc: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSource = DataModule1.dsRaportMsc
    BCDToCurrency = False
    Left = 744
    Top = 48
  end
end
