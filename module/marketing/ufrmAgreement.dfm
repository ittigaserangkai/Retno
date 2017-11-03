inherited frmAgreement: TfrmAgreement
  Caption = 'Master Agreement'
  ClientHeight = 411
  ClientWidth = 708
  ExplicitWidth = 724
  ExplicitHeight = 450
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 708
    Height = 322
    ExplicitWidth = 124
    inherited pgcBrowse: TcxPageControl
      Width = 706
      Height = 320
      ExplicitWidth = 122
      ClientRectBottom = 319
      ClientRectRight = 705
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 120
        ExplicitHeight = 310
        inherited cxGrid: TcxGrid
          Width = 704
          Height = 318
          ExplicitWidth = 120
          inherited cxGridView: TcxGridDBTableView
            object cxGridViewColumn1: TcxGridDBColumn
              Caption = 'No Agreement'
              HeaderAlignmentHorz = taCenter
              Width = 96
            end
            object cxGridViewColumn2: TcxGridDBColumn
              Caption = 'Customer'
              HeaderAlignmentHorz = taCenter
              Width = 96
            end
            object cxGridViewColumn3: TcxGridDBColumn
              Caption = 'Date Start'
              HeaderAlignmentHorz = taCenter
            end
            object cxGridViewColumn4: TcxGridDBColumn
              Caption = 'Date End'
              HeaderAlignmentHorz = taCenter
              Width = 80
            end
            object cxGridViewColumn5: TcxGridDBColumn
              Caption = 'Invoice Start'
              HeaderAlignmentHorz = taCenter
              Width = 114
            end
            object cxGridViewColumn6: TcxGridDBColumn
              Caption = 'Total'
              HeaderAlignmentHorz = taCenter
            end
            object cxGridViewColumn7: TcxGridDBColumn
              Caption = 'Description'
              HeaderAlignmentHorz = taCenter
              Width = 105
            end
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 708
    ExplicitWidth = 124
    inherited lblFilterData: TcxLabel
      Left = 354
      ExplicitLeft = -230
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 415
      ExplicitLeft = -169
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 531
      ExplicitLeft = -53
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 626
      ExplicitLeft = 42
    end
    inherited lblsdFilter: TcxLabel
      Left = 507
      ExplicitLeft = -77
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 355
    Width = 708
    ExplicitTop = -56
    ExplicitWidth = 124
    inherited pnlFooter: TPanel
      Width = 708
      ExplicitWidth = 124
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
        Left = 631
        Action = actClose
        ExplicitLeft = 47
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 708
      ExplicitWidth = 124
      inherited lbEscape: TLabel
        Left = 634
        Height = 17
      end
    end
  end
  inherited actlstBrowse: TActionList
    inherited actAdd: TAction
      OnExecute = actAddExecute
    end
  end
end
