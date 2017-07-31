inherited frmPreference: TfrmPreference
  Caption = 'Preference'
  ClientHeight = 213
  ClientWidth = 348
  ExplicitWidth = 364
  ExplicitHeight = 252
  PixelsPerInch = 96
  TextHeight = 16
  inherited pnlBody: TPanel
    Width = 348
    Height = 183
    object rgMenu: TRadioGroup
      Left = 11
      Top = 11
      Width = 326
      Height = 46
      Align = alTop
      Caption = 'Menu'
      Columns = 2
      Items.Strings = (
        'Hide Ribbon'
        'Show Ribbon')
      TabOrder = 0
    end
  end
  inherited pnlHeader: TPanel
    Width = 348
    inherited lblHeader: TLabel
      Width = 62
      Height = 18
      Caption = 'Preference'
      ExplicitWidth = 62
    end
  end
end
