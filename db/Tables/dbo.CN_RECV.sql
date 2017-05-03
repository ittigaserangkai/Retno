CREATE TABLE [dbo].[CN_RECV]
(
[CNR_NO] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CNR_UNT_ID] [int] NOT NULL,
[CNR_INV_NO] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__CN_RECV__CNR_INV__3B40CD36] DEFAULT (' ''CN-'''),
[CNR_DATE] [datetime] NULL CONSTRAINT [DF__CN_RECV__CNR_DAT__3C34F16F] DEFAULT (getdate()),
[CNR_TOTAL] [numeric] (21, 3) NULL,
[CNR_TOTAL_DISC] [numeric] (21, 3) NULL,
[CNR_PPN] [numeric] (21, 3) NULL,
[CNR_PPNBM] [numeric] (21, 3) NULL,
[CNR_TOTAL_TAX] [numeric] (21, 3) NULL,
[CNR_DESCRIPTION] [varchar] (512) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OP_CREATE] [int] NULL,
[DATE_CREATE] [datetime] NULL CONSTRAINT [DF__CN_RECV__DATE_CR__3D2915A8] DEFAULT (getdate()),
[OP_MODIFY] [int] NULL,
[DATE_MODIFY] [datetime] NULL,
[OPC_UNIT] [int] NULL,
[OPM_UNIT] [int] NULL,
[CNR_DO_NO] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CNR_DO_UNT_ID] [int] NOT NULL,
[CNR_PO_NO] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CNR_PO_UNT_ID] [int] NOT NULL,
[CNR_IS_CLAIM] [int] NULL CONSTRAINT [DF__CN_RECV__CNR_IS___3E1D39E1] DEFAULT ((0)),
[CN_RECV_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__CN_RECV__CN_RECV__5BA37B27] DEFAULT (newid())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CN_RECV] ADD CONSTRAINT [PK__CN_RECV__FB0242E95D8BC399] PRIMARY KEY CLUSTERED  ([CN_RECV_ID]) ON [PRIMARY]
GO
