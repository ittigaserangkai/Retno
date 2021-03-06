CREATE TABLE [dbo].[TRADER]
(
[TRD_UNT_ID] [int] NOT NULL,
[TRD_CODE] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TRD_NAME] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TRD_ADDRESS] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TRD_TELP] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TRD_FAX] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TRD_CONTACT_PERSON] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TRD_NPWP] [varchar] (32) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TRD_LEAD_TIME] [int] NULL,
[TRD_TOP] [int] NULL,
[TRD_IS_ASSGROS] [int] NULL,
[TRD_DESCRIPTION] [varchar] (512) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TRD_MEMBER_ID] [int] NULL,
[TRD_MEMBER_UNT_ID] [int] NULL,
[TRD_TPBYR_ID] [int] NULL,
[OP_CREATE] [int] NULL,
[DATE_CREATE] [datetime] NULL CONSTRAINT [DF__TRADER__DATE_CRE__2077C861] DEFAULT (getdate()),
[OP_MODIFY] [int] NULL,
[DATE_MODIFY] [datetime] NULL,
[OPC_UNIT] [int] NULL,
[OPM_UNIT] [int] NULL,
[TRD_CREDIT_LIMIT] [numeric] (21, 3) NULL,
[TRD_SISA_PLAFON] [numeric] (21, 3) NULL,
[TRADER_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__TRADER__TRADER_I__6FF48C97] DEFAULT (newid()),
[REF$TIPE_MEMBER_ID] [uniqueidentifier] NULL CONSTRAINT [DF_TRADER_REF$TIPE_MEMBER_ID] DEFAULT (newid())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TRADER] ADD CONSTRAINT [PK__TRADER__2CCD71BD71DCD509] PRIMARY KEY CLUSTERED  ([TRADER_ID]) ON [PRIMARY]
GO
