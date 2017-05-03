CREATE TABLE [dbo].[TTest]
(
[ID] [uniqueidentifier] NOT NULL,
[RefNo] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[RefDate] [date] NOT NULL,
[Date_Create] [datetime] NULL,
[Date_Modify] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TTest] ADD CONSTRAINT [PK_TTest] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
