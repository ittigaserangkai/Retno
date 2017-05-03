CREATE TABLE [dbo].[test2]
(
[id] [uniqueidentifier] NOT NULL CONSTRAINT [DF__test2__id__1471E42F] DEFAULT (newid()),
[nomor] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[test2] ADD CONSTRAINT [PK_Test2] PRIMARY KEY NONCLUSTERED  ([id]) ON [PRIMARY]
GO
