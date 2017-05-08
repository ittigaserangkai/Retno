CREATE TABLE [dbo].[REF$TIPE_KIRIM_PO]
(
[TPKRMPO_CODE] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TPKRMPO_NAME] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[OP_CREATE] [int] NULL,
[DATE_CREATE] [datetime] NULL CONSTRAINT [DF__REF$TIPE___DATE___47FBA9D6] DEFAULT (getdate()),
[OP_MODIFY] [int] NULL,
[DATE_MODIFY] [datetime] NULL,
[OPC_UNIT] [int] NULL,
[OPM_UNIT] [int] NULL,
[REF$TIPE_KIRIM_PO_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__REF$TIPE___REF$T__6A06A917] DEFAULT (newid())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[REF$TIPE_KIRIM_PO] ADD CONSTRAINT [PK__REF$TIPE__30099CDC6BEEF189] PRIMARY KEY CLUSTERED  ([REF$TIPE_KIRIM_PO_ID]) ON [PRIMARY]
GO