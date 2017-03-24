inherited frmLaporanRetur: TfrmLaporanRetur
  Left = 195
  Top = 78
  Caption = 'Laporan Retur'
  ClientHeight = 466
  ClientWidth = 832
  ExplicitWidth = 848
  ExplicitHeight = 505
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 832
    Height = 377
    ExplicitWidth = 832
    ExplicitHeight = 437
    inherited pgcBrowse: TcxPageControl
      Top = 81
      Width = 810
      Height = 285
      TabOrder = 1
      ExplicitTop = 81
      ExplicitWidth = 810
      ExplicitHeight = 345
      ClientRectBottom = 284
      ClientRectRight = 809
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 808
        ExplicitHeight = 343
        inherited cxGrid: TcxGrid
          Width = 808
          Height = 283
          ExplicitWidth = 808
          ExplicitHeight = 343
        end
      end
    end
    object pnltengah: TPanel
      Left = 11
      Top = 11
      Width = 810
      Height = 70
      Align = alTop
      Color = 15198183
      TabOrder = 0
      object lbl1: TLabel
        Left = 40
        Top = 8
        Width = 33
        Height = 16
        Caption = 'Suplier'
      end
      object lbl2: TLabel
        Left = 35
        Top = 32
        Width = 37
        Height = 16
        Caption = 'Periode'
      end
      object lbl3: TLabel
        Left = 208
        Top = 36
        Width = 34
        Height = 16
        Caption = 'Sampai'
      end
      object dtTo: TcxDateEdit
        Left = 248
        Top = 33
        TabOrder = 3
        Width = 145
      end
      object edKodeSuplier: TcxButtonEdit
        Left = 80
        Top = 8
        Properties.Buttons = <>
        TabOrder = 0
        Text = '0'
        Width = 121
      end
      object edtNamaSuplier: TEdit
        Left = 208
        Top = 8
        Width = 185
        Height = 22
        TabStop = False
        Color = 15198183
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 5
      end
      object dtFrom: TcxDateEdit
        Left = 80
        Top = 33
        TabOrder = 2
        Width = 121
      end
      object chkAllSuplier: TCheckBox
        Left = 400
        Top = 8
        Width = 97
        Height = 17
        Caption = 'Semua Suplier'
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        OnClick = chkAllSuplierClick
      end
      object btnShow: TcxButton
        Left = 400
        Top = 32
        Width = 80
        Height = 27
        Caption = 'Show'
        OptionsImage.Glyph.Data = {
          C6070000424DC607000000000000360000002800000016000000160000000100
          2000000000009007000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000BDCE0000ADCE0000B5
          CE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF0000C6CE00A5DEF70073DEFF0042C6EF0018B5DE0000B5
          D60000B5D60000BDCE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF0000ADCE007BCEE700ADEFFF006BDEFF007BE7FF0084E7FF007BDEFF0052C6
          F70010BDDE0008BDDE0008BDDE0000BDD600FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000ADCE0042B5
          DE00ADE7FF0073DEFF006BD6FF006BD6FF0073DEFF0073DEFF007BE7FF007BE7
          FF007BDEFF006BD6FF0039C6E70018C6DE0010C6DE00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0000ADCE0031B5DE008CD6EF009CE7
          FF006BDEFF0073DEFF0073DEFF0073DEFF0073DEFF0073DEFF0073DEFF007BDE
          FF007BE7FF0084E7FF0084E7FF004ADEF700FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF0000ADCE0042BDE70052BDDE00ADEFFF007BE7FF007BE7
          FF007BE7FF007BE7FF007BE7FF007BE7FF007BE7FF007BE7FF007BE7FF007BE7
          FF007BE7FF007BDEFF0000BDD600FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF0000B5CE0052C6EF0029ADD6009CDEF7009CEFFF007BE7FF007BE7FF007BE7
          FF007BE7FF007BE7FF007BE7FF007BE7FF007BE7FF007BE7FF0084E7FF006BDE
          FF005ADEF700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000B5CE0063CE
          F70029ADDE0073CEE700B5F7FF007BEFFF0084EFFF0084EFFF0084EFFF0084EF
          FF0084EFFF0084EFFF0084EFFF0084EFFF008CEFFF0073E7F7008CF7FF0000C6
          D600FF00FF00FF00FF00FF00FF00FF00FF0000B5CE0073D6FF0039B5E70039B5
          DE00ADEFF700A5FFFF008CF7FF008CF7FF0084F7FF0084F7FF0084F7FF008CF7
          FF008CF7FF008CF7FF008CF7FF0084EFFF008CF7FF0094FFFF0010ADD600FF00
          FF00FF00FF00FF00FF0000B5CE007BDEFF0052C6F70021ADDE006BCEE700E7FF
          FF00EFFFFF00EFFFFF00F7FFFF00C6FFFF0094FFFF0084F7FF008CF7FF0094FF
          FF008CF7F70031A55A0052BD8C00B5FFFF004AD6EF0000ADCE00FF00FF00FF00
          FF0000B5CE0094E7FF0063CEFF0052C6F700089CD6000094CE000094CE000094
          CE000094CE007BCEE700FFFFFF00C6FFFF00ADFFFF00A5F7FF004AAD73001894
          2100088C100073CE9C00DEFFFF0000B5D600FF00FF00FF00FF0000B5CE00A5E7
          FF0063D6FF0073D6FF0073DEFF0073D6FF006BD6FF006BD6FF0052C6F700089C
          D60031ADDE00E7F7FF00E7FFFF006BBD8400109C290063EF94005ADE8C00008C
          10009CD6AD00E7FFFF0000ADCE00FF00FF0000B5CE00ADF7FF006BDEFF007BDE
          FF0073DEFF0073DEFF0073DEFF0073DEFF007BE7FF0073DEFF0018ADDE0018A5
          D6005AB584000894180052DE84005AE78C005AEF940052DE8400008C1000BDDE
          AD00009CDE00FF00FF0000B5CE00B5FFFF0073E7FF007BE7FF007BE7FF007BE7
          FF007BE7FF007BE7FF007BE7FF007BE7FF007BE7FF00189C7300007B000021AD
          390039C6630052DE7B005AE784004AD67B0029B5420000840000FF00FF00FF00
          FF0000B5CE00C6FFFF007BEFFF008CEFFF008CEFFF008CEFFF0084EFFF008CF7
          FF009CFFFF009CFFFF009CFFFF0042AD520052BD730042AD5A0029A5390042CE
          6B0052E78400109C2100FF00FF00FF00FF00FF00FF00FF00FF0000BDCE00CEFF
          FF0084FFFF008CFFFF008CFFFF008CFFFF0094FFFF00A5FFFF0052DEE7004ADE
          E7004ADEE7004ADEEF004AE7F70042CED60021A55A0039C65A004AD66B0000AD
          0800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF004ADEDE00E7FFFF00B5FF
          FF00BDFFFF00BDFFFF00BDFFFF0031DEE700FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00009C290039CE520018B53900FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0021D6D60021C6DE0021C6DE0021C6
          DE0008CED600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF0000A5100031C64A0000AD0800FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF001884290010AD210000B5
          1000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF0008841000187B210000A5000000AD0000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00008C0800008C1000008C
          1000008C0800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00}
        TabOrder = 4
        Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object chkAllUnit: TCheckBox
        Left = 528
        Top = 8
        Width = 97
        Height = 17
        Caption = 'Semua Unit'
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 6
        OnClick = chkAllSuplierClick
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 832
    ExplicitWidth = 832
    inherited lblHeader: TLabel
      Width = 89
      Caption = 'LAPORAN RETUR'
      ExplicitWidth = 89
    end
    inherited lblFilterData: TcxLabel
      Left = 478
      ExplicitLeft = 478
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 539
      ExplicitLeft = 539
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 655
      ExplicitLeft = 655
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 750
      ExplicitLeft = 750
    end
    inherited lblsdFilter: TcxLabel
      Left = 631
      ExplicitLeft = 631
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 410
    Width = 832
    ExplicitTop = 470
    ExplicitWidth = 832
    inherited pnlFooter: TPanel
      Width = 832
      ExplicitWidth = 832
      inherited btnAdd: TcxButton
        Action = actAdd
      end
      inherited btnUpdate: TcxButton
        Action = actEdit
      end
      inherited btnPrint: TcxButton
        Action = actPrint
      end
      inherited btnClose: TcxButton
        Left = 755
        Action = actClose
        ExplicitLeft = 755
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 832
      ExplicitWidth = 832
      inherited lbEscape: TLabel
        Left = 758
        Height = 17
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actPrint: TAction
      OnExecute = actPrintExecute
    end
  end
  object dataset: TfrxDBDataset
    UserName = 'dataset'
    CloseDataSource = False
    BCDToCurrency = False
    Left = 640
    Top = 56
  end
end
