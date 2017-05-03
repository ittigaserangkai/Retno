CREATE TABLE [dbo].[SO_DETAIL]
(
[SO_DETAIL_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__SO_DETIL__SO_DET__2CFD9AD7] DEFAULT (newid()),
[SO_ID] [uniqueidentifier] NOT NULL,
[BARANG_ID] [uniqueidentifier] NOT NULL,
[REF$SATUAN_ID] [uniqueidentifier] NOT NULL,
[SUPLIER_MERCHAN_GRUP_ID] [uniqueidentifier] NOT NULL,
[SOD_QTYSO] [numeric] (18, 3) NOT NULL,
[SOD_QTY] [numeric] (18, 3) NOT NULL CONSTRAINT [DF__SO_DETIL__SOD_QT__116A8EFB] DEFAULT ((1)),
[SOD_PRICE] [numeric] (21, 3) NOT NULL,
[SOD_DISC1] [numeric] (7, 2) NOT NULL,
[SOD_DISC2] [numeric] (7, 2) NOT NULL,
[SOD_DISC3] [numeric] (21, 3) NOT NULL,
[SOD_TOTAL_DISC] [numeric] (21, 3) NOT NULL,
[SOD_ADS] [numeric] (21, 3) NOT NULL,
[SOD_ROP] [numeric] (21, 3) NOT NULL,
[SOD_STOCK] [numeric] (21, 3) NOT NULL,
[SOD_TOTAL] [numeric] (21, 3) NOT NULL,
[SOD_IS_ORDERED] [int] NOT NULL,
[SOD_IS_BKP] [int] NULL,
[SOD_IS_REGULAR] [int] NULL,
[OP_CREATE] [int] NULL,
[DATE_CREATE] [datetime] NULL CONSTRAINT [DF__SO_DETIL__DATE_C__153B1FDF] DEFAULT (getdate()),
[OP_MODIFY] [int] NULL,
[DATE_MODIFY] [datetime] NULL,
[OPC_UNIT] [int] NULL,
[OPM_UNIT] [int] NULL
) ON [PRIMARY]
GO
