CREATE TABLE [dbo].[TEMP$CASH_BALANCE]
(
[VOUCHER_NO] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DOC_NO] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DESCRIPTION] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BAL_DEBET] [numeric] (21, 3) NULL,
[BAL_CREDIT] [numeric] (21, 3) NULL,
[BAL_ENDING] [numeric] (21, 3) NULL,
[TRANS_DATE] [datetime] NULL,
[TEMP$CASH_BALANCE_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__TEMP$CASH__TEMP$__583CFE97] DEFAULT (newid())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TEMP$CASH_BALANCE] ADD CONSTRAINT [PK__TEMP$CAS__8D45FE835A254709] PRIMARY KEY CLUSTERED  ([TEMP$CASH_BALANCE_ID]) ON [PRIMARY]
GO
