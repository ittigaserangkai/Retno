CREATE TABLE [dbo].[AUT$UNIT]
(
[UNT_CODE] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[UNT_NAME] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[UNT_DESCRIPTION] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UNT_CONTACT_PERSON] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UNT_EMAIL] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UNT_FAX] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UNT_PHONE] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UNT_PROP_ID] [int] NULL,
[UNT_RGN_CODE] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UNT_ZIP] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UNT_IS_HO] [int] NULL CONSTRAINT [DF__AUT$UNIT__UNT_IS__47DBAE45] DEFAULT ((0)),
[UNT_IS_STORE] [int] NULL CONSTRAINT [DF__AUT$UNIT__UNT_IS__48CFD27E] DEFAULT ((0)),
[UNT_IS_ALLOWPO] [int] NULL CONSTRAINT [DF__AUT$UNIT__UNT_IS__49C3F6B7] DEFAULT ((0)),
[UNT_ISGRALLOWED] [int] NULL CONSTRAINT [DF__AUT$UNIT__UNT_IS__4AB81AF0] DEFAULT ((0)),
[OP_CREATE] [int] NULL,
[OPC_UNIT] [int] NULL,
[DATE_CREATE] [datetime] NULL CONSTRAINT [DF__AUT$UNIT__DATE_C__4BAC3F29] DEFAULT (getdate()),
[OP_MODIFY] [int] NULL,
[OPM_UNIT] [int] NULL,
[DATE_MODIFY] [datetime] NULL,
[UNT_IS_ACTIVE] [int] NULL CONSTRAINT [DF__AUT$UNIT__UNT_IS__4CA06362] DEFAULT ((0)),
[AUT$UNIT_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__AUT$UNIT__ID__353DDB1D] DEFAULT (newid()),
[COMPANY_ID] [uniqueidentifier] NULL,
[UNT_PARENT_ID] [uniqueidentifier] NULL,
[AUT$APP_ID] [uniqueidentifier] NULL,
[UNT_IS_WH] [int] NULL,
[UNT_NPWP] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UNT_NPWP_ADR] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UNT_NPWP_NAME] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UNT_NPWP_REG_DATE] [datetime] NULL,
[REF$TIPE_PERUSAHAAN_ID] [uniqueidentifier] NULL,
[UNT_ADR] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[KABUPATEN_ID] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AUT$UNIT] ADD CONSTRAINT [PK__AUT$UNIT__3214EC273726238F] PRIMARY KEY CLUSTERED  ([AUT$UNIT_ID]) ON [PRIMARY]
GO
