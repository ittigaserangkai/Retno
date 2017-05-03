SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE function [dbo].[fn_nomember](
	@TIPEMEMBER varchar(50)
)
returns varchar(100) 
as
begin
	DECLARE @NOMEMBER VARCHAR(100) = 'ERROR';
	IF @TIPEMEMBER = 'PAS'
	BEGIN
		declare @maxno varchar(100) = 
		(
		select MAX(right(left(a.member_card_no, 8), 6)) from MEMBER A
		LEFT JOIN REF$TIPE_MEMBER B ON A.REF$TIPE_MEMBER_ID = B.REF$TIPE_MEMBER_ID
		WHERE B.TPMEMBER_NAME = @TIPEMEMBER
		)
		declare @maxnoint int = cast(@maxno as int)+1;
		if @maxnoint = 55 set @maxnoint = 56;
		declare @temp varchar(100) = cast(@maxnoint as varchar(10));
		declare @maxdigit int = LEN(@temp);
		declare @index int = 1;
		declare @jumlah int = 0;
		while @index <= @maxdigit
			Begin
			  set @jumlah = @jumlah + (cast(substring(@temp, @index, 1) AS INT))
			  set @index = @index + 1;
			End;
		declare @digit7 int = 0;
		set @digit7 = 10 - ( @jumlah%10);
		SET @nomember  = '01' + right('000000' + @temp, 6) + cast(@digit7 as varchar(1)) + '00';
	END;
	IF @TIPEMEMBER = 'MASJID'
	BEGIN
		declare @maxnoMASJID varchar(100) = 
		(
		select ISNULL(MAX(right(a.member_card_no, 7)),0) from MEMBER A
		LEFT JOIN REF$TIPE_MEMBER B ON A.REF$TIPE_MEMBER_ID = B.REF$TIPE_MEMBER_ID
		WHERE B.TPMEMBER_NAME = @TIPEMEMBER
		)
		if (@maxnoMASJID = null) set @maxnoMASJID = 0;
		declare @maxnoMASJIDint int = cast(@maxnoMASJID as int)+1;
		declare @tempMASJID varchar(100) = cast(@maxnoMASJIDint as varchar(10));
		SET @nomember  = '0144' + right('0000000' + @tempMASJID, 7);
	END;
	IF @TIPEMEMBER IN ('KPK','TRADER','ASSALAM','ASGROSS')
	BEGIN
		declare @maxnoTRADER varchar(100) = 
		(
		select ISNULL(MAX(right(a.member_card_no, 7)),0) from MEMBER A
		LEFT JOIN REF$TIPE_MEMBER B ON A.REF$TIPE_MEMBER_ID = B.REF$TIPE_MEMBER_ID
		WHERE B.TPMEMBER_NAME IN ('KPK','TRADER','ASSALAM','ASGROSS')
		)
		declare @maxnoTRADERint int = cast(@maxnoTRADER as int)+1;
		declare @tempTRADER varchar(100) = cast(@maxnoTRADERint as varchar(10));
		SET @nomember  = '0133' + right('0000000' + @tempTRADER, 7);
	END;
	IF @TIPEMEMBER = 'INSTANSI'
	BEGIN
		declare @maxnoINSTANSI varchar(100) = 
		(
		select ISNULL(MAX(right(a.member_card_no, 7)),0) from MEMBER A
		LEFT JOIN REF$TIPE_MEMBER B ON A.REF$TIPE_MEMBER_ID = B.REF$TIPE_MEMBER_ID
		WHERE B.TPMEMBER_NAME = @TIPEMEMBER
		)
		declare @maxnoINSTANSIint int = cast(@maxnoINSTANSI as int)+1;
		declare @tempINSTANSI varchar(100) = cast(@maxnoINSTANSIint as varchar(10));
		SET @nomember  = '0155' + right('0000000' + @tempINSTANSI, 7);
	END;
	return @nomember;
end;
GO
