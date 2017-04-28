CREATE TABLE [dbo].[BARANG_BONUS_CS_SIRKULASI]
(
[BBSCS_UNT_ID] [int] NOT NULL,
[BBSCS_BNSCS_CODE] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[BBSCS_DATE] [datetime] NULL CONSTRAINT [DF__BARANG_BO__BBSCS__6754599E] DEFAULT (getdate()),
[BBSCS_STOCK] [int] NULL CONSTRAINT [DF__BARANG_BO__BBSCS__68487DD7] DEFAULT ((0)),
[BBSCS_IS_IN] [int] NULL,
[BBSCS_DOC_NO] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BBSCS_TYPE] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BBSCS_DESCRIPTION] [varchar] (512) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BBSCS_SAT_CODE] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OP_CREATE] [int] NULL,
[DATE_CREATE] [datetime] NULL CONSTRAINT [DF__BARANG_BO__DATE___693CA210] DEFAULT (getdate()),
[OP_MODIFY] [int] NULL,
[DATE_MODIFY] [datetime] NULL,
[OPC_UNIT] [int] NULL,
[OPM_UNIT] [int] NULL,
[BARANG_BONUS_CS_SIRKULASI_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__BARANG_BO__BARAN__76C185B7] DEFAULT (newid())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BARANG_BONUS_CS_SIRKULASI] ADD CONSTRAINT [PK__BARANG_B__7096E95478A9CE29] PRIMARY KEY CLUSTERED  ([BARANG_BONUS_CS_SIRKULASI_ID]) ON [PRIMARY]
GO
