inherited frmTipePerusahaan: TfrmTipePerusahaan
  Left = 184
  Top = 237
  Caption = 'Company Type'
  ClientHeight = 324
  ClientWidth = 546
  OldCreateOrder = True
  OnDeactivate = FormDeactivate
  ExplicitWidth = 562
  ExplicitHeight = 363
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 546
    Height = 238
    ExplicitWidth = 546
    ExplicitHeight = 238
    object cxGrid: TcxGrid
      Left = 11
      Top = 11
      Width = 524
      Height = 216
      Align = alClient
      TabOrder = 0
      object cxGridViewTipePerusahaan: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        object cxGridViewTipePerusahaanColumn1: TcxGridDBColumn
          DataBinding.FieldName = 'REF$TIPE_PERUSAHAAN_ID'
          Visible = False
        end
        object cxGridViewTipePerusahaanColumn2: TcxGridDBColumn
          Caption = 'KODE'
          DataBinding.FieldName = 'TPPERSH_CODE'
        end
        object cxGridViewTipePerusahaanColumn3: TcxGridDBColumn
          Caption = 'NAMA'
          DataBinding.FieldName = 'TPPERSH_NAME'
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxGridViewTipePerusahaan
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 546
    ExplicitWidth = 546
  end
  inline fraFooter5Button1: TfraFooter5Button [2]
    Left = 0
    Top = 268
    Width = 546
    Height = 56
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitTop = 268
    ExplicitWidth = 546
    inherited pnlFooter: TPanel
      Width = 546
      ExplicitWidth = 546
      inherited btnClose: TcxButton
        Left = 466
        ExplicitLeft = 466
      end
      inherited btnAdd: TcxButton
        Action = actAddTipePerusahaan
      end
      inherited btnUpdate: TcxButton
        Action = actEditTipePerusahaan
      end
      inherited btnDelete: TcxButton
        Action = actDeleteTipePerusahaan
      end
      inherited btnRefresh: TcxButton
        Action = actRefreshTipePerusahaan
      end
    end
    inherited pnlSortCut: TPanel
      Width = 546
      ExplicitWidth = 546
      inherited lbl5: TLabel
        Left = 458
        ExplicitLeft = 452
      end
    end
  end
  inherited cxStyle: TcxStyleRepository
    PixelsPerInch = 96
  end
  object actlstTipeSupplier: TActionList
    Left = 440
    Top = 8
    object actAddTipePerusahaan: TAction
      Caption = 'Add'
      OnExecute = actAddTipePerusahaanExecute
    end
    object actEditTipePerusahaan: TAction
      Caption = 'Edit'
      OnExecute = actEditTipePerusahaanExecute
    end
    object actDeleteTipePerusahaan: TAction
      Caption = 'Delete'
      OnExecute = actDeleteTipePerusahaanExecute
    end
    object actRefreshTipePerusahaan: TAction
      Caption = 'Refresh'
      OnExecute = actRefreshTipePerusahaanExecute
    end
  end
end
