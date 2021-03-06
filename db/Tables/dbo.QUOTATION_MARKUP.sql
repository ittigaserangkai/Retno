CREATE TABLE [dbo].[QUOTATION_MARKUP]
(
[QUOTMU_UNT_ID] [int] NOT NULL,
[QUOTMU_DATE] [datetime] NULL,
[QUOTMU_REF_NO] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[QUOTMU_REMARK] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OP_CREATE] [int] NULL,
[DATE_CREATE] [datetime] NULL CONSTRAINT [DF__QUOTATION__DATE___6B79F03D] DEFAULT (getdate()),
[OP_MODIFY] [int] NULL,
[DATE_MODIFY] [datetime] NULL,
[OPC_UNIT] [int] NULL,
[OPM_UNIT] [int] NULL,
[QUOTATION_MARKUP_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__QUOTATION__QUOTA__4CCB4BEB] DEFAULT (newid())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[QUOTATION_MARKUP] ADD CONSTRAINT [PK__QUOTATIO__3F2D87C64EB3945D] PRIMARY KEY CLUSTERED  ([QUOTATION_MARKUP_ID]) ON [PRIMARY]
GO
