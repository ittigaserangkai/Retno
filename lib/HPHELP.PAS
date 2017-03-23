unit HPHelp;

interface

uses SysUtils, WinTypes, WinProcs, Messages, Printers, {PrintAPI,} WinSpool;

function PrintFile(filename: string): integer;

implementation

function PrintFile(filename: string): integer;
var
          DriverName: array [0..255] of char;
          DeviceName: array [0..255] of char;
          OutPut: array [0..255] of char;
          DeviceMode: Thandle;
        //PrintHandle: HDC;
        //PrintJob: HDC;
        hp_file: File;
        buff: pointer;
        FileLen: DWORD;

        // added by yogatama
        hPrn: THandle;
        DocInfo1: TDocInfo1;
        BytesWritten: DWORD;
begin
  // added by yogatama
  if FileExists(filename) then
  begin
    //Printer.PrinterIndex := -1;
    Printer.GetPrinter(DeviceName, DriverName, Output, DeviceMode);

    //Writeln(IntToStr(Printer.Canvas.Font.Size));

    //Printer.Canvas.Font.Size := 1;

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
    if (FileLen <> BytesWritten) then begin
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
  ////////

  // Codes below are now used!!!
        {if FileExists( filename ) then
        begin
                  { Get printer info on global default printer }
              {Printer.GetPrinter( DeviceName, DriverName, Output, DeviceMode );
                  { Create a device context for it }
              {PrintHandle := CreateDC( DriverName, DeviceName, OutPut, nil );
                  { Hand DC to OpenJob, get Job# }
              {PrintJob := OpenJob( OutPut, 'HPFile', PrintHandle );
                  { Start a page on printer }
              {StartSpoolPage( PrintJob );

                  { Read file into buffer }
              {AssignFile( hp_file, filename );
              Reset( hp_file, 1 );
              FileLen := FileSize( hp_file );
              GetMem( buff, FileLen );
              BlockRead( hp_file, buff^, FileLen );
              System.CloseFile( hp_file );

                  { Write file out to page and end page }
              {WriteSpool( PrintJob, PChar( buff ), FileLen );
              EndSpoolPage( PrintJob );
              CloseJob( PrintJob );
              FreeMem( buff, FileLen );

                  { Free up printer DC }
              {DeleteDC( PrintHandle );
              PrintFile := 1;
        end
        else
        begin
              PrintFile := -1;
        end;}
end;

end.