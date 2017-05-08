CREATE TABLE [dbo].[AUT$GROUP]
(
[GRO_UNT_ID] [int] NOT NULL,
[GRO_NAME] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[GRO_DESCRIPTION] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AUT$GROUP_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__AUT$GROUP__AUT$G__0DA4EB0F] DEFAULT (newid())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AUT$GROUP] ADD CONSTRAINT [PK__AUT$GROU__6C2BB8C40F8D3381] PRIMARY KEY CLUSTERED  ([AUT$GROUP_ID]) ON [PRIMARY]
GO