CREATE TABLE [dbo].[PKM_AVERAGE]
(
[PKMAVE_UNT_ID] [int] NOT NULL,
[PKMAVE_DATE_CREATE] [date] NOT NULL,
[NOBUKTI] [varchar] (29) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IS_PROSES] [image] NOT NULL,
[DATE_CREATE] [datetime] NULL,
[DATE_MODIFY] [datetime] NULL,
[OP_CREATE] [int] NULL,
[OP_MODIFY] [int] NULL,
[OPC_UNIT] [int] NULL,
[OPM_UNIT] [int] NULL,
[PKM_AVERAGE_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__PKM_AVERA__PKM_A__3CA9F2BB] DEFAULT (newid())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[PKM_AVERAGE] ADD CONSTRAINT [PK__PKM_AVER__E35DA05E3E923B2D] PRIMARY KEY CLUSTERED  ([PKM_AVERAGE_ID]) ON [PRIMARY]
GO