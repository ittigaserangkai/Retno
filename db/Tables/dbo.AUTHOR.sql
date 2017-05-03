CREATE TABLE [dbo].[AUTHOR]
(
[ID] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[NAMA] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TPTLHR] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TGLLHR] [date] NULL,
[EMAIL] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NOTELP] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NOHP] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ALAMAT] [varchar] (90) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[KODEPOS] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[KOTA] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ALAMATKANTOR] [varchar] (90) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[KEAHLIAN] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ATASMERK] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NAMAPENA] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[REMARK] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STATUS] [smallint] NULL CONSTRAINT [DF__AUTHOR__STATUS__0C3BC58A] DEFAULT ((0)),
[DATE_CREATE] [datetime2] NULL,
[DATE_MODIFY] [datetime2] NULL,
[OP_CREATE] [int] NULL,
[OP_MODIFY] [int] NULL,
[OPC_UNIT] [int] NULL,
[OPM_UNIT] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AUTHOR] ADD CONSTRAINT [PK_AUTHOR] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
