CREATE TABLE [dbo].[ADJUSTMENT_CASHIER]
(
[ADJCASHIER_UNT_ID] [int] NOT NULL,
[ADJCASHIER_BALANCE_ID] [int] NOT NULL,
[ADJCASHIER_BALANCE_UNT_ID] [int] NOT NULL,
[ADJCASHIER_CASH_VALUE] [numeric] (21, 3) NULL,
[ADJCASHIER_CARD_ID] [int] NULL,
[ADJCASHIER_CARD_UNT_ID] [int] NULL,
[ADJCASHIER_CREDIT] [numeric] (21, 3) NULL,
[ADJCASHIER_DEBIT] [numeric] (21, 3) NULL,
[ADJCASHIER_DEPOSIT_COUPON] [numeric] (21, 3) NULL,
[ADJCASHIER_GORO_COUPON] [numeric] (21, 3) NULL,
[ADJCASHIER_OTHER_COUPON] [numeric] (21, 3) NULL,
[ADJCASHIER_DESCRIPTION] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OP_CREATE] [int] NULL,
[DATE_CREATE] [datetime] NULL CONSTRAINT [DF__ADJUSTMEN__DATE___0519C6AF] DEFAULT (getdate()),
[OP_MODIFY] [int] NULL,
[DATE_MODIFY] [datetime] NULL,
[OPC_UNIT] [int] NULL,
[OPM_UNIT] [int] NULL,
[ADJUSTMENT_CASHIER_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__ADJUSTMEN__ADJUS__444B1483] DEFAULT (newid())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ADJUSTMENT_CASHIER] ADD CONSTRAINT [PK__ADJUSTME__21E97DB646335CF5] PRIMARY KEY CLUSTERED  ([ADJUSTMENT_CASHIER_ID]) ON [PRIMARY]
GO