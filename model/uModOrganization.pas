unit uModOrganization;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs;

type
  TModOrganization = class(TModApp)
  private
    FBP_Code: string;
    FBP_Member: TModMember;
    FBP_MerchandiseGroup: TModMerchandiseGroup;
    FBP_Name: string;
    FBP_Trader: TModTrader;
  published
    property BP_Code: string read FBP_Code write FBP_Code;
    property BP_Member: TModMember read FBP_Member write FBP_Member;
    property BP_MerchandiseGroup: TModMerchandiseGroup read
        FBP_MerchandiseGroup write FBP_MerchandiseGroup;
    property BP_Name: string read FBP_Name write FBP_Name;
    property BP_Trader: TModTrader read FBP_Trader write FBP_Trader;
  end;


implementation



end.
