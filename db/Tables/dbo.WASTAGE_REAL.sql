CREATE TABLE [dbo].[WASTAGE_REAL]
(
[WSTRL_NO] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[WSTRL_UNT_ID] [int] NOT NULL,
[WSTRL_INV_NO] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__WASTAGE_R__WSTRL__69E6AD86] DEFAULT ('RET-'),
[WSTRL_DATE] [datetime] NULL CONSTRAINT [DF__WASTAGE_R__WSTRL__6ADAD1BF] DEFAULT (getdate()),
[WSTRL_TOTAL] [numeric] (21, 3) NULL,
[WSTRL_PPN] [numeric] (21, 3) NULL,
[WSTRL_PPNBM] [numeric] (21, 3) NULL,
[WSTRL_TOTAL_TAX] [numeric] (21, 3) NULL,
[WSTRL_DESCRIPTION] [varchar] (512) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WSTRL_IS_JURNAL] [int] NULL,
[OP_CREATE] [int] NULL,
[DATE_CREATE] [datetime] NULL CONSTRAINT [DF__WASTAGE_R__DATE___6BCEF5F8] DEFAULT (getdate()),
[OP_MODIFY] [int] NULL,
[DATE_MODIFY] [datetime] NULL,
[OPC_UNIT] [int] NULL,
[OPM_UNIT] [int] NULL,
[WASTAGE_REAL_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__WASTAGE_R__WASTA__68C86C1B] DEFAULT (newid())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WASTAGE_REAL] ADD CONSTRAINT [PK__WASTAGE___F3BABB836AB0B48D] PRIMARY KEY CLUSTERED  ([WASTAGE_REAL_ID]) ON [PRIMARY]
GO
