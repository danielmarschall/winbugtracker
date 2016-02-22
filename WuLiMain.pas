unit WuLiMain;

(*
 * TODO:
 * - fertigstellen
 *   ... multi user/projekt testen
 *   ... bearbeitungsnotiz-button (rtf-farben usw)
 *   ...
 * - abfragen ob speichern wenn fenster geschlossen wird
 * - filtern nach modul
 * - verbinden mit ticketsystem von HS
 * - rtf controls?
 *)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBXpress, WideStrings, DB, SqlExpr, StdCtrls, ExtCtrls, DBCtrls,
  ADODB, ComCtrls, Grids, DBGrids, Mask, Menus, XPMan;

type
  TfrmBugtracker = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    ComboBox1: TComboBox;
    DBNavigator2: TDBNavigator;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBNavigator1: TDBNavigator;
    DBRichEdit1: TDBRichEdit;
    DBEdit1: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    TrackBar1: TTrackBar;
    ADOConnection1: TADOConnection;
    dsBugs: TDataSource;
    tblMitarbeiter: TADOTable;
    dsMitarbeiter: TDataSource;
    MainMenu1: TMainMenu;
    Stammdaten1: TMenuItem;
    Mitarbeiter1: TMenuItem;
    Projekte1: TMenuItem;
    Module1: TMenuItem;
    Versionen1: TMenuItem;
    Projektwechseln1: TMenuItem;
    XPManifest1: TXPManifest;
    qryBugs: TADOQuery;
    tblVersionen: TADOTable;
    dsVersionen: TDataSource;
    tblProjekte: TADOTable;
    dsProjekte: TDataSource;
    tblModule: TADOTable;
    dsModule: TDataSource;
    Timer1: TTimer;
    Splitter1: TSplitter;
    Hilfe1: TMenuItem;
    ber1: TMenuItem;
    btnFixedToggle: TButton;
    btnBearbeitungsnotiz: TButton;
    qryBugsid: TAutoIncField;
    qryBugstitel: TStringField;
    qryBugsbeschreibung: TMemoField;
    qryBugserstellt: TDateTimeField;
    qryBugswichtigkeit: TIntegerField;
    qryBugsbearbeiter: TIntegerField;
    qryBugsfixdatum: TDateTimeField;
    qryBugsversion_release: TIntegerField;
    qryBugsmodul: TIntegerField;
    qryBugsprojekt: TIntegerField;
    procedure Mitarbeiter1Click(Sender: TObject);
    procedure qryBugsAfterScroll(DataSet: TDataSet);
    procedure Module1Click(Sender: TObject);
    procedure Projekte1Click(Sender: TObject);
    procedure Versionen1Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Projektwechseln1Click(Sender: TObject);
    procedure qryBugsAfterInsert(DataSet: TDataSet);
    procedure ber1Click(Sender: TObject);
    procedure btnFixedToggleClick(Sender: TObject);
    procedure qryBugsversion_releaseValidate(Sender: TField);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    eingeloggtMitarbeiter: integer;
    aktuellesProjekt: integer;
    procedure NeuFiltern;
  end;

var
  frmBugtracker: TfrmBugtracker;

implementation

uses Mitarbeiter, Module, Versionen, Projekte, Login, About, inifiles;

{$R *.dfm}

procedure TfrmBugtracker.qryBugsAfterInsert(DataSet: TDataSet);
begin
  // Standardwerte f�r einen neuen Bug
  qryBugs.FieldByName('wichtigkeit').AsInteger := 5;
  // qryBugs.FieldByName('bearbeiter').AsInteger := eingeloggtMitarbeiter;
  qryBugs.FieldByName('projekt').AsInteger := aktuellesProjekt;
end;

procedure TfrmBugtracker.qryBugsAfterScroll(DataSet: TDataSet);
var
  bakEvent: TNotifyEvent;
begin
  bakEvent := TrackBar1.OnChange;
  TrackBar1.OnChange := nil;
  try
    TrackBar1.Position := qryBugs.FieldByName('wichtigkeit').AsInteger;
  finally
    TrackBar1.OnChange := bakEvent;
  end;
end;

procedure TfrmBugtracker.qryBugsversion_releaseValidate(Sender: TField);
begin
  if qryBugs.FieldByName('fixdatum').IsNull then
  begin
    raise Exception.Create('Vor einer Ver�ffentlichung muss der Bugfix erst als gefixt markiert werden.');
  end;
end;

procedure TfrmBugtracker.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  if frmLogin.ShowModal = mrCancel then Close;
end;

procedure TfrmBugtracker.TrackBar1Change(Sender: TObject);
begin
  if not (qryBugs.State in [dsEdit, dsInsert]) then qryBugs.Edit;
  qryBugs.FieldByName('wichtigkeit').AsInteger := TrackBar1.Position;
end;

procedure TfrmBugtracker.Versionen1Click(Sender: TObject);
begin
  frmVersionen.ShowModal;
end;

procedure TfrmBugtracker.ber1Click(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TfrmBugtracker.btnFixedToggleClick(Sender: TObject);
begin
  if not (qryBugs.State in [dsEdit, dsInsert]) then qryBugs.Edit;
  if qryBugs.FieldByName('fixdatum').IsNull then
    qryBugs.FieldByName('fixdatum').AsDateTime := Now
  else
    qryBugs.FieldByName('fixdatum').Clear;
end;

procedure TfrmBugtracker.ComboBox1Change(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
    0:
      begin
        // Meine offenen Bugs (nach Wichtigkeit)
        qryBugs.SQL.Text := 'SELECT * FROM bugs WHERE projekt = '+IntToStr(aktuellesProjekt)+' AND fixdatum IS NULL AND bearbeiter = '+IntToStr(eingeloggtMitarbeiter)+' ORDER BY wichtigkeit DESC';
      end;
    1:
      begin
        // Alle offenen Bugs (nach Wichtigkeit)
        qryBugs.SQL.Text := 'SELECT * FROM bugs WHERE projekt = '+IntToStr(aktuellesProjekt)+' AND fixdatum IS NULL ORDER BY wichtigkeit DESC';
      end;
    2:
      begin
        // Gel�st ohne Ver�ffentlichung (nach L�sungsdatum)
        qryBugs.SQL.Text := 'SELECT * FROM bugs WHERE projekt = '+IntToStr(aktuellesProjekt)+' AND fixdatum IS NOT NULL ORDER BY fixdatum DESC';
      end;
    3:
      begin
        // Gel�st und Ver�ffentlicht (nach Version und L�sungsdatum)
        qryBugs.SQL.Text := 'SELECT * FROM bugs WHERE projekt = '+IntToStr(aktuellesProjekt)+' AND fixdatum IS NOT NULL ORDER BY version_release DESC, fixdatum DESC';
      end;
    4:
      begin
        // Alle Bugs (nach Er�ffnungsdatum)
        qryBugs.SQL.Text := 'SELECT * FROM bugs WHERE projekt = '+IntToStr(aktuellesProjekt)+' ORDER BY erstellt DESC';
      end;
  end;
  qryBugs.Active := true;
end;

procedure TfrmBugtracker.FormCreate(Sender: TObject);
var
  ini: TMemIniFile;
begin
  ini := TMemIniFile.Create('bugtracker.ini');
  try
    ADOConnection1.ConnectionString := ini.ReadString('Database', 'ConnectionString', '');
  finally
    ini.Free;
  end;

  ADOConnection1.Connected := true;
  qryBugs.Active := true;
  tblMitarbeiter.Active := true;
  tblVersionen.Active := true;
  tblProjekte.Active := true;
  tblModule.Active := true;
end;

procedure TfrmBugtracker.Mitarbeiter1Click(Sender: TObject);
begin
  frmMitarbeiter.ShowModal;
end;

procedure TfrmBugtracker.Module1Click(Sender: TObject);
begin
  frmModule.ShowModal;
end;

procedure TfrmBugtracker.NeuFiltern;
begin
  ComboBox1Change(ComboBox1);
end;

procedure TfrmBugtracker.Projekte1Click(Sender: TObject);
begin
  frmProjekte.ShowModal;
end;

procedure TfrmBugtracker.Projektwechseln1Click(Sender: TObject);
begin
  frmLogin.ShowModal;
end;

end.