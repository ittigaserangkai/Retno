CREATE TABLE [dbo].[AP_BALANCE]
(
[APB_UNT_ID] [int] NOT NULL,
[APB_OPPER_ID] [int] NOT NULL,
[APB_OPPER_COMP_ID] [int] NOT NULL,
[APB_SUPMG_SUB_CODE] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[APB_DEBET] [numeric] (21, 3) NULL,
[APB_CREDIT] [numeric] (21, 3) NULL,
[OP_CREATE] [int] NULL,
[DATE_CREATE] [datetime] NULL CONSTRAINT [DF__AP_BALANC__DATE___3A81B327] DEFAULT (getdate()),
[OP_MODIFY] [int] NULL,
[DATE_MODIFY] [datetime] NULL,
[OPC_UNIT] [int] NULL,
[OPM_UNIT] [int] NULL,
[AP_BALANCE_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__AP_BALANC__AP_BA__10966653] DEFAULT (newid())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AP_BALANCE] ADD CONSTRAINT [PK__AP_BALAN__5ECD75D6127EAEC5] PRIMARY KEY CLUSTERED  ([AP_BALANCE_ID]) ON [PRIMARY]
GO
