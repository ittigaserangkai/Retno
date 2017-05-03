CREATE TABLE [dbo].[TTestItem]
(
[ID] [uniqueidentifier] NOT NULL,
[Header_ID] [uniqueidentifier] NOT NULL,
[SKU] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[NamaBarang] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[QTY] [float] NOT NULL,
[Date_Create] [datetime] NULL,
[Date_Modify] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TTestItem] ADD CONSTRAINT [PK_TTestItem] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
