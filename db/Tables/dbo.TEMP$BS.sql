CREATE TABLE [dbo].[TEMP$BS]
(
[REK_CODE] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[REK_NAME] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[REK_LEVEL] [int] NULL,
[BAL] [numeric] (21, 3) NULL,
[BAL_1] [numeric] (21, 3) NULL,
[DIVISION] [int] NULL,
[IS_HEADER] [int] NULL CONSTRAINT [DF__TEMP$BS__IS_HEAD__795DFB40] DEFAULT ((1)),
[IS_SUB_TOTAL] [int] NULL CONSTRAINT [DF__TEMP$BS__IS_SUB___7A521F79] DEFAULT ((1)),
[IS_SUMMARY] [int] NULL CONSTRAINT [DF__TEMP$BS__IS_SUMM__7B4643B2] DEFAULT ((1)),
[TEMP$BS_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__TEMP$BS__TEMP$BS__7B663F43] DEFAULT (newid())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TEMP$BS] ADD CONSTRAINT [PK__TEMP$BS__73F57E877D4E87B5] PRIMARY KEY CLUSTERED  ([TEMP$BS_ID]) ON [PRIMARY]
GO
