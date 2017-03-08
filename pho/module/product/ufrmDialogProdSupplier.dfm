inherited frmDialogProdSupplier: TfrmDialogProdSupplier
  Caption = 'frmDialogProdSupplier'
  ClientHeight = 283
  ClientWidth = 526
  Constraints.MinHeight = 32
  Constraints.MinWidth = 130
  OldCreateOrder = True
  ExplicitWidth = 542
  ExplicitHeight = 322
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 526
    Height = 227
    ExplicitWidth = 528
    ExplicitHeight = 253
    object lbl1: TLabel
      Left = 16
      Top = 8
      Width = 67
      Height = 16
      Caption = 'Product Code'
    end
    object lbl2: TLabel
      Left = 163
      Top = 41
      Width = 58
      Height = 16
      Caption = 'Description'
    end
    object lbl3: TLabel
      Left = 162
      Top = 60
      Width = 75
      Height = 16
      Caption = 'Company Name'
    end
    object lbl4: TLabel
      Left = 163
      Top = 87
      Width = 69
      Height = 16
      Caption = 'Supplier Name'
    end
    object lbl5: TLabel
      Left = 164
      Top = 120
      Width = 62
      Height = 16
      Caption = 'Date Create'
    end
    object lbl6: TLabel
      Left = 164
      Top = 144
      Width = 61
      Height = 16
      Caption = 'Time Create'
    end
    object lbl7: TLabel
      Left = 166
      Top = 170
      Width = 61
      Height = 16
      Caption = 'User Create'
    end
    object lbl8: TLabel
      Left = 372
      Top = 120
      Width = 36
      Height = 16
      Caption = 'Update'
    end
    object lbl9: TLabel
      Left = 347
      Top = 146
      Width = 62
      Height = 16
      Caption = 'Time Update'
    end
    object lbl10: TLabel
      Left = 347
      Top = 172
      Width = 62
      Height = 16
      Caption = 'User Update'
    end
    object edt1: TEdit
      Left = 91
      Top = 8
      Width = 54
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      Text = '000001'
    end
    object edt2: TEdit
      Left = 149
      Top = 8
      Width = 220
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      Text = 'PATRA (ANEKA BUAH LOKAL)'
    end
    object edt3: TEdit
      Left = 244
      Top = 61
      Width = 269
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      Text = 'PATRA (ANEKA BUAH LOKAL)'
    end
    object edt4: TEdit
      Left = 244
      Top = 87
      Width = 269
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
      Text = 'PATRA (ANEKA BUAH LOKAL)'
    end
    object edTimeCreate: TEdit
      Left = 232
      Top = 145
      Width = 97
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 4
      Text = '00:00:00'
    end
    object edUserCreate: TEdit
      Left = 232
      Top = 170
      Width = 97
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 5
    end
    object edtTimeUpdate: TEdit
      Left = 416
      Top = 145
      Width = 97
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 6
      Text = '00:00:00'
    end
    object edUserUpdate: TEdit
      Left = 416
      Top = 170
      Width = 97
      Height = 22
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 7
    end
    object dtTglCreate: TcxDateEdit
      Left = 232
      Top = 118
      TabOrder = 8
      Width = 97
    end
    object dtTglUpdate: TcxDateEdit
      Left = 416
      Top = 118
      TabOrder = 9
      Width = 97
    end
    object cxGrid: TcxGrid
      Left = 8
      Top = 48
      Width = 145
      Height = 169
      TabOrder = 10
      object cxGridViewSupplier: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
        object cxGridViewSupplierColumn1: TcxGridDBColumn
          Caption = 'Company'
        end
        object cxGridViewSupplierColumn2: TcxGridDBColumn
          Caption = 'Supplier Code'
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridViewSupplier
      end
    end
  end
  inherited footerDialogMaster: TfraFooterDialog2Button
    Top = 227
    Width = 526
    ExplicitTop = 253
    ExplicitWidth = 528
    inherited pnlFooter: TPanel
      Width = 526
      ExplicitWidth = 528
      inherited btnClose: TcxButton
        Left = 444
        ExplicitLeft = 446
      end
      inherited btnSave: TcxButton
        OnClick = footerDialogMasterbtnSaveClick
        ExplicitLeft = 359
      end
    end
    inherited pnlSortCut: TPanel
      Width = 526
      ExplicitWidth = 528
      inherited lbl4: TLabel
        Left = 341
        ExplicitLeft = 343
      end
      inherited lbl5: TLabel
        Left = 436
        ExplicitLeft = 438
      end
    end
  end
end
