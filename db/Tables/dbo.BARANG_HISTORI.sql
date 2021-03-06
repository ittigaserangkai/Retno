CREATE TABLE [dbo].[BARANG_HISTORI]
(
[BRGHIS_UNT_ID] [int] NOT NULL,
[BRGHIS_BRG_CODE] [char] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[BRGHIS_OLD_CATALOG] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BRGHIS_NEW_CATALOG] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BRGHIS_OP_TYPE] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OP_ENTRY] [int] NULL,
[DATE_ENTRY] [datetime] NULL,
[OPC_UNIT] [int] NULL,
[OPM_UNIT] [int] NULL,
[BARANG_HISTORI_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__BARANG_HI__BARAN__6F2063EF] DEFAULT (newid())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BARANG_HISTORI] ADD CONSTRAINT [PK__BARANG_H__CF023C1D7108AC61] PRIMARY KEY CLUSTERED  ([BARANG_HISTORI_ID]) ON [PRIMARY]
GO
