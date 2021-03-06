CREATE TABLE [dbo].[PKM_AVERAGE_DETAIL]
(
[PKMAD_HEADER_ID] [int] NOT NULL,
[PKMAD_HEADER_UNT_ID] [int] NOT NULL,
[PKMAD_BRG_KODE] [char] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PKMAD_QTY] [float] NOT NULL,
[DATE_CREATE] [datetime] NULL,
[DATE_MODIFY] [datetime] NULL,
[OP_CREATE] [int] NULL,
[OP_MODIFY] [int] NULL,
[OPC_UNIT] [int] NULL,
[OPM_UNIT] [int] NULL,
[PKM_AVERAGE_DETAIL_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__PKM_AVERA__PKM_A__38D961D7] DEFAULT (newid())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PKM_AVERAGE_DETAIL] ADD CONSTRAINT [PK__PKM_AVER__F12DED373AC1AA49] PRIMARY KEY CLUSTERED  ([PKM_AVERAGE_DETAIL_ID]) ON [PRIMARY]
GO
