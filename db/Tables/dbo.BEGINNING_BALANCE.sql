CREATE TABLE [dbo].[BEGINNING_BALANCE]
(
[BALANCE_UNT_ID] [int] NOT NULL,
[BALANCE_USR_ID] [int] NOT NULL,
[BALANCE_USR_UNT_ID] [int] NOT NULL,
[BALANCE_SETUPPOS_ID] [int] NOT NULL,
[BALANCE_SETUPPOS_UNT_ID] [int] NOT NULL,
[BALANCE_MODAL] [numeric] (21, 3) NULL,
[BALANCE_SHIFT_ID] [int] NOT NULL,
[BALANCE_SHIFT_UNT_ID] [int] NOT NULL,
[BALANCE_SHIFT_DATE] [datetime] NOT NULL CONSTRAINT [DF__BEGINNING__BALAN__1332DBDC] DEFAULT (getdate()),
[BALANCE_DESCRIPTION] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BALANCE_STATUS] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__BEGINNING__BALAN__14270015] DEFAULT ('OPEN'),
[OP_CREATE] [int] NULL,
[DATE_CREATE] [datetime] NULL CONSTRAINT [DF__BEGINNING__DATE___151B244E] DEFAULT (getdate()),
[OP_MODIFY] [int] NULL,
[DATE_MODIFY] [datetime] NULL,
[OPC_UNIT] [int] NULL,
[OPM_UNIT] [int] NULL,
[ISJOURNALIZED] [int] NULL,
[BEGINNING_BALANCE_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__BEGINNING__BEGIN__63AEB143] DEFAULT (newid())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BEGINNING_BALANCE] ADD CONSTRAINT [PK__BEGINNIN__8248E77C6596F9B5] PRIMARY KEY CLUSTERED  ([BEGINNING_BALANCE_ID]) ON [PRIMARY]
GO
