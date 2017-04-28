CREATE TABLE [dbo].[REF$CREDIT_CARD]
(
[CARD_UNT_ID] [int] NOT NULL,
[CARD_CODE] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CARD_NAME] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CARD_IS_CREDIT] [int] NULL,
[CARD_IS_CASHBACK] [int] NULL,
[CARD_LIMIT] [numeric] (21, 3) NULL,
[CARD_DISCOUNT] [numeric] (7, 2) NULL,
[CARD_CHARGE] [numeric] (7, 2) NULL,
[CARD_IS_ACTIVE] [int] NULL,
[OP_CREATE] [int] NULL,
[DATE_CREATE] [datetime] NULL CONSTRAINT [DF__REF$CREDI__DATE___00750D23] DEFAULT (getdate()),
[OP_MODIFY] [int] NULL,
[DATE_MODIFY] [datetime] NULL,
[OPC_UNIT] [int] NULL,
[OPM_UNIT] [int] NULL,
[CARD_REK_CODE] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CARD_REK_COMP_ID] [int] NULL,
[CARD_REK_CASH_BACK] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CARD_REK_CASH_BACK_COMP_ID] [int] NULL,
[CARD_IS_KRING] [int] NULL,
[REF$CREDIT_CARD_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__REF$CREDI__REF$C__3651FAE7] DEFAULT (newid())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[REF$CREDIT_CARD] ADD CONSTRAINT [PK__REF$CRED__1A60115E383A4359] PRIMARY KEY CLUSTERED  ([REF$CREDIT_CARD_ID]) ON [PRIMARY]
GO
