unit uTemplatePrintText;

interface

uses SysUtils, WinTypes, WinProcs, Messages, Printers, {PrintAPI,} WinSpool;

const

  GENERAL_TEXT_FILE_NAME_TEMPORARY  = 'tmpPrn.txt';
  GENERAL_TEXT_SINGLE_LINE          = '-----------------------------------------------';
  GENERAL_TEXT_DOUBLE_LINE          = '===============================================';

// ---------------------------------------------------------------------------------------
// TEMPLATE DO REALISASI
// ---------------------------------------------------------------------------------------

  DO_REAL_TEXT_HEADER_PRINT =         '                   TIGA TIGA' + #13#10 +
                                      '              PERKULAKAN KOPERASI' + #13#10 +
                                      '                      SOLO' + #13#10 +
                                      ' JL.A.YANI NO.308 PABELAN KARTASURA 0271-743333' + #13#10 +
                                      '' + #13#10 +
                                      '  NPWP: 02.000.274.7-525.000';

  DO_REAL_TEXT_HEADER_PO_DO         = '        No. PO / DO    : '; {No.PO / No. DO}
  DO_REAL_TEXT_HEADER_TGL_JAM       = '        Tanggal/Jam    : '; {tanggal / waktu}
  DO_REAL_TEXT_HEADER_NO_TRANSAKSI  = '        No.Transaksi   : '; {no transaksi}
  DO_REAL_TEXT_HEADER_NO_POS        = '        No.POS/Id Kasir: '; {id POS kasir}

  DO_REAL_TEXT_COLUMN_HEADER        = ' PLU   Nm Brg  Disc  Qty.     Harga       Total';

  DO_REAL_TEXT_JNS_KARTU            = 'Jns Kartu: '; {jenis kartu}
  DO_REAL_TEXT_NO_KARTU             = 'No. Kartu: '; {no kartu}
  DO_REAL_TEXT_OTORISASI            = 'Otorisasi: '; {otorisasi}
  DO_REAL_TEXT_VOUCHER_G            = 'Voucher    [A]      (    ) ';
  DO_REAL_TEXT_VOUCHER_B            = '           [B]      (    ) ';
  DO_REAL_TEXT_VOUCHER_L            = '           [L]      (    ) ';

  DO_REAL_TEXT_TOTAL                = 'TOTAL. '; {total}
  DO_REAL_TEXT_CASH                 = 'CASH.  '; {cash}
  DO_REAL_TEXT_CARD                 = 'CARD.  '; {card}
  DO_REAL_TEXT_VCHR                 = 'VCHR.  '; {voucher}

  DO_REAL_TEXT_LINE_SHORT           = '--------------------';

  DO_REAL_TEXT_KEMBALI              = 'Kembali   '; {kembalian}
  DO_REAL_TEXT_TOTAL_COLIE          = '                           Ttl Colie '; {colie}

  DO_REAL_TEXT_FOOTER_PRINT         = '' + #13#10 +
                                      '    Yakinkan Kembali Barang yang Anda Beli,' + #13#10 +
                                      ' Terima Kasih Anda Telah Mengunjungi Assalaam';

  DO_REAL_INT_JANGKAUAN_DISC    = 18;
  DO_REAL_INT_JANGKAUAN_QTY     = 6;
  DO_REAL_INT_JANGKAUAN_HARGA   = 11;
  DO_REAL_INT_JANGKAUAN_TOTAL   = 12;
  DO_REAL_INT_JANGKAUAN_KARTU   = 16;
  DO_REAL_INT_JANGKAUAN_REKAP   = 13;
  DO_REAL_INT_JANGKAUAN_KEMBALI = 10;


// ---------------------------------------------------------------------------------------
// TEMPLATE PO FROM TRADER
// ---------------------------------------------------------------------------------------

  PO_AS_TEXT_HEADER_PRINT         = 'ASSALAAM NIAGA UTAMA - MG SOLO';
  PO_AS_TEXT_PURCASE_ORDER        = '       PURCHASE ORDER      Tgl Kirim:'; {date}
  PO_AS_TEXT_KRING_33             = '         Kring - 33                  '; {time}

  PO_AS_TEXT_NO_PO                = 'No. PO: '; {no PO}
  PO_AS_TEXT_TRADER               = 'Trader: '; {kode trader} {nama trader}
  PO_AS_TEXT_ALAMAT_TRADER        = 'Alamat: '; {alamat trader}
  PO_AS_TEXT_SPACE_USER           = '                           '; {user}

  PO_AS_TEXT_COLUMN_HEADER        = 'Kode Nama Barang                    Qty.   Total Nilai';

  PO_AS_TEXT_TOTAL_COLIE          = 'Ttl Colie:';
  PO_AS_TEXT_GRAND_TOTAL          = '          GRAND TOTAL:';

  PO_AS_TEXT_SHORT_SINGLE_LINE    = '-------';
  PO_AS_TEXT_SHORT_DOUBLE_LINE    = '=======';

  PO_AS_INT_JANGKAUAN_ALAMAT_TRADER = 39;
  PO_AS_INT_JANGKAUAN_NAMA_BARANG   = 34;
  PO_AS_INT_JANGKAUAN_QTY           = 6;
  PO_AS_INT_JANGKAUAN_TOTAL         = 14;
  PO_AS_INT_JANGKAUAN_COLIE         = 8;
  PO_AS_INT_JANGKAUAN_GRAND_TOTAL   = 14;


// ---------------------------------------------------------------------------------------
// TEMPLATE RANKING CREDIT NOTE - WASTAGE
// ---------------------------------------------------------------------------------------
  R_CNW_TEXT_HEADER1  = 'PT. ASSALAAM NIAGA UTAMA                                                Date: '; {date}
  R_CNW_TEXT_HEADER2  = '                                                                        Time: '; {time}
  R_CNW_TEXT_H3_SPC_A = '                              '; {dateFrom}
  R_CNW_TEXT_H3_SD    = ' s/d '; {dateTo}
  R_CNW_TEXT_H3_SPC_B = '                 User: '; {user}
  R_CNW_TEXT_TITLE_CN = '                             Listing Ranking Credit Note                Page: 1'; {page}
  R_CNW_TEXT_TITLE_W  = '                               Listing Ranking Wastage                  Page: 1'; {page}
  R_CNW_TEXT_H4_SPC   = '                                    '; {#top rank}
  R_CNW_TEXT_H4_BIG   = ' (Bigger)';
  R_CNW_TEXT_H5_LINE  = '                            =============================';
  R_CNW_TEXT_H6_MER   = 'Merch. : '; {merch_code + ' ' + mech_name}
  R_CNW_TEXT_H6_CN    = ' Credit Note';
  R_CNW_TEXT_H6_W     = '     Wastage';
  R_CNW_TEXT_LINE_COL = '------------------------------------------------------------------------------------------';
  R_CNW_TEXT_COL_HDR  = 'Counter  Supplier Code & Name                                               Amount Summary';
  R_CNW_TEXT_FOOTER   = '*** End of Report ***                                 Grand Total -->>  '; {grand total}

  R_CNW_INT_JANGKAUAN_MERCH    = 69;
  R_CNW_INT_JANGKAUAN_COUNTER  = 5;
  R_CNW_INT_JANGKAUAN_KODE_SUP = 8;
  R_CNW_INT_JANGKAUAN_NAMA_SUP = 58;
  R_CNW_INT_JANGKAUAN_AMOUNT   = 15;
  R_CNW_INT_JANGKAUAN_TOTAL    = 18;


function PrintFile( filename: string ): integer;

implementation

uses math;

// This function is copied from POS
function PrintFile( filename: string ): integer;
var
  DriverName: array [0..255] of char;
  DeviceName: array [0..255] of char;
  OutPut: array [0..255] of char;
  DeviceMode: Thandle;
//  PrintHandle: HDC;
//  PrintJob: HDC;
  hp_file: File;
  buff: pointer;
  FileLen: LongInt;

  hPrn: THandle;
  DocInfo1: TDocInfo1;
  BytesWritten: DWORD;
begin
  if FileExists(filename) then
  begin
    Printer.GetPrinter(DeviceName, DriverName, Output, DeviceMode);
    if (OpenPrinter(DeviceName, hPrn, nil) = False) then
    begin
      Result := -1;
      Exit;
    end;
    DocInfo1.pDocName := 'HPFile';
    DocInfo1.pOutputFile := Output;
    DocInfo1.pDataType := 'RAW';

    if (StartDocPrinter(hPrn, 1, @DocInfo1) = 0) then
    begin
      Result := -1;
      ClosePrinter(hPrn);
      Exit;
    end;

    if (StartPagePrinter(hPrn) = FALSE) then
    begin
      Result := -1;
      EndDocPrinter(hPrn);
      ClosePrinter(hPrn);
      Exit;
    end;

    AssignFile(hp_file, filename);
    Reset(hp_file, 1);
    FileLen := FileSize(hp_file);
    GetMem(buff, FileLen);
    BlockRead(hp_file, buff^, FileLen);
    System.CloseFile(hp_file);


    if (WritePrinter(hPrn, buff, FileLen, BytesWritten) = FALSE) then
    begin
      Result := -1;
      EndPagePrinter(hPrn);
      EndDocPrinter(hPrn);
      ClosePrinter(hPrn);
      FreeMem(buff, FileLen);
      Exit;
    end;
    if (FileLen <> Floor(BytesWritten)) then begin
      Result := -1;
      EndPagePrinter(hPrn);
      EndDocPrinter(hPrn);
      ClosePrinter(hPrn);
      FreeMem(buff, FileLen);
      Exit;
    end;

    FreeMem(buff, FileLen);
    EndPagePrinter(hPrn);
    EndDocPrinter(hPrn);
    ClosePrinter(hPrn);
    Result := 1;
  end
  else
  begin
    Result := -1;
  end;
  Exit;
end;

end.
