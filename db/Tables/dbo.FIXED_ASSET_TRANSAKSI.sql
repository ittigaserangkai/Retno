CREATE TABLE [dbo].[FIXED_ASSET_TRANSAKSI]
(
[FATR_COMP_ID] [int] NOT NULL,
[FATR_FA_ID] [int] NOT NULL,
[FATR_FA_COMP_ID] [int] NOT NULL,
[FATR_DATE] [datetime] NULL CONSTRAINT [DF__FIXED_ASS__FATR___29E1370A] DEFAULT (getdate()),
[FATR_VALUE] [numeric] (21, 3) NULL,
[FATR_AGE] [int] NULL CONSTRAINT [DF__FIXED_ASS__FATR___2AD55B43] DEFAULT ((1)),
[OP_CREATE] [int] NULL,
[DATE_CREATE] [datetime] NULL CONSTRAINT [DF__FIXED_ASS__DATE___2BC97F7C] DEFAULT (getdate()),
[OP_MODIFY] [int] NULL,
[DATE_MODIFY] [datetime] NULL,
[OPC_COMP] [int] NULL,
[OPM_COMP] [int] NULL,
[FIXED_ASSET_TRANSAKSI_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__FIXED_ASS__FIXED__52B92F6B] DEFAULT (newid())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FIXED_ASSET_TRANSAKSI] ADD CONSTRAINT [PK__FIXED_AS__6BFAFB7E54A177DD] PRIMARY KEY CLUSTERED  ([FIXED_ASSET_TRANSAKSI_ID]) ON [PRIMARY]
GO
