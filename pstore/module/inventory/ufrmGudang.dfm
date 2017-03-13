inherited frmGudang: TfrmGudang
  Left = 216
  Top = 102
  Caption = ''
  ClientHeight = 380
  ClientWidth = 764
  OldCreateOrder = True
  ExplicitTop = 8
  ExplicitWidth = 780
  ExplicitHeight = 419
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 764
    Height = 291
    ExplicitWidth = 764
    ExplicitHeight = 291
    inherited pgcBrowse: TcxPageControl
      Top = 49
      Width = 742
      Height = 231
      TabOrder = 1
      ExplicitTop = 49
      ExplicitWidth = 742
      ExplicitHeight = 231
      ClientRectBottom = 230
      ClientRectRight = 741
      inherited tsBrowse: TcxTabSheet
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        inherited cxGrid: TcxGrid
          Top = 49
          Width = 742
          Height = 231
          ExplicitTop = 49
          ExplicitWidth = 742
          ExplicitHeight = 175
          inherited cxGridView: TcxGridDBTableView
            object cxGridViewColumn1: TcxGridDBColumn
              Caption = 'NO'
            end
            object cxGridViewColumn2: TcxGridDBColumn
              Caption = 'CODE'
            end
            object cxGridViewColumn3: TcxGridDBColumn
              Caption = 'NAME'
            end
            object cxGridViewColumn4: TcxGridDBColumn
              Caption = 'ADDRESS'
            end
            object cxGridViewColumn5: TcxGridDBColumn
              Caption = 'TELP'
            end
            object cxGridViewColumn6: TcxGridDBColumn
              Caption = 'FAX'
            end
            object cxGridViewColumn7: TcxGridDBColumn
              Caption = 'CITY'
            end
            object cxGridViewColumn8: TcxGridDBColumn
              Caption = 'POST CODE'
            end
            object cxGridViewColumn9: TcxGridDBColumn
              Caption = 'CONTACT PERSON'
            end
            object cxGridViewColumn10: TcxGridDBColumn
              Caption = 'ID'
            end
          end
        end
      end
    end
    object pnl1: TPanel
      Left = 11
      Top = 11
      Width = 742
      Height = 38
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Color = 15198183
      TabOrder = 0
      DesignSize = (
        742
        38)
      object lbl2: TLabel
        Left = 43
        Top = 12
        Width = 21
        Height = 16
        Caption = 'Unit'
      end
      object Label6: TLabel
        Left = 312
        Top = 10
        Width = 12
        Height = 16
        Anchors = [akLeft, akBottom]
        Caption = 'F5'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object edtUnitID: TEdit
        Left = 73
        Top = 8
        Width = 80
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
      end
      object edtUnitNm: TEdit
        Left = 155
        Top = 8
        Width = 149
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
  inherited pnlHeader: TPanel
    Width = 764
    ExplicitWidth = 764
    inherited lblHeader: TLabel
      Width = 45
      Caption = 'GUDANG'
      ExplicitWidth = 45
    end
    inherited lblFilterData: TcxLabel
      Left = 410
      ExplicitLeft = 410
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      Left = 471
      ExplicitLeft = 345
      ExplicitTop = 9
      ExplicitHeight = 24
    end
    inherited dtAkhirFilter: TcxDateEdit
      Left = 587
      ExplicitLeft = 587
      ExplicitTop = 9
      ExplicitHeight = 24
    end
    inherited btnSearch: TcxButton
      Left = 682
      ExplicitLeft = 682
      ExplicitTop = 9
      ExplicitHeight = 25
    end
    inherited lblsdFilter: TcxLabel
      Left = 563
      ExplicitLeft = 563
      AnchorY = 17
    end
  end
  inherited fraFooter4Button1: TfraFooter4Button
    Top = 324
    Width = 764
    ExplicitTop = 324
    ExplicitWidth = 764
    inherited pnlFooter: TPanel
      Width = 764
      ExplicitWidth = 764
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
        Left = 682
        Action = actClose
        ExplicitLeft = 682
      end
    end
    inherited pnlShortCut: TPanel
      inherited lbEscape: TLabel
        Height = 16
      end
    end
  end
end
