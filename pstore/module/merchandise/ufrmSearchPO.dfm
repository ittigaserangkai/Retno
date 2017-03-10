inherited frmDialogSearchPO: TfrmDialogSearchPO
  Left = 199
  Top = 193
  Caption = 'Search PO...'
  ClientHeight = 400
  ClientWidth = 644
  Constraints.MinHeight = 32
  OldCreateOrder = True
  ExplicitWidth = 660
  ExplicitHeight = 439
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 644
    Height = 344
    ExplicitWidth = 644
    ExplicitHeight = 344
    inherited cxGrid: TcxGrid
      Top = 89
      Width = 640
      Height = 219
      TabOrder = 2
      inherited cxGridView: TcxGridDBTableView
        object cxGridViewColumn1: TcxGridDBColumn
          Caption = 'Division Name'
          Width = 109
        end
        object cxGridViewColumn2: TcxGridDBColumn
          Caption = 'Category'
          Width = 172
        end
        object cxGridViewColumn3: TcxGridDBColumn
          Caption = 'No. PO'
          Width = 121
        end
        object cxGridViewColumn4: TcxGridDBColumn
          Caption = 'Status'
        end
        object cxGridViewColumn5: TcxGridDBColumn
          Caption = 'Supplier Code'
          Width = 59
        end
        object cxGridViewColumn6: TcxGridDBColumn
          Caption = 'Supplier Name'
          Width = 81
        end
        object cxGridViewColumn7: TcxGridDBColumn
          Caption = 'Date'
        end
      end
    end
    object pnl1: TPanel
      Left = 2
      Top = 2
      Width = 640
      Height = 87
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      object lbl1: TLabel
        Left = 10
        Top = 5
        Width = 72
        Height = 16
        Caption = 'Number of PO:'
      end
      object lbl2: TLabel
        Left = 145
        Top = 5
        Width = 71
        Height = 16
        Caption = 'Supplier Code:'
      end
      object lbl3: TLabel
        Left = 233
        Top = 4
        Width = 73
        Height = 16
        Caption = 'Supplier Name:'
      end
      object lbl5: TLabel
        Left = 238
        Top = 55
        Width = 17
        Height = 16
        Caption = 's/d'
      end
      object edt1: TEdit
        Left = 8
        Top = 23
        Width = 121
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        OnChange = edt1Change
        OnKeyDown = edt1KeyDown
        OnKeyUp = edt1KeyUp
      end
      object edt2: TEdit
        Left = 144
        Top = 23
        Width = 73
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        OnChange = edt2Change
        OnKeyPress = edt2KeyPress
      end
      object edt3: TEdit
        Left = 232
        Top = 23
        Width = 252
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
        OnChange = edt3Change
      end
      object dtTgl: TcxDateEdit
        Left = 92
        Top = 54
        TabOrder = 4
        Width = 137
      end
      object dt1: TcxDateEdit
        Left = 262
        Top = 54
        TabOrder = 5
        Width = 137
      end
      object chkDate: TCheckBox
        Left = 8
        Top = 56
        Width = 81
        Height = 17
        Caption = 'Date of PO:'
        TabOrder = 3
        OnClick = chkDateClick
      end
      object btnBrowsePoNo: TcxButton
        Left = 402
        Top = 54
        Width = 82
        Height = 25
        Caption = 'F2'
        OptionsImage.ImageIndex = 30
        OptionsImage.Images = DMClient.imgListButton
        TabOrder = 6
      end
    end
    object pnl2: TPanel
      Left = 2
      Top = 308
      Width = 640
      Height = 34
      Align = alBottom
      BevelOuter = bvNone
      Color = 15198183
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      Visible = False
      object Label1: TLabel
        Left = 9
        Top = 5
        Width = 71
        Height = 16
        Caption = 'Sum of CN Qty'
      end
      object Label2: TLabel
        Left = 145
        Top = 5
        Width = 71
        Height = 16
        Caption = 'Sum of DN Qty'
      end
      object edtCN: TEdit
        Left = 88
        Top = 3
        Width = 49
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        OnChange = edt2Change
        OnKeyPress = edt2KeyPress
      end
      object edtDN: TEdit
        Left = 224
        Top = 3
        Width = 49
        Height = 22
        CharCase = ecUpperCase
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
        OnChange = edt2Change
        OnKeyPress = edt2KeyPress
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog3Button
    Top = 344
    Width = 644
    ExplicitTop = 344
    ExplicitWidth = 644
    inherited pnlFooter: TPanel
      Width = 644
      ExplicitWidth = 644
      inherited btnClose: TcxButton
        Left = 562
        TabOrder = 1
        ExplicitLeft = 562
      end
      inherited btnSave: TcxButton
        Left = 453
        Action = actSave
        Caption = 'Select'
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
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 453
      end
      inherited btnDelete: TcxButton
        Action = actDelete
      end
    end
    inherited pnlSortCut: TPanel
      Width = 644
      ExplicitWidth = 644
      inherited lbl4: TLabel
        Left = 445
        Width = 98
        Caption = 'Ctrl - Enter [Select]'
        ExplicitLeft = 447
        ExplicitWidth = 98
      end
      inherited lbl5: TLabel
        Left = 554
        Width = 72
        Caption = 'Escape [Close]'
        ExplicitLeft = 556
        ExplicitWidth = 72
      end
    end
  end
end
