unit WuLiMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, WideStrings, DB, SqlExpr, StdCtrls, ExtCtrls, DBCtrls,
  ADODB, ComCtrls, Grids, DBGrids, Mask, Menus, XPMan;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    dsBugs: TDataSource;
    DBNavigator1: TDBNavigator;
    DBRichEdit1: TDBRichEdit;
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    tblMitarbeiter: TADOTable;
    dsMitarbeiter: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    MainMenu1: TMainMenu;
    Stammdaten1: TMenuItem;
    Mitarbeiter1: TMenuItem;
    Projekte1: TMenuItem;
    Module1: TMenuItem;
    XPManifest1: TXPManifest;
    qryBugs: TADOQuery;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    tblVersionen: TADOTable;
    dsVersionen: TDataSource;
    tblProjekte: TADOTable;
    dsProjekte: TDataSource;
    tblModule: TADOTable;
    dsModule: TDataSource;
    Versionen1: TMenuItem;
    DBLookupComboBox2: TDBLookupComboBox;
    Label5: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    Label6: TLabel;
    TrackBar1: TTrackBar;
    ComboBox1: TComboBox;
    procedure Mitarbeiter1Click(Sender: TObject);
    procedure DateTimePicker1CloseUp(Sender: TObject);
    procedure qryBugsAfterScroll(DataSet: TDataSet);
    procedure Module1Click(Sender: TObject);
    procedure Projekte1Click(Sender: TObject);
    procedure Versionen1Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

uses Mitarbeiter, Module, Versionen, Projekte;

{$R *.dfm}

procedure TForm1.qryBugsAfterScroll(DataSet: TDataSet);
begin
//  DateTimePicker1.DateTime := qryBugs.FieldByName('fixdatum').AsDateTime;
//  TrackBar1.Position := qryBugs.FieldByName('wichtigkeit').AsInteger;
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  if not (qryBugs.State in [dsEdit, dsInsert]) then qryBugs.Edit;
  qryBugs.FieldByName('wichtigkeit').AsInteger := TrackBar1.Position;
end;

procedure TForm1.Versionen1Click(Sender: TObject);
begin
  frmVersionen.ShowModal;
end;

procedure TForm1.DateTimePicker1CloseUp(Sender: TObject);
begin
  (*
  LockWindowUpdate(DBGrid1.Handle);
  if not (qryBugs.State in [dsEdit, dsInsert]) then qryBugs.Edit;
  qryBugs.FieldByName('fixdatum').AsDateTime := DateTimePicker1.DateTime;
  LockWindowUpdate(0);
  *)
end;

procedure TForm1.Mitarbeiter1Click(Sender: TObject);
begin
  frmMitarbeiter.ShowModal;
end;

procedure TForm1.Module1Click(Sender: TObject);
begin
  frmModule.ShowModal;
end;

procedure TForm1.Projekte1Click(Sender: TObject);
begin
  frmProjekte.ShowModal;
end;

end.
