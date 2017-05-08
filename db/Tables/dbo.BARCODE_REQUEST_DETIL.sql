CREATE TABLE [dbo].[BARCODE_REQUEST_DETIL]
(
[BARD_UNT_ID] [int] NOT NULL,
[BARD_BAR_NO] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[BARD_BAR_UNT_ID] [int] NOT NULL,
[BARD_BRG_CODE] [char] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BARD_SAT_PRICE] [numeric] (21, 3) NULL,
[BARD_QTY] [int] NULL,
[BARD_TOTAL_PRICE] [numeric] (21, 3) NULL,
[OP_CREATE] [int] NULL,
[DATE_CREATE] [datetime] NULL CONSTRAINT [DF__BARCODE_R__DATE___114A936A] DEFAULT (getdate()),
[OP_MODIFY] [int] NULL,
[DATE_MODIFY] [datetime] NULL,
[OPC_UNIT] [int] NULL,
[OPM_UNIT] [int] NULL,
[BARD_UOM] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BARCODE_REQUEST_DETIL_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__BARCODE_R__BARCO__5C0D8F7B] DEFAULT (newid())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BARCODE_REQUEST_DETIL] ADD CONSTRAINT [PK__BARCODE___E83838BB5DF5D7ED] PRIMARY KEY CLUSTERED  ([BARCODE_REQUEST_DETIL_ID]) ON [PRIMARY]
GO