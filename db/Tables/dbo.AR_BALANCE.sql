CREATE TABLE [dbo].[AR_BALANCE]
(
[ARB_UNT_ID] [int] NOT NULL,
[ARB_OPPER_ID] [int] NOT NULL,
[ARB_OPPER_COMP_ID] [int] NOT NULL,
[ARB_CUST_ID] [int] NOT NULL,
[ARB_CUST_UNT_ID] [int] NOT NULL,
[ARB_DEBET] [numeric] (21, 3) NULL,
[ARB_CREDIT] [numeric] (21, 3) NULL,
[OP_CREATE] [int] NULL,
[DATE_CREATE] [datetime] NULL CONSTRAINT [DF__AR_BALANC__DATE___3C69FB99] DEFAULT (getdate()),
[OP_MODIFY] [int] NULL,
[DATE_MODIFY] [datetime] NULL,
[OPC_UNIT] [int] NULL,
[OPM_UNIT] [int] NULL,
[AR_BALANCE_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__AR_BALANC__AR_BA__1C0818FF] DEFAULT (newid())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AR_BALANCE] ADD CONSTRAINT [PK__AR_BALAN__20145C041DF06171] PRIMARY KEY CLUSTERED  ([AR_BALANCE_ID]) ON [PRIMARY]
GO
