CREATE TABLE [dbo].[SCENARIO_SUBDETIL]
(
[SCENSD_UNT_ID] [int] NOT NULL,
[SCENSD_SCEND_ID] [int] NOT NULL,
[SCENSD_SCEND_UNT_ID] [int] NOT NULL,
[SCENSD_REK_CODE] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SCENSD_REK_COMP_ID] [int] NOT NULL,
[SCENSD_IS_DEBET] [int] NULL,
[SCENSD_COCTER_ID] [int] NULL,
[SCENSD_COCTER_UNT_ID] [int] NULL,
[SCENSD_IS_MULTI] [int] NULL,
[SCENSD_GRUP_ID] [int] NULL,
[SCENSD_GRUP_UNT_ID] [int] NULL,
[OP_CREATE] [int] NULL,
[DATE_CREATE] [datetime] NULL CONSTRAINT [DF__SCENARIO___DATE___76B698BF] DEFAULT (getdate()),
[OP_MODIFY] [int] NULL,
[DATE_MODIFY] [datetime] NULL,
[OPC_UNIT] [int] NULL,
[OPM_UNIT] [int] NULL,
[SCENARIO_SUBDETIL_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__SCENARIO___SCENA__47B19113] DEFAULT (newid())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SCENARIO_SUBDETIL] ADD CONSTRAINT [PK__SCENARIO__49D3C7384999D985] PRIMARY KEY CLUSTERED  ([SCENARIO_SUBDETIL_ID]) ON [PRIMARY]
GO
