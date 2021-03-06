CREATE TABLE [dbo].[POTONGAN_TAGIHAN_CONTRABON]
(
[POTTGHN_NO] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[POTTGHN_UNT_ID] [int] NOT NULL,
[POTTGHN_DATE] [datetime] NULL,
[POTTGHN_SUP_CODE] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[POTTGHN_TOTAL_BILLING] [numeric] (21, 3) NULL,
[POTTGHN_RESIDU] [numeric] (21, 3) NULL,
[POTTGHN_DESCRIPTION] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[POTTGHN_STAPRO_ID] [int] NOT NULL,
[POTTGHN_SAT_PRICE] [numeric] (21, 3) NULL,
[POTTGHN_QTY] [numeric] (18, 3) NULL,
[POTTGHN_IS_JURNAL] [int] NULL,
[OP_CREATE] [int] NULL,
[DATE_CREATE] [datetime] NULL CONSTRAINT [DF__POTONGAN___DATE___3429BB53] DEFAULT (getdate()),
[OP_MODIFY] [int] NULL,
[DATE_MODIFY] [datetime] NULL,
[OPC_UNIT] [int] NULL,
[OPM_UNIT] [int] NULL,
[POTONGAN_TAGIHAN_CONTRABON_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__POTONGAN___POTON__4890A6B3] DEFAULT (newid())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[POTONGAN_TAGIHAN_CONTRABON] ADD CONSTRAINT [PK__POTONGAN__AFD94C734A78EF25] PRIMARY KEY CLUSTERED  ([POTONGAN_TAGIHAN_CONTRABON_ID]) ON [PRIMARY]
GO
