CREATE TABLE [dbo].[REF$WILAYAH]
(
[REF$WILAYAH_ID] [uniqueidentifier] NULL CONSTRAINT [DF__REF$WILAY__REF$W__7C9A5A9E] DEFAULT (newid()),
[KELURAHAN] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[KODEPOS] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[KECAMATAN] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[KABUPATEN] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PROPINSI] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
