CREATE TABLE [dbo].[SETUPPOS]
(
[SETUPPOS_UNT_ID] [int] NOT NULL,
[SETUPPOS_TERMINAL_CODE] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SETUPPOS_COUNTER_NO] [int] NULL,
[SETUPPOS_NO_TRANSAKSI] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SETUPPOS_DATE] [datetime] NULL,
[SETUPPOS_IS_ACTIVE] [int] NULL,
[SETUPPOS_IS_RESET] [int] NULL,
[SETUPPOS_IP] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OP_CREATE] [int] NULL,
[DATE_CREATE] [datetime] NULL CONSTRAINT [DF__SETUPPOS__DATE_C__01342732] DEFAULT (getdate()),
[OP_MODIFY] [int] NULL,
[DATE_MODIFY] [datetime] NULL,
[OPC_UNIT] [int] NULL,
[OPM_UNIT] [int] NULL,
[SETUPPOS_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__SETUPPOS__SETUPP__386F4D83] DEFAULT (newid())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SETUPPOS] ADD CONSTRAINT [PK__SETUPPOS__BC4C45E43A5795F5] PRIMARY KEY CLUSTERED  ([SETUPPOS_ID]) ON [PRIMARY]
GO
