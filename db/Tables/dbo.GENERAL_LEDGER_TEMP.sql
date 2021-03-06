CREATE TABLE [dbo].[GENERAL_LEDGER_TEMP]
(
[GLT_DATE] [datetime] NULL,
[GLT_REK_CODE] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GLT_REK_NAME] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GLT_DEBET] [numeric] (21, 3) NULL,
[GLT_CREDIT] [numeric] (21, 3) NULL,
[GLT_SAL_DEBET] [numeric] (21, 3) NULL,
[GLT_SAL_CREDIT] [numeric] (21, 3) NULL,
[GLT_JURD_ID] [int] NULL,
[GLT_JURD_UNT_ID] [int] NULL,
[GLT_REF_NO] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GLT_DESCRIPTION] [varchar] (512) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GLT_ENTRY_DATE] [date] NULL CONSTRAINT [DF__GENERAL_L__GLT_E__3DE82FB7] DEFAULT (getdate()),
[GENERAL_LEDGER_TEMP_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__GENERAL_L__GENER__3BD5CA13] DEFAULT (newid())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GENERAL_LEDGER_TEMP] ADD CONSTRAINT [PK__GENERAL___664C9EE93DBE1285] PRIMARY KEY CLUSTERED  ([GENERAL_LEDGER_TEMP_ID]) ON [PRIMARY]
GO
