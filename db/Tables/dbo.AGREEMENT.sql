CREATE TABLE [dbo].[AGREEMENT]
(
[AGR_UNT_ID] [int] NOT NULL,
[AGR_NO] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AGR_DATE_START] [datetime] NULL CONSTRAINT [DF__AGREEMENT__AGR_D__1ED998B2] DEFAULT (getdate()),
[AGR_DATE_END] [datetime] NULL,
[AGR_PER_CNT] [int] NULL CONSTRAINT [DF__AGREEMENT__AGR_P__1FCDBCEB] DEFAULT ((0)),
[AGR_PER_ID] [int] NULL,
[AGR_PER_UNT_ID] [int] NULL,
[AGR_INV_CNT] [int] NULL CONSTRAINT [DF__AGREEMENT__AGR_I__20C1E124] DEFAULT ((0)),
[AGR_IS_BKP] [int] NULL,
[AGR_PJK_ID] [int] NOT NULL,
[AGR_IS_PPN] [int] NULL,
[AGR_IS_PPH23] [int] NULL,
[AGR_DESCRIPTION] [varchar] (512) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AGR_CUST_CODE] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AGR_CUST_UNT_ID] [int] NOT NULL,
[AGR_TPBYR_ID] [int] NULL,
[OP_CREATE] [int] NULL,
[DATE_CREATE] [datetime] NULL CONSTRAINT [DF__AGREEMENT__DATE___21B6055D] DEFAULT (getdate()),
[OP_MODIFY] [int] NULL,
[DATE_MODIFY] [datetime] NULL,
[AGR_SUP_CODE] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OPC_UNIT] [int] NULL,
[OPM_UNIT] [int] NULL,
[AGREEMENT_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__AGREEMENT__AGREE__4376EBDB] DEFAULT (newid())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AGREEMENT] ADD CONSTRAINT [PK__AGREEMEN__5E02AEBB455F344D] PRIMARY KEY CLUSTERED  ([AGREEMENT_ID]) ON [PRIMARY]
GO