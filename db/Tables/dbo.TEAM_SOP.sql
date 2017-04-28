CREATE TABLE [dbo].[TEAM_SOP]
(
[TSOP_CODE] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TSOP_UNT_ID] [int] NOT NULL,
[TSOP_KSOP_CODE] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TSOP_KSOP_UNT_ID] [int] NOT NULL,
[TSOP_PENGHITUNG] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TSOP_HELPER] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TSOP_SAKSI] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TSOP_CHECKER] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OP_CREATE] [int] NULL,
[DATE_CREATE] [datetime] NULL CONSTRAINT [DF__TEAM_SOP__DATE_C__758D6A5C] DEFAULT (getdate()),
[OP_MODIFY] [int] NULL,
[DATE_MODIFY] [datetime] NULL,
[OPC_UNIT] [int] NULL,
[OPM_UNIT] [int] NULL,
[TEAM_SOP_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__TEAM_SOP__TEAM_S__0EEE1503] DEFAULT (newid())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TEAM_SOP] ADD CONSTRAINT [PK__TEAM_SOP__98A2C6F310D65D75] PRIMARY KEY CLUSTERED  ([TEAM_SOP_ID]) ON [PRIMARY]
GO
