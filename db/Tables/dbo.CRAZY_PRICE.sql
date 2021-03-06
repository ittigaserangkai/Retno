CREATE TABLE [dbo].[CRAZY_PRICE]
(
[CRAZ_UNT_ID] [int] NOT NULL,
[CRAZ_DATE] [datetime] NULL CONSTRAINT [DF__CRAZY_PRI__CRAZ___58D1301D] DEFAULT (getdate()),
[CRAZ_SAT_CODE] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CRAZ_BRG_CODE] [char] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CRAZ_BUY_PRICE] [numeric] (21, 3) NULL,
[CRAZ_SELL_PRICE] [numeric] (21, 3) NULL,
[CRAZ_QTY_LIMIT] [numeric] (18, 3) NULL CONSTRAINT [DF__CRAZY_PRI__CRAZ___59C55456] DEFAULT ((0)),
[CRAZ_DISC_PERSEN] [numeric] (7, 2) NULL,
[CRAZ_DISC_NOMINAL] [numeric] (21, 3) NULL,
[CRAZ_SELL_PRICE_DISC] [numeric] (21, 3) NULL,
[CRAZ_SELL_PRICE_DISC_TAX] [numeric] (21, 3) NULL,
[CRAZ_MARK_UP] [numeric] (7, 2) NULL,
[CRAZ_DATE_BEGIN] [datetime] NULL CONSTRAINT [DF__CRAZY_PRI__CRAZ___5AB9788F] DEFAULT (getdate()),
[CRAZ_DATE_END] [datetime] NULL,
[OP_CREATE] [int] NULL,
[DATE_CREATE] [datetime] NULL CONSTRAINT [DF__CRAZY_PRI__DATE___5BAD9CC8] DEFAULT (getdate()),
[OP_MODIFY] [int] NULL,
[DATE_MODIFY] [datetime] NULL,
[OPC_UNIT] [int] NULL,
[OPM_UNIT] [int] NULL,
[CRAZY_PRICE_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__CRAZY_PRI__CRAZY__17635F73] DEFAULT (newid())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CRAZY_PRICE] ADD CONSTRAINT [PK__CRAZY_PR__BC3D3285194BA7E5] PRIMARY KEY CLUSTERED  ([CRAZY_PRICE_ID]) ON [PRIMARY]
GO
