CREATE TABLE [dbo].[ADJUSTMENT_STOCK_DETIL]
(
[ASD_UNT_ID] [int] NOT NULL,
[ASD_ADJSTOCK_ID] [int] NOT NULL,
[ASD_ADJSTOCK_UNT_ID] [int] NOT NULL,
[ASD_BRG_CODE_FROM] [char] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ASD_SAT_CODE_FROM] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ASD_BRG_CODE_TO] [char] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ASD_SAT_CODE_TO] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ASD_QTY_FROM] [numeric] (18, 3) NOT NULL CONSTRAINT [DF__ADJUSTMEN__ASD_Q__1273C1CD] DEFAULT ((0)),
[ASD_QTY_CONVERTION] [numeric] (18, 3) NOT NULL CONSTRAINT [DF__ADJUSTMEN__ASD_Q__1367E606] DEFAULT ((0)),
[ASD_QTY_TO] [numeric] (18, 3) NOT NULL CONSTRAINT [DF__ADJUSTMEN__ASD_Q__145C0A3F] DEFAULT ((0)),
[ASD_COGS_BARANG_FROM] [numeric] (21, 3) NULL,
[ASD_COGS_BARANG_TO] [numeric] (21, 3) NULL,
[ASD_LAST_COST_BARANG_FROM] [numeric] (21, 3) NULL,
[ASD_LAST_COST_BARANG_TO] [numeric] (21, 3) NULL,
[OP_CREATE] [int] NULL,
[DATE_CREATE] [datetime] NULL CONSTRAINT [DF__ADJUSTMEN__DATE___15502E78] DEFAULT (getdate()),
[OP_MODIFY] [int] NULL,
[DATE_MODIFY] [datetime] NULL,
[OPC_UNIT] [int] NULL,
[OPM_UNIT] [int] NULL,
[ADJUSTMENT_STOCK_DETIL_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__ADJUSTMEN__ADJUS__1DBB5747] DEFAULT (newid())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ADJUSTMENT_STOCK_DETIL] ADD CONSTRAINT [PK__ADJUSTME__15E1007D1FA39FB9] PRIMARY KEY CLUSTERED  ([ADJUSTMENT_STOCK_DETIL_ID]) ON [PRIMARY]
GO
