SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[SP_KARTOK]
(
	-- Add the parameters for the function here
  @BRG_CODE VARCHAR(20),
  @BRG_UNT_ID INTEGER,
  @PERIODEAWAL DATETIME2,
  @PERIODEAKHIR DATETIME2
)
RETURNS @TempTable TABLE 
(
	-- Add the column definitions for the TABLE variable here
  KODEBRG VARCHAR(20),
  UOM VARCHAR(4),
  NOBUKTI VARCHAR(60),
  TIPETRANSAKSI VARCHAR(30),
  ISBONUSFORBONUS INTEGER,
  QTY FLOAT,
  TANGGAL DATETIME2,
  RUPIAH FLOAT
)
AS
BEGIN
	-- Fill the table variable with the rows for your result set
  /* Saldo Awal */
  DECLARE @TANGGAL date
  SET @TANGGAL = DATEADD(d,-1,@PERIODEAWAL)
  DECLARE @Qty FLOAT
  SET @Qty = 0
  
  INSERT INTO @TempTable (NOBUKTI, ISBONUSFORBONUS, UOM, QTY, RUPIAH)
  SELECT 'Saldo Awal', a.IsBonusForBonus,A.BSS_SAT_CODE, ISNULL(SUM(A.BSS_QTY * B.KONVSAT_SCALE), 0) as Qty,sum(A.BSS_QTY * a.BSS_HARGA_TRANSAKSI) as Rupiah
    FROM BARANG_STOK_SIRKULASI A, REF$KONVERSI_SATUAN B
    WHERE B.KONVSAT_BRG_CODE = A.BSS_BRG_CODE
    AND B.KONVSAT_SAT_CODE_FROM = A.BSS_SAT_CODE
    AND cast(A.BSS_DATE as date) < @PERIODEAWAL
    and year(a.BSS_DATE) = year(@PERIODEAWAL)
    and a.BSS_UNT_ID = @BRG_UNT_ID
    and a.bss_brg_code = @BRG_CODE
    group by a.IsBonusForBonus,A.BSS_SAT_CODE

  /* mutasi */
  INSERT INTO @TempTable (KODEBRG, UOM, NOBUKTI, TIPETRANSAKSI, ISBONUSFORBONUS, TANGGAL, QTY, RUPIAH)
  SELECT A.BSS_BRG_CODE,A.BSS_SAT_CODE, a.BSS_DOC_NO, a.BSS_TYPE, ISNULL(a.IsBonusForBonus, 0), a.BSS_DATE, 
    ISNULL(SUM(A.BSS_QTY * B.KONVSAT_SCALE), 0) as Qty, ISNULL(sum(A.BSS_QTY * A.BSS_HARGA_TRANSAKSI), 0) as Rupiah
    FROM BARANG_STOK_SIRKULASI A, REF$KONVERSI_SATUAN B
    WHERE B.KONVSAT_BRG_CODE = A.BSS_BRG_CODE
    AND B.KONVSAT_SAT_CODE_FROM = A.BSS_SAT_CODE
    AND cast(A.BSS_DATE as date) between @PERIODEAWAL and @PERIODEAKHIR
    and a.BSS_UNT_ID = @BRG_UNT_ID
    and a.bss_brg_code = @BRG_CODE
    group by A.BSS_BRG_CODE,A.BSS_SAT_CODE, a.BSS_DOC_NO, a.BSS_TYPE, a.IsBonusForBonus, a.BSS_DATE
    order by a.BSS_DATE
   
  RETURN
END
GO
