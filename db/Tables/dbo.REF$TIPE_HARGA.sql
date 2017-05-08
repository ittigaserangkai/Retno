CREATE TABLE [dbo].[REF$TIPE_HARGA]
(
[TPHRG_UNT_ID] [int] NOT NULL,
[TPHRG_CODE] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TPHRG_NAME] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TPHRG_MARKUP] [numeric] (7, 2) NULL,
[TPHRG_IS_CALC] [int] NULL CONSTRAINT [DF__REF$TIPE___TPHRG__451F3D2B] DEFAULT ((1)),
[TPHRG_IS_TEMPLATE] [int] NULL,
[OP_CREATE] [int] NULL,
[DATE_CREATE] [datetime] NULL CONSTRAINT [DF__REF$TIPE___DATE___46136164] DEFAULT (getdate()),
[OP_MODIFY] [int] NULL,
[DATE_MODIFY] [datetime] NULL,
[OPC_UNIT] [int] NULL,
[OPM_UNIT] [int] NULL,
[REF$TIPE_HARGA_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__REF$TIPE___REF$T__6DD739FB] DEFAULT (newid())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[REF$TIPE_HARGA] ADD CONSTRAINT [PK__REF$TIPE__FBA286116FBF826D] PRIMARY KEY CLUSTERED  ([REF$TIPE_HARGA_ID]) ON [PRIMARY]
GO