CREATE TABLE [dbo].[TSQLIMPORT]
(
[ID] [int] NOT NULL,
[SQL] [image] NOT NULL,
[NOBUKTI] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TANGGAL] [datetime] NOT NULL,
[URUTAN] [int] NOT NULL,
[UNITID] [int] NOT NULL,
[TSQLIMPORT_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__TSQLIMPOR__TSQLI__01C9240F] DEFAULT (newid())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[TSQLIMPORT] ADD CONSTRAINT [PK__TSQLIMPO__AFB192A703B16C81] PRIMARY KEY CLUSTERED  ([TSQLIMPORT_ID]) ON [PRIMARY]
GO
