CREATE TABLE [dbo].[WASTAGE_REAL_DETIL]
(
[WRD_UNT_ID] [int] NOT NULL,
[WRD_WSTRL_NO] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[WRD_WSTRL_UNT_ID] [int] NOT NULL,
[WRD_BRG_CODE] [char] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[WRD_PO_NO] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WRD_PO_UNT_ID] [int] NULL,
[WRD_QTY] [numeric] (18, 3) NULL CONSTRAINT [DF__WASTAGE_R__WRD_Q__6DB73E6A] DEFAULT ((0)),
[WRD_SAT_CODE] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WRD_PRICE] [numeric] (21, 3) NULL,
[WRD_TOTAL] [numeric] (21, 3) NULL,
[WRD_PPN_PERSEN] [numeric] (7, 2) NULL,
[WRD_PPN] [numeric] (21, 3) NULL,
[WRD_PPNBM_PERSEN] [numeric] (7, 2) NULL,
[WRD_PPNBM] [numeric] (21, 3) NULL,
[WRD_TOTAL_TAX] [numeric] (21, 3) NULL,
[WRD_IS_PROCESS] [int] NULL,
[OP_CREATE] [int] NULL,
[DATE_CREATE] [datetime] NULL CONSTRAINT [DF__WASTAGE_R__DATE___6EAB62A3] DEFAULT (getdate()),
[OP_MODIFY] [int] NULL,
[DATE_MODIFY] [datetime] NULL,
[WRD_IGRD_ID] [int] NULL,
[WRD_IGRD_UNT_ID] [int] NULL,
[OPC_UNIT] [int] NULL,
[OPM_UNIT] [int] NULL,
[WASTAGE_REAL_DETIL_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__WASTAGE_R__WASTA__3E5D3103] DEFAULT (newid())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WASTAGE_REAL_DETIL] ADD CONSTRAINT [PK__WASTAGE___72B1F47840457975] PRIMARY KEY CLUSTERED  ([WASTAGE_REAL_DETIL_ID]) ON [PRIMARY]
GO
