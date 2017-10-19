inherited frmShift: TfrmShift
  Caption = 'SHIFT'
  ClientHeight = 349
  ClientWidth = 718
  ExplicitWidth = 734
  ExplicitHeight = 388
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 718
    Height = 260
    ExplicitWidth = 718
    ExplicitHeight = 260
    inherited pgcBrowse: TcxPageControl
      Width = 716
      Height = 258
      ExplicitWidth = 716
      ExplicitHeight = 258
      ClientRectBottom = 257
      ClientRectRight = 715
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 714
        ExplicitHeight = 256
        inherited cxGrid: TcxGrid
          Width = 714
          Height = 256
          ExplicitWidth = 714
          ExplicitHeight = 256
          inherited cxGridView: TcxGridDBTableView
            FilterRow.Visible = False
            object cxGridViewColumn2: TcxGridDBColumn
              Caption = 'NAMA SHIFT'
              DataBinding.FieldName = 'SHIFT_NAME'
            end
            object cxGridViewColumn3: TcxGridDBColumn
              Caption = 'SHIFT DIMULAI'
              DataBinding.FieldName = 'SHIFT_START_TIME'
              PropertiesClassName = 'TcxTimeEditProperties'
              Options.Editing = False
            end
            object cxGridViewColumn4: TcxGridDBColumn
              Caption = 'SHIFT BERAKHIR'
              DataBinding.FieldName = 'SHIFT_END_TIME'
              PropertiesClassName = 'TcxTimeEditProperties'
              Options.Editing = False
            end
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 718
    ExplicitWidth = 718
    inherited lblHeader: TLabel
      Width = 30
      Caption = 'SHIFT'
      ExplicitWidth = 30
    end
    inherited lblFilterData: TcxLabel
      Left = 364
      ExplicitLeft = 364
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 425
      ExplicitLeft = 425
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 541
      ExplicitLeft = 541
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 636
      ExplicitLeft = 636
    end
    inherited lblsdFilter: TcxLabel
      Left = 517
      ExplicitLeft = 517
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 293
    Width = 718
    ExplicitTop = 293
    ExplicitWidth = 718
    inherited pnlFooter: TPanel
      Width = 718
      ExplicitWidth = 718
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
        Left = 641
        Action = actClose
        ExplicitLeft = 641
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 718
      ExplicitWidth = 718
      inherited lbEscape: TLabel
        Left = 644
        Height = 17
        ExplicitLeft = 644
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
  end
end
