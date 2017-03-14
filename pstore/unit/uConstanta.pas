unit uConstanta;

interface

uses Windows, SysUtils, Classes, Messages;

const
  // core
  CONFIG_FILE = 'config.ini';
  DB_HO = 'DBHO';
  DB_STORE = 'DBSTORE';
  DEBUG = 'DEBUG';
  
  REFRESH_SERVER = 'REFRESH_SERVER';
  LOCAL_CLIENT = 'LOCAL_CLIENT';

  PATH_FILE_NOTA = 'PATH_FILE_NOTA';

  PATH_TEMPLATE = 'PATH_REPORT';

  // error message
  ER_EMPTY = ' Tidak Boleh Kosong';
  ER_EXIST = ' Sudah Ada';
  ER_STOPPED = 'Process stopped. ';
  ER_PO_IS_NOT_EXIST = 'Nomor PO Tida Ditemukan!';
  ER_INSERT_FAILED = 'Gagal Menyimpan Data';
  ER_UPDATE_FAILED = 'Gagal Mengubah Data';
  ER_DELETE_FAILED = 'Gagal Menghapus Data';
  ER_QUERY_FAILED = 'Gagal Eksekusi Query';
  ER_SP_FAILED = 'Gagal Eksekusi Stored Procedure';
  ER_QTY_NOT_ALLOWED = 'Qty Tidak Diperbolehkan';
  ER_SO_NOT_SPECIFIC = '"Create SO for" must be specific.';
  ER_BRG_NOT_SPECIFIC = 'Produk Harus Specific';
  ER_SAVE_DO = 'Gagal Simpan DO';
  ER_DO_BONUS = 'Gagal Simpan DO Bonus';
  ER_SHIFT_NOT_FOUND = 'Shift name not found.';
  ER_TRANSACT_NOT_FOUND = 'Transaction number not found.';
  ER_FAILED_INSERT_PO_TRADER = 'Input PO from trader failed.';
  ER_UNIT_NOT_SPECIFIC = 'Unit Belum Dipilih';
  ER_COMPANY_NOT_SPECIFIC = 'Company Belum Dipilih';
  ER_UNIT_OR_COMPANY_NOT_SPECIFIC = 'Company Atau Unit Belum Dipilih';
  ER_NOT_FOUND = 'Tidak Ditemukan';
  ER_TOTAL_ALLOCATION = 'Total Alokasi Harus 100';
  ER_TAX_EXPIRED = 'Tax is Expired, Please Renew.';
  ER_SUBSIDY_TELAH_DIGUNAKAN = 'Subsidy can not delete, because already used ';
  ER_VIOLATION_FOREIGN_KEY = 'Could not delete data. It has already used';
  ERR_CODE_VIOLATION=335544466;
  ER_FISCAL_PERIODE_INACTIVE = 'Fiscal Periode Is Inactive';

  // confirm
  CONF_ADD_SUCCESSFULLY = 'Berhasil Menyimpan Data';  
  CONF_EDIT_SUCCESSFULLY = 'Berhasil Mengubah Data';
  CONF_DELETE_SUCCESSFULLY = 'Berhasil Menghapus Data';
  CONF_VALIDATE_SUCCESSFULLY = 'Berhasil Validasi';
  CONF_COULD_NOT_EDIT = 'Data Tidak Bisa Diedit';
  CONF_COULD_NOT_DELETE = 'Data Tidak Bisa Dihapus';
  CONF_TOTAL_AGREEMENT = 'Total Agreement Tidak Cukup';
  SAVE_DO_SUCCESSFULLY = 'DO saved successfully.';
  SAVE_DO_EXPIRED = 'PO updated successfully.';
  SAVE_SERVICE_LEVEL_SUCCESSFULLY = 'Service Level saved successfully.';
  SAVE_CN_SUCCESSFULLY = 'Credit Note saved successfully.';
  SAVE_DN_SUCCESSFULLY = 'Debit Note saved successfully.';
  SAVE_RETUR_SUCCESSFULLY = 'Retur saved successfully.';
  PRINT_NP_SUCCESSFULLY = 'NP printed successfully.';
  PRINT_CN_SUCCESSFULLY = 'CN printed successfully.';
  PRINT_DN_SUCCESSFULLY = 'DN printed successfully.';
  PRINT_PAYMENT_RETUR_NOTA = 'Payment Retur Nota printed successfully.';
  GENERATE_PO_SUCCESSFULLY = 'PO generated successfully.';
  GENERATE_SYNC_SUCCESSFULLY = 'Synchronize generated successfully.';
  GENERATE_SYNC_FINISH = 'Synchronize finish.';         
  GENERATE_SYNC_FINISH_WARNING = 'Export failed.';
  IMPORT_SYNC_SUCCESSFULLY = 'Synchronizing is done successfully.';
  IMPORT_SYNC_ERROR = 'Synchronizing is done with error.';
  ACTIVATE_POS_SUCCESSFULLY = 'POS Activated successfully.';
  PRODUCT_NOT_FOUND = 'Product not found.';
  PRINT_DO_FOR_TRADER_SUCCESSFULLY = 'DO For Trader printed successfully.';
  PO_APPROVED_SUCCESSFULLY = 'PO approved successfully';
  PO_CHANGED_SUCCESSFULLY = 'PO changed successfully';
  PO_CANCELLED_SUCCESSFULLY = 'PO canceled successfully';

  // db
  DEBUG_MODE_ON = true;
  DEBUG_MODE_OFF = false;
  
  // micellanious
  CN_RECV_DESCRIPTION = 'CN Receive';
  DN_RECV_DESCRIPTION = 'DN Receive';
  PO_DESCRIPTION_EXPIRED = 'Valid Date was expired';
  PO_DESCRIPTION_RECEIVED = 'Valid Date was received';
  PO_DESCRIPTION_GENERATED = 'PO generated';
  DO_DESCRIPTION_RECEIVED = 'Delivery Order was received';
  TRANSACTION_NUMBER_CANT_BE_DELETED = 'Transaction could not be deleted';
  TRANSACTION_NUMBER_CANT_BE_EDITED = 'Transaction could not be edited';

  // BEGINNING BALANCE
  BEGINNING_BALANCE_MODAL = 200000;

  // loading caption
  USER_MENU_LOADING = 'Please wait. Creating user menu ...';
  USER_LOGIN_LOADING = 'Please wait. Authorizing user ...';
  FORM_LOADING = 'Please wait. Form loading ...';

  // button show message
  BUTTON_CAPTION1 = 'Yes';
  BUTTON_CAPTION2 = 'No';
  BUTTON_CAPTION3 = 'Cancel';
  MESSAGE_CAPTION = 'Head Office - ';  

  // sync
  SYNC_LOCAL_DIR = 'sinkronisasi\sync\';
  SYNC_XMLFILENAME = 'sync.xml';
  REFERENCES_TABLE = 'references';
  IGRA_TABLE = 'igra';
  RECEIVING_TABLE = 'receiving';
  SYNC_SESSION_FILE = '_session.xml';

  //default number
  INVOICE_NO = '/INV/MG/';
  ACCRUAL_NO = '/ACR/MG/';

  //Finance
  AP_PAYMENT_DAY_1 = '3';
  AP_PAYMENT_DAY_2 = '5'; {Note: 1 -> Sunday, 7 --> Saturday}

  //Jurnal
  CONF_JURNAL_ALREADY_POSTED = 'The Jurnal has already posted';
  PROC_REVERSE_JOUNAL = 'Reverse Journal';

  //Message Constant
  STORE_PARAM = 2010;
  GORO_MAIN_MESSAGE = WM_USER + 7251;
  GORO_HO_MAIN_FORM_CHX_COMP_ID = GORO_MAIN_MESSAGE + 1;  
  GORO_HO_MAIN_FORM_CHX_UNIT_ID = GORO_MAIN_MESSAGE + 2;

  TABLE_NODE = 'table';
  RECORD_NODE = 'record';
  TYPE_NODE = 'type';
  SQL_NODE = 'sql';
  ATT_RECORD_NODE = 'no';
  DELIMITER_ASSIGN = '=';
  DELIMITER_COMMA = ',';

  INSERT_TYPE = 'insert';
  UPDATE_TYPE = 'update';
  DELETE_TYPE = 'delete';

  // MESSAGE CONSTANTA
  WM_REFRESH_SERVER_MESSAGE = WM_USER + 1000;
  WM_STORE_MESSAGE = WM_USER + 2000;

  STORE_POS_TRANS_BOTOL = STORE_PARAM + 1;
  STORE_POS_TRANS_VOUCHER = STORE_PARAM + 2;
  STORE_POS_RESET_CASHIER = STORE_PARAM + 3;

  STORE_REFRESH_TRANS_BOTOL = STORE_PARAM + 4;
  STORE_REFRESH_VOUCHER = STORE_PARAM + 5;
  STORE_REFRESH_RESET_CASHIER = STORE_PARAM + 8;

  REFRESH_SERVER_UP = STORE_PARAM + 6;
  REFRESH_SERVER_DOWN = STORE_PARAM + 7;

  // PO
  LEAD_TIME = 7;
  INT_MAX_ROW_PO = 20;

  // LIST MEMBERSHIP
  JENIS_BAYAR_KARTU_BARU = 'BIAYA KARTU BARU';
  JENIS_BAYAR_PERPANJANGAN_KARTU = 'BIAYA PERPANJANGAN KARTU';


  MSG_SUPPLIER = WM_USER + 200;
  SUPLIER_REFRESH_UNIT = MSG_SUPPLIER + 1;

  //Product
  PROD_CODE_LENGTH = 6; //maximum 9 digit ya, integer safe
implementation

end.
