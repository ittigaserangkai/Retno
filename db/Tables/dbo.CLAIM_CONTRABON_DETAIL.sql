CREATE TABLE [dbo].[CLAIM_CONTRABON_DETAIL]
(
[CLMCONTD_UNT_ID] [int] NOT NULL,
[CLMCONTD_CLMCONT_NO] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CLMCONTD_CLMCONT_UNT_ID] [int] NOT NULL,
[CLMCONTD_CONT_ID] [int] NOT NULL,
[CLMCONTD_CONT_UNT_ID] [int] NOT NULL,
[CLMCONTD_BILLING_NO] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CLMCONTD_DATE_SALES] [datetime] NULL,
[CLMCONTD_AMOUNT_GROSS] [numeric] (21, 3) NULL,
[CLMCONTD_AMOUNT_ADJUSTMENT] [numeric] (21, 3) NULL,
[CLMCONTD_FEE] [numeric] (21, 3) NULL,
[CLMCONTD_TAX_AMOUNT] [numeric] (21, 3) NOT NULL CONSTRAINT [DF__CLAIM_CON__CLMCO__2739D489] DEFAULT ((0)),
[CLMCONTD_AMOUNT_NET] [numeric] (21, 3) NULL,
[OP_CREATE] [int] NULL,
[DATE_CREATE] [datetime] NULL CONSTRAINT [DF__CLAIM_CON__DATE___282DF8C2] DEFAULT (getdate()),
[OP_MODIFY] [int] NULL,
[DATE_MODIFY] [datetime] NULL,
[OPC_UNIT] [int] NULL,
[OPM_UNIT] [int] NULL,
[CLAIM_CONTRABON_DETAIL_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__CLAIM_CON__CLAIM__48FABB07] DEFAULT (newid())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CLAIM_CONTRABON_DETAIL] ADD CONSTRAINT [PK__CLAIM_CO__7C8B33884AE30379] PRIMARY KEY CLUSTERED  ([CLAIM_CONTRABON_DETAIL_ID]) ON [PRIMARY]
GO