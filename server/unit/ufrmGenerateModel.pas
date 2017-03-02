unit ufrmGenerateModel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.ExtCtrls, cxSplitter;


type
  TfrmGenerateModel = class(TForm)

    pnlDaftarTable: TPanel;
    cxGridDBTableDaftarTable: TcxGridDBTableView;
    cxgrdlvlDaftarTable: TcxGridLevel;
    cxGridDBDaftarTable: TcxGrid;
    cxGridColNama: TcxGridDBColumn;
    cxspltrTable: TcxSplitter;
    cxStyleRepository1: TcxStyleRepository;
    cxstylcxGridHeader: TcxStyle;
    cxstylcxGridEven: TcxStyle;
    cxstylcxGridOdd: TcxStyle;
    cxGridDB1: TcxGrid;
    cxgrdlvlGridDB1Level1: TcxGridLevel;
    btn1: TButton;
    procedure cxGridDBTableDaftarTableCellDblClick(Sender: TcxCustomGridTableView;
        ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
        TShiftState; var AHandled: Boolean);
    procedure FormCreate(Sender: TObject);

    procedure ControlMouseDown(Sender: TObject;Button: TMouseButton;Shift: TShiftState;      X, Y: Integer);
    procedure ControlMouseMove(Sender: TObject;Shift: TShiftState;X, Y: Integer);
    procedure ControlMouseUp(Sender: TObject;Button: TMouseButton;Shift: TShiftState; X, Y: Integer);

  private
    inReposition : boolean;
    oldPos : TPoint;

    procedure IsiGridTable;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGenerateModel: TfrmGenerateModel;

implementation
uses
  uAppUtils, uDBUtils, uDXUtils;

{$R *.dfm}

procedure TfrmGenerateModel.ControlMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Sender is TWinControl) then
  begin
    inReposition:=True;
    SetCapture(TWinControl(Sender).Handle);
    GetCursorPos(oldPos);
  end;
end;

procedure TfrmGenerateModel.ControlMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
const
  minWidth = 20;
  minHeight = 20;
var
  newPos: TPoint;
  frmPoint : TPoint;
begin
  if inReposition then
  begin
    with TWinControl(Sender) do
    begin
      GetCursorPos(newPos);

      if ssShift in Shift then
      begin //resize
        Screen.Cursor := crSizeNWSE;
        frmPoint := ScreenToClient(Mouse.CursorPos);

        if frmPoint.X > minWidth then
          Width := frmPoint.X;

        if frmPoint.Y > minHeight then
          Height := frmPoint.Y;
      end else
      begin
        Screen.Cursor := crSize;
        Left := Left - oldPos.X + newPos.X;
        Top := Top - oldPos.Y + newPos.Y;
        oldPos := newPos;
      end;
    end;
  end;
end;

procedure TfrmGenerateModel.ControlMouseUp(
  Sender: TObject;
  Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if inReposition then
  begin
    Screen.Cursor := crDefault;
    ReleaseCapture;
    inReposition := False;
  end;
end; (*ControlMouseUp*)

procedure TfrmGenerateModel.cxGridDBTableDaftarTableCellDblClick(Sender:
    TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
    AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var
  cxGrid: TcxGrid;
  sNamaTable: string;
  sSQL: string;
begin
  cxGrid := CreateCXDBGrid(368, 40, 250,200, Self);
  sNamaTable := TcxGridDBTableView(Sender).DataController.DataSource.DataSet.FieldByName('Nama').AsString;


  sSQL := 'select COLUMN_NAME as NAMA, DATA_TYPE' +
          ' NUMERIC_PRECISION from INFORMATION_SCHEMA.COLUMNS' +
          ' where TABLE_NAME=' + QuotedStr(sNamaTable);

  TcxGridDBTableView(cxGrid.Levels[0].GridView).LoadFromSQL(sSQL);
  btn1.OnMouseDown := ControlMouseDown;
  btn1.OnMouseMove := ControlMouseMove;
  btn1.OnMouseUp := ControlMouseUp;

end;

procedure TfrmGenerateModel.FormCreate(Sender: TObject);
begin
  IsiGridTable;
end;

procedure TfrmGenerateModel.IsiGridTable;
var
  sSQL: string;
begin
  sSQL := 'SELECT TABLE_NAME as Nama FROM INFORMATION_SCHEMA.TABLES' +
          ' WHERE TABLE_TYPE=' + QuotedStr('BASE TABLE') +
          ' ORDER BY TABLE_NAME ';

  cxGridDBTableDaftarTable.LoadFromSQL(sSQL);
end;

end.
