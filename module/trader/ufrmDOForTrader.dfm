inherited frmDOForTrader: TfrmDOForTrader
  Left = 289
  Top = 80
  Caption = 'DO For Assgros'
  ClientHeight = 451
  ClientWidth = 887
  OldCreateOrder = True
  ExplicitWidth = 903
  ExplicitHeight = 490
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 887
    Height = 362
    BevelInner = bvLowered
    BevelOuter = bvSpace
    ExplicitWidth = 887
    ExplicitHeight = 362
    inherited pgcBrowse: TcxPageControl
      Left = 2
      Top = 2
      Width = 883
      Height = 358
      ExplicitLeft = 2
      ExplicitTop = 2
      ExplicitWidth = 883
      ExplicitHeight = 358
      ClientRectBottom = 357
      ClientRectRight = 882
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 881
        ExplicitHeight = 356
        inherited cxGrid: TcxGrid
          Width = 881
          Height = 356
          ExplicitWidth = 881
          ExplicitHeight = 356
          inherited cxGridView: TcxGridDBTableView
            object cxGridViewColumn1: TcxGridDBColumn
              Caption = 'Nomor DO'
              DataBinding.FieldName = 'DOT_NO'
              HeaderAlignmentHorz = taCenter
              Width = 71
            end
            object cxGridViewColumn2: TcxGridDBColumn
              Caption = 'Tgl DO'
              DataBinding.FieldName = 'ORG_CODE'
              HeaderAlignmentHorz = taCenter
              Width = 87
            end
            object cxGridViewColumn3: TcxGridDBColumn
              Caption = 'Deskripsi'
              DataBinding.FieldName = 'DOT_DESCRIPTION'
              HeaderAlignmentHorz = taCenter
              Width = 176
            end
            object cxGridViewColumn4: TcxGridDBColumn
              Caption = 'Kode Organisasi'
              DataBinding.FieldName = 'ORG_CODE'
              HeaderAlignmentHorz = taCenter
              Width = 141
            end
            object cxGridViewColumn5: TcxGridDBColumn
              Caption = 'Nama Organisasi'
              DataBinding.FieldName = 'ORG_NAME'
              HeaderAlignmentHorz = taCenter
              Width = 235
            end
            object cxGridViewColumn6: TcxGridDBColumn
              Caption = 'Total'
              DataBinding.FieldName = 'DOT_TOTAL'
              HeaderAlignmentHorz = taCenter
              Width = 132
            end
          end
        end
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 887
    ExplicitWidth = 887
    inherited lblFilterData: TcxLabel
      Left = 533
      Visible = True
      ExplicitLeft = 533
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 594
      Visible = True
      ExplicitLeft = 594
      ExplicitHeight = 23
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 710
      Visible = True
      ExplicitLeft = 710
      ExplicitHeight = 23
    end
    inherited btnSearch: TcxButton
      Left = 805
      ExplicitLeft = 805
    end
    inherited lblsdFilter: TcxLabel
      Left = 686
      Visible = True
      ExplicitLeft = 686
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 395
    Width = 887
    ExplicitTop = 395
    ExplicitWidth = 887
    inherited pnlFooter: TPanel
      Width = 887
      ExplicitWidth = 887
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
        Left = 810
        Action = actClose
        ExplicitLeft = 810
      end
      inherited cxButton1: TcxButton
        Action = actExport
      end
    end
    inherited pnlShortCut: TPanel
      Width = 887
      ExplicitWidth = 887
      inherited lbEscape: TLabel
        Left = 813
        Height = 17
        ExplicitLeft = 813
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
