CREATE TABLE [dbo].[GENERAL_LEDGER_HISTORY]
(
[GLH_COMP_ID] [int] NOT NULL,
[GLH_REK_CODE] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[GLH_REK_COMP_ID] [int] NOT NULL,
[GLH_DATE] [datetime] NOT NULL CONSTRAINT [DF__GENERAL_L__GLH_D__3A179ED3] DEFAULT (getdate()),
[GLH_BEGIN_BAL] [numeric] (21, 3) NULL,
[GLH_DEBET] [numeric] (21, 3) NULL,
[GLH_CREDIT] [numeric] (21, 3) NULL,
[GLH_BAL] [numeric] (21, 3) NULL,
[GLH_LAST_BAL] [numeric] (21, 3) NULL,
[GLH_TIMES] [int] NULL CONSTRAINT [DF__GENERAL_L__GLH_T__3B0BC30C] DEFAULT ((1)),
[GLH_RESV_1] [int] NULL,
[OP_CREATE] [int] NULL,
[DATE_CREATE] [datetime] NULL CONSTRAINT [DF__GENERAL_L__DATE___3BFFE745] DEFAULT (getdate()),
[OP_MODIFY] [int] NULL,
[DATE_MODIFY] [datetime] NULL,
[OPC_COMP] [int] NULL,
[OPM_COMP] [int] NULL,
[GENERAL_LEDGER_HISTORY_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__GENERAL_L__GENER__5B2E79DB] DEFAULT (newid())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GENERAL_LEDGER_HISTORY] ADD CONSTRAINT [PK__GENERAL___B257FA095D16C24D] PRIMARY KEY CLUSTERED  ([GENERAL_LEDGER_HISTORY_ID]) ON [PRIMARY]
GO
