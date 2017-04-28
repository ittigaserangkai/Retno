CREATE TABLE [dbo].[@CHANGE_TRACK]
(
[OBJECT] [varchar] (67) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DATE] [datetime] NULL CONSTRAINT [DF__@CHANGE_TR__DATE__01BE3717] DEFAULT (getdate()),
[USER] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LOG] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
