inherited frmAgreementVoucher: TfrmAgreementVoucher
  Left = 292
  Top = 208
  Caption = 'frmAgreementVoucher'
  ClientHeight = 472
  ClientWidth = 629
  KeyPreview = True
  OldCreateOrder = True
  OnKeyUp = FormKeyUp
  ExplicitWidth = 645
  ExplicitHeight = 511
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 629
    Height = 383
    ExplicitWidth = 629
    ExplicitHeight = 327
    inherited pgcBrowse: TcxPageControl
      Top = 151
      Width = 627
      Height = 203
      TabOrder = 2
      ClientRectBottom = 202
      ClientRectRight = 626
      inherited tsBrowse: TcxTabSheet
        inherited cxGrid: TcxGrid
          Width = 625
          Height = 201
        end
      end
    end
    object pnl1: TPanel
      Left = 1
      Top = 1
      Width = 627
      Height = 150
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      object lbl1: TLabel
        Left = 13
        Top = 37
        Width = 78
        Height = 16
        Caption = 'Nama Customer'
      end
      object lbl2: TLabel
        Left = 13
        Top = 64
        Width = 77
        Height = 16
        Caption = 'Contact Person'
      end
      object lbl4: TLabel
        Left = 13
        Top = 91
        Width = 70
        Height = 16
        Caption = 'Phone Number'
      end
      object lbl3: TLabel
        Left = 13
        Top = 118
        Width = 39
        Height = 16
        Caption = 'Address'
      end
      object Label1: TLabel
        Left = 13
        Top = 10
        Width = 75
        Height = 16
        Caption = 'Kode Customer'
      end
      object lblSearchCompany: TLinkLabel
        Left = 283
        Top = 9
        Width = 98
        Height = 20
        Cursor = crHandPoint
        Caption = 'F5 [Cari Cusomer]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMenuHighlight
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        TabOrder = 5
        OnClick = lblSearchCompanyClick
      end
      object edtName: TEdit
        Left = 105
        Top = 35
        Width = 174
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
        Text = 'edtName'
      end
      object edtContact: TEdit
        Left = 105
        Top = 62
        Width = 127
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
        Text = 'edtContact'
      end
      object edtPhone: TEdit
        Left = 105
        Top = 89
        Width = 127
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 3
        Text = 'edtPhone'
      end
      object edtAddress: TEdit
        Left = 105
        Top = 116
        Width = 287
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 4
        Text = 'edtAddress'
      end
      object edtCode: TEdit
        Left = 105
        Top = 8
        Width = 85
        Height = 22
        Ctl3D = False
        MaxLength = 8
        ParentCtl3D = False
        TabOrder = 0
        Text = 'edtCode'
        OnChange = edtCodeChange
        OnKeyDown = edtCodeKeyDown
        OnKeyPress = edtCodeKeyPress
      end
      object cxButton1: TcxButton
        Left = 203
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Search'
        TabOrder = 6
      end
    end
    object pnl2: TPanel
      Left = 1
      Top = 354
      Width = 627
      Height = 28
      Align = alBottom
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      ExplicitTop = 298
      DesignSize = (
        627
        28)
      object btnValidate: TcxButton
        Left = 526
        Top = 0
        Width = 87
        Height = 29
        Anchors = [akRight, akBottom]
        Caption = '&Validate'
        OptionsImage.Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF005019FF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFF7F7F7FFF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF005019009900005019FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFF7F7F7FFF00FF7F
          7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF005019009900009900009900005019FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFF7F7F7FFF00FFFF00FFFF
          00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF00501933CC6633CC6600B93D00B93D009900005019FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFF7F7F7FFF00FFFF00FFFF00FFFF
          00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          00501933CC6666FF9900B93D33CC6600B93D00B93D009900005019FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFFFFFF7F7F7FFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF005019
          33CC6666FF9933CC6666FF9933CC6633CC6600B93D00B93D009900005019FF00
          FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FF006600
          66FF9933CC6666FF9933CC6666FF9966FF9933CC6600B93D00B93D0099000050
          19FF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFFFFFFFF
          00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FF006600
          66FF9966FF9933CC6666FF99006600CCFFCC66FF9933CC6600B93D00B93D0099
          00005019FF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFFFFFF7F7F7FFF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF006600
          CCFFCC66FF9966FF99006600FF00FF006600CCFFCC66FF9933CC6600B93D00B9
          3D009900005019FF00FFFF00FF7F7F7FFFFFFFFF00FFFFFFFF7F7F7FFF00FF7F
          7F7FFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FF006600
          CCFFCCCCFFCC006600FF00FFFF00FFFF00FF006600CCFFCC66FF9933CC6600B9
          3D00B93D005019FF00FFFF00FF7F7F7FFFFFFFFFFFFF7F7F7FFF00FFFF00FFFF
          00FF7F7F7FFFFFFFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FF006600
          CCFFCC006600FF00FFFF00FFFF00FFFF00FFFF00FF006600CCFFCC66FF9933CC
          6600B93D005019FF00FFFF00FF7F7F7FFFFFFF7F7F7FFF00FFFF00FFFF00FFFF
          00FFFF00FF7F7F7FFFFFFFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FF006600
          006600FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600CCFFCC66FF
          9933CC66005019FF00FFFF00FF7F7F7F7F7F7FFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF7F7F7FFFFFFFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF006600CCFF
          CC66FF99005019FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF7F7F7FFFFFFFFF00FF7F7F7FFFFFFFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0066
          00CCFFCC005019FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFF7F7F7FFFFFFFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FF006600005019FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7F7F7F7FFFFFFFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FF005019FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F7F7FFFFFFF}
        TabOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnValidateClick
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 629
    ExplicitWidth = 629
    inherited lblFilterData: TcxLabel
      Left = 275
      ExplicitLeft = 275
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 336
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 452
    end
    inherited btnSearch: TcxButton
      Left = 547
    end
    inherited lblsdFilter: TcxLabel
      Left = 428
      ExplicitLeft = 428
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 416
    Width = 629
    inherited pnlFooter: TPanel
      Width = 629
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
        Action = actClose
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 629
      inherited lbEscape: TLabel
        Left = 555
        Height = 17
      end
    end
  end
end
