CREATE TABLE [dbo].[ADJUSTMENT_PRODUCT]
(
[ADJPROD_UNT_ID] [int] NOT NULL,
[ADJPROD_NO] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ADJPROD_DATE] [datetime] NULL,
[ADJPROD_ALLOCATION] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ADJPROD_REMARK] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ADJPROD_TOTAL] [numeric] (21, 3) NULL,
[ADJPROD_STATUS] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ADJPROD_DATE_POSTED] [datetime] NULL,
[OP_CREATE] [int] NULL,
[DATE_CREATE] [datetime] NULL CONSTRAINT [DF__ADJUSTMEN__DATE___0CBAE877] DEFAULT (getdate()),
[OP_MODIFY] [int] NULL,
[DATE_MODIFY] [datetime] NULL,
[OPC_UNIT] [int] NULL,
[OPM_UNIT] [int] NULL,
[ADJUSTMENT_PRODUCT_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__ADJUSTMEN__ADJUS__66361833] DEFAULT (newid())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ADJUSTMENT_PRODUCT] ADD CONSTRAINT [PK__ADJUSTME__44DF0E67681E60A5] PRIMARY KEY CLUSTERED  ([ADJUSTMENT_PRODUCT_ID]) ON [PRIMARY]
GO
