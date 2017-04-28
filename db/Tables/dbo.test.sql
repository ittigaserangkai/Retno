CREATE TABLE [dbo].[test]
(
[id] [uniqueidentifier] NOT NULL CONSTRAINT [DF__test__id__10A1534B] DEFAULT (newid()),
[nomor] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[test] ADD CONSTRAINT [PK__test__3213E83F0EB90AD9] PRIMARY KEY CLUSTERED  ([id]) ON [PRIMARY]
GO
