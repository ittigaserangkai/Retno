SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[Refresh_LastStock_v3] @kode_cabang char(5), @PLU char(7) 
AS
BEGIN
SET NOCOUNT ON;


Declare @RunningTotal float
Declare @tglStart datetime
Declare @periode varchar(6)

--select @kode_cabang=kode_cabang from dbo.TblIdentitasToko
--print 'kode cabang : ' + @kode_cabang
select top 1 @periode=Periode from dbo.TblLastStock where Kode_Cabang = @kode_cabang
print 'periode tblLastStock: ' + @periode
--set @tglStart = CONVERT(datetime, SUBSTRING(@periode, 1, 4)+'-'+SUBSTRING(@periode, 5, 2)+'-01', 23)
set @tglStart = CAST(SUBSTRING(@periode, 1, 4)+'-'+SUBSTRING(@periode, 5, 2)+'-01' as datetime)
print @tglStart

DECLARE @namaPK VARCHAR(50)
SELECT @namaPK = REPLACE(NEWID(), '-', '')
PRINT @namaPK

--buat temp table utk mempercepat baca stock
CREATE TABLE #LastStock (id_stock int not null, plu char(7), Kode_Transaksi varchar(5), no_doc varchar(60), tanggal datetime, qty_sisa float)
EXEC('ALTER TABLE #LastStock ADD CONSTRAINT PK_'+@namaPK+' PRIMARY KEY CLUSTERED (id_stock)')
--ALTER TABLE #LastStock ADD CONSTRAINT	PK_#LastStock_ID PRIMARY KEY CLUSTERED 	( id_stock )

CREATE NONCLUSTERED INDEX idx_#LastStock_Tgl on #LastStock (tanggal DESC)

--select id_stock, plu, Kode_Transaksi, no_doc, tanggal,qty_sisa into #sales from TblStock  
insert into #LastStock 
select id_stock, plu, Kode_Transaksi, no_doc, tanggal,qty_sisa 
from TblStock  
where Kode_Cabang=@kode_cabang and Tanggal >= @tglStart 

select * from #LastStock where plu like rtrim(@plu)
print 'plu filter : ' + @PLU

Declare MrCursor Cursor Local Forward_Only For
     Select plu
      from tblmasteritembarang where plu like RTRIM(@plu)  and not (Kode_CaraBayar ='JB' or Kode_Divisi='99')
Open MrCursor

Fetch Next From MrCursor Into @PLU
while (@@Fetch_Status=0)
Begin
      --set @RunningTotal = 
      set @RunningTotal = null
      Select top 1 @tglStart=tanggal, @RunningTotal=Qty_Sisa 
            from #LastStock 
            where Plu = @PLU and Kode_Transaksi <> 'MRK'
            order by Tanggal desc, id_stock desc
      if not (@RunningTotal IS NULL)
      begin
		print 'baca saldo akhir : ' + @PLU + ', tgl : ' + convert(nvarchar(30), @tglStart, 21)
		print @RunningTotal

		update ls 
		set ls.Qty_LastStock=@RunningTotal, ls.Kirim = ls.Qty_LastStock
		from TblLastStock ls inner join #LastStock ss on ls.Plu = ss.plu
		where ls.Plu = @plu and ls.Kode_Cabang=@kode_cabang and ls.Qty_LastStock<>@RunningTotal
	  end
FETCH NEXT FROM MrCursor 
INTO @PLU
END 

CLOSE MrCursor 
DEALLOCATE MrCursor
            
--drop table #Stock
EXEC('ALTER TABLE #LastStock DROP PK_'+@namaPK)
--ALTER TABLE #LastStock DROP PK_#LastStock_ID
DROP INDEX #LastStock.idx_#LastStock_Tgl
DROP TABLE #LastStock

return 1
END
GO
