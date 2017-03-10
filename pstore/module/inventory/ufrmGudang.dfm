inherited frmGudang: TfrmGudang
  Left = 216
  Top = 102
  Caption = ''
  ClientHeight = 380
  ClientWidth = 764
  OldCreateOrder = True
  ExplicitWidth = 780
  ExplicitHeight = 419
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 764
    Height = 291
    ExplicitWidth = 764
    ExplicitHeight = 291
    inherited cxGrid: TcxGrid
      Top = 49
      Width = 742
      Height = 231
      TabOrder = 1
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
      AnchorY = 17
    end
    inherited dtAwalFilter: TcxDateEdit
      ExplicitLeft = 345
      ExplicitTop = 9
      ExplicitHeight = 24
    end
    inherited lblsdFilter: TcxLabel
      AnchorY = 17
    end
    inherited dtAkhirFilter: TcxDateEdit
      ExplicitTop = 9
      ExplicitHeight = 24
    end
    inherited btnSearch: TcxButton
      ExplicitTop = 9
      ExplicitHeight = 25
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
      inherited btnClose: TcxButton
        Left = 682
        Action = actClose
        ExplicitLeft = 682
      end
      inherited btnAdd: TcxButton
        Action = actAdd
      end
      inherited btnUpdate: TcxButton
        Action = actEdit
      end
      inherited btnPrint: TcxButton
        Action = actPrint
      end
    end
    inherited pnlSortCut: TPanel
      Width = 764
      ExplicitWidth = 764
      inherited lbl5: TLabel
        Left = 583
      end
    end
  end
  inherited cxStyle: TcxStyleRepository
    PixelsPerInch = 96
  end
end
