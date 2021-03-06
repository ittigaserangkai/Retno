CREATE TABLE [dbo].[JURNAL]
(
[JUR_UNT_ID] [int] NOT NULL,
[JUR_FISCAL_YEAR] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[JUR_PERIOD] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[JUR_DATE] [datetime] NOT NULL CONSTRAINT [DF__JURNAL__JUR_DATE__6225902D] DEFAULT (getdate()),
[JUR_NO] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[JUR_REF_NO] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[JUR_DEBET] [numeric] (21, 3) NULL,
[JUR_CREDIT] [numeric] (21, 3) NULL,
[JUR_DESCRIPTION] [varchar] (512) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[JUR_IS_POSTED] [int] NULL,
[JUR_POSTED_DATE] [datetime] NULL,
[OP_CREATE] [int] NULL,
[DATE_CREATE] [datetime] NULL CONSTRAINT [DF__JURNAL__DATE_CRE__6319B466] DEFAULT (getdate()),
[OP_MODIFY] [int] NULL,
[DATE_MODIFY] [datetime] NULL,
[OPC_UNIT] [int] NULL,
[OPM_UNIT] [int] NULL,
[HEADER_FLAG] [int] NULL,
[JUR_KDJUR_ID] [int] NULL,
[KDJUR_COMP_ID] [int] NULL,
[JURNAL_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__JURNAL__JURNAL_I__24F264BB] DEFAULT (newid())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[JURNAL] ADD CONSTRAINT [PK__JURNAL__C027992326DAAD2D] PRIMARY KEY CLUSTERED  ([JURNAL_ID]) ON [PRIMARY]
GO
