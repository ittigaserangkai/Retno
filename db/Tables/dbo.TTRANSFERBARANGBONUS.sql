CREATE TABLE [dbo].[TTRANSFERBARANGBONUS]
(
[KETERANGAN] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[NEWUNIT_ID] [int] NOT NULL,
[NOBUKTI] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TANGGAL] [date] NOT NULL,
[ISJOURNALIZED] [int] NULL,
[KETERANGANTUJUAN] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TTRANSFERBARANGBONUS_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__TTRANSFER__TTRAN__1E256B9B] DEFAULT (newid())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TTRANSFERBARANGBONUS] ADD CONSTRAINT [PK__TTRANSFE__244DB20E200DB40D] PRIMARY KEY CLUSTERED  ([TTRANSFERBARANGBONUS_ID]) ON [PRIMARY]
GO