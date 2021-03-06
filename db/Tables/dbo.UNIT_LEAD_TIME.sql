CREATE TABLE [dbo].[UNIT_LEAD_TIME]
(
[ULT_UNT_ID] [int] NOT NULL,
[ULT_DES_UNT_ID] [int] NOT NULL,
[ULT_LEAD_TIME] [int] NOT NULL,
[DATE_CREATE] [datetime] NULL,
[DATE_MODIFY] [datetime] NULL,
[OP_CREATE] [int] NULL,
[OP_MODIFY] [int] NULL,
[OPC_UNIT] [int] NULL,
[OPM_UNIT] [int] NULL,
[UNIT_LEAD_TIME_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__UNIT_LEAD__UNIT___241E3C13] DEFAULT (newid())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UNIT_LEAD_TIME] ADD CONSTRAINT [PK__UNIT_LEA__F444996C26068485] PRIMARY KEY CLUSTERED  ([UNIT_LEAD_TIME_ID]) ON [PRIMARY]
GO
