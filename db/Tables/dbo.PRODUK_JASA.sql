CREATE TABLE [dbo].[PRODUK_JASA]
(
[PROJAS_CODE] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PROJAS_UNT_ID] [int] NOT NULL,
[PROJAS_NAME] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PROJAS_TPPRO_ID] [int] NOT NULL,
[PROJAS_IS_BKP] [int] NULL,
[PROJAS_PJK_ID] [int] NULL,
[PROJAS_SATNBD_CODE] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PROJAS_SATNBD_UNT_ID] [int] NULL,
[PROJAS_PRICE] [numeric] (21, 3) NULL,
[PROJAS_PER_ID] [int] NULL,
[PROJAS_PER_UNT_ID] [int] NULL,
[OP_CREATE] [int] NULL,
[DATE_CREATE] [datetime] NULL CONSTRAINT [DF__PRODUK_JA__DATE___4DE98D56] DEFAULT (getdate()),
[OP_MODIFY] [int] NULL,
[DATE_MODIFY] [datetime] NULL,
[OPC_UNIT] [int] NULL,
[OPM_UNIT] [int] NULL,
[PROJAS_QTY] [int] NULL,
[PRODUK_JASA_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__PRODUK_JA__PRODU__0599B4F3] DEFAULT (newid())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PRODUK_JASA] ADD CONSTRAINT [PK__PRODUK_J__02F407350781FD65] PRIMARY KEY CLUSTERED  ([PRODUK_JASA_ID]) ON [PRIMARY]
GO
