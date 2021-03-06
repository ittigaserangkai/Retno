CREATE TABLE [dbo].[REKENING_DAILY_BAL]
(
[REKDB_CODE] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[REKDB_COMP_ID] [int] NOT NULL,
[OP_CREATE] [int] NULL,
[DATE_CREATE] [datetime] NULL CONSTRAINT [DF__REKENING___DATE___695C9DA1] DEFAULT (getdate()),
[OP_MODIFY] [int] NULL,
[DATE_MODIFY] [datetime] NULL,
[OPC_COMP] [int] NULL,
[OPM_COMP] [int] NULL,
[REKENING_DAILY_BAL_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__REKENING___REKEN__64F7DB37] DEFAULT (newid())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[REKENING_DAILY_BAL] ADD CONSTRAINT [PK__REKENING__96C5944E66E023A9] PRIMARY KEY CLUSTERED  ([REKENING_DAILY_BAL_ID]) ON [PRIMARY]
GO
