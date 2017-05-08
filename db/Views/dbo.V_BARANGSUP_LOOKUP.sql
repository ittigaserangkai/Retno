SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[V_BARANGSUP_LOOKUP]
AS
SELECT 
A.BARANG_ID, 
D.SUPLIER_MERCHAN_GRUP_ID, 
A.REF$MERCHANDISE_ID,
A.REF$MERCHANDISE_GRUP_ID,
E.REF$SATUAN_ID AS SATUAN_ID,
A.BRG_CODE, A.BRG_NAME, 
E.SAT_CODE, 
C.SUP_CODE, 
C.SUP_NAME,
A.TEMP_STOCK AS STOCK, 
A.TEMP_AVGSALES AS ADS,
B.BRGSUP_MIN_ORDER AS MINORDER, 
B.BRGSUP_MAX_ORDER AS MAXORDER, 
F.MERCHANGRUP_NAME, 
G.MERCHAN_NAME,
D.SUPMG_LEAD_TIME AS LEADTIME,
B.BRGSUP_BUY_PRICE as BUYPRICE, 
B.BRGSUP_DISC1 as DISC1, 
B.BRGSUP_DISC2 AS DISC2, 
B.BRGSUP_DISC3 AS DISC3, 
B.BRGSUP_IS_BKP AS IS_BKP,
((B.BRGSUP_BUY_PRICE * (100-B.BRGSUP_DISC1)/100) * (100-B.BRGSUP_DISC2)/100) - B.BRGSUP_DISC3 AS NETPRICE
FROM BARANG A
INNER JOIN BARANG_SUPLIER B ON A.BARANG_ID=B.BARANG_ID
INNER JOIN SUPLIER C ON B.SUPLIER_ID=C.SUPLIER_ID
INNER JOIN SUPLIER_MERCHAN_GRUP D ON D.SUPLIER_ID = C.SUPLIER_ID
AND A.REF$MERCHANDISE_GRUP_ID = D.REF$MERCHANDISE_GRUP_ID
INNER JOIN REF$SATUAN E ON A.REF$SATUAN_PURCHASE = E.REF$SATUAN_ID
INNER JOIN REF$MERCHANDISE_GRUP F ON F.REF$MERCHANDISE_GRUP_ID = A.REF$MERCHANDISE_GRUP_ID
INNER JOIN REF$MERCHANDISE G ON F.REF$MERCHANDISE_ID = G.REF$MERCHANDISE_ID
WHERE C.SUP_IS_ACTIVE = 1
--AND A.REF$MERCHANDISE_ID =  + QuotedStr(aMerchandise);
GO