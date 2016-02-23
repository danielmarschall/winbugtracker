unit BugtrackerMain;

(*
 * TODO:
 * - Spezielle Filter
 *   ... Auflisten nach Modul
 *   ... Anzeigen der Agenda
 * - verbinden mit ticketsystem von HS
 * - rtf controls?
 * - Neue Felder:
 *   ... Erfasser
 *   ... Agenda
 *   ... Status = Offen, gefixt, Abgelehnt, Veröffentlicht
 *   ... RTF Feld als BIGTEXT definieren
 * - Neue Aufteilung der States
 *   ... Open, Fixed, Published, Wontfix/Rejected, Planned(Agenda)
 *
 * NOT INCLUDED:
 * - duplicate of
 *
 * FUTURE:
 * - HS Info integration
 *)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WideStrings, DB, SqlExpr, StdCtrls, ExtCtrls, DBCtrls,
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
    dsVersionen: TDataSource;
    tblProjekte: TADOTable;
    dsProjekte: TDataSource;
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
    qryVersionen: TADOQuery;
    qryModule: TADOQuery;
    LblAngemeldet: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    qryBugserfasser: TIntegerField;
    qryBugsversion_agenda: TIntegerField;
    Label9: TLabel;
    cbxErfasser: TDBLookupComboBox;
    Label10: TLabel;
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
    procedure qryVersionenAfterInsert(DataSet: TDataSet);
    procedure qryModuleAfterInsert(DataSet: TDataSet);
    procedure btnBearbeitungsnotizClick(Sender: TObject);
    procedure qryBugsBeforeCancel(DataSet: TDataSet);
    procedure DBNavigator1BeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  public
    eingeloggtMitarbeiter: integer;
    eingeloggtMitarbeiterName: string;
    aktuellesProjekt: integer;
    aktuellesProjektName: string;
    procedure NeuFiltern;
    procedure NotizHinzufuegen(color: TColor; bez: string);
  end;

var
  frmBugtracker: TfrmBugtracker;

implementation

uses Mitarbeiter, Module, Versionen, Projekte, Login, About, inifiles;

{$R *.dfm}

procedure TfrmBugtracker.qryBugsAfterInsert(DataSet: TDataSet);
begin
  // Standardwerte für einen neuen Bug
  qryBugs.FieldByName('wichtigkeit').AsInteger := 5; // Mitte
  qryBugs.FieldByName('erstellt').AsDateTime := Now;
  qryBugs.FieldByName('erfasser').AsInteger := eingeloggtMitarbeiter;
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

procedure TfrmBugtracker.qryBugsBeforeCancel(DataSet: TDataSet);
var
  abfrage: Integer;
begin
  // Tag 1 = Es wurde der "Abbrechen"-Knopf im DBNavigator gedrückt, also wollen wir keine unnötige Bestätigung
  // Alles andere = Irgendwas anderes (z.B. Scrolling oder versehentlich versucht das Fenster zu schließen)
  if qryBugs.Tag = 1 then exit;

  abfrage := MessageDlg('Speichern?', mtConfirmation, mbYesNoCancel, 0);

  if (abfrage = IDNo) or (abfrage = IDYes) or (abfrage = IDOK) then
  begin
     if abfrage = IDYes then
     begin
       if (qryBugs.state in [dsEdit, dsInsert]) then qryBugs.Post;
     end;
     if abfrage = IDNo then
     begin
       // Wir befinden uns bereits in qryBugs.Cancel, daher auskommentiert.
       // if (qryBugs.state in [dsEdit, dsInsert]) then qryBugs.Cancel;
     end;
  end
  else raise EAbort.Create('Abbruch durch Benutzer'); // Cancel geklickt
end;

procedure TfrmBugtracker.qryBugsversion_releaseValidate(Sender: TField);
begin
  if qryBugs.FieldByName('fixdatum').IsNull then
  begin
    raise Exception.Create('Vor einer Veröffentlichung muss der Bugfix erst als gefixt markiert werden.');
  end;
end;

procedure TfrmBugtracker.qryModuleAfterInsert(DataSet: TDataSet);
begin
  // Standardwerte für ein neues Modul
  qryModule.FieldByName('projekt').AsInteger := aktuellesProjekt;
end;

procedure TfrmBugtracker.qryVersionenAfterInsert(DataSet: TDataSet);
begin
  // Standardwerte für eine neue Version
  qryVersionen.FieldByName('projekt').AsInteger := aktuellesProjekt;
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

procedure TfrmBugtracker.btnBearbeitungsnotizClick(Sender: TObject);
begin
  NotizHinzufuegen(clRed, 'Notiz');
end;

procedure TfrmBugtracker.btnFixedToggleClick(Sender: TObject);
begin
  if not (qryBugs.State in [dsEdit, dsInsert]) then qryBugs.Edit;
  if qryBugs.FieldByName('fixdatum').IsNull then
  begin
    qryBugs.FieldByName('fixdatum').AsDateTime := Now;
    NotizHinzufuegen(clGreen, 'Gefixt');
  end
  else
  begin
    qryBugs.FieldByName('fixdatum').Clear;
    NotizHinzufuegen(clBlue, 'Neu eröffnet');
  end;
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
        // Gelöst ohne Veröffentlichung (nach Lösungsdatum)
        qryBugs.SQL.Text := 'SELECT * FROM bugs WHERE projekt = '+IntToStr(aktuellesProjekt)+' AND fixdatum IS NOT NULL ORDER BY fixdatum DESC';
      end;
    3:
      begin
        // Gelöst und Veröffentlicht (nach Version und Lösungsdatum)
        qryBugs.SQL.Text := 'SELECT * FROM bugs WHERE projekt = '+IntToStr(aktuellesProjekt)+' AND fixdatum IS NOT NULL ORDER BY version_release DESC, fixdatum DESC';
      end;
    4:
      begin
        // Alle Bugs (nach Eröffnungsdatum)
        qryBugs.SQL.Text := 'SELECT * FROM bugs WHERE projekt = '+IntToStr(aktuellesProjekt)+' ORDER BY erstellt DESC';
      end;
  end;
  qryBugs.Active := true;
end;

procedure TfrmBugtracker.DBNavigator1BeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbCancel then
  begin
    if qryBugs.state  in [dsEdit,dsInsert] then
    begin
      // Tag=1 soll verhindern, dass nicht gefragt wird, ob man Speichern möchte.
      // Ansonsten würde diese Meldung kommen, denn ".Cancel" wird automatisch
      // bei Ereignissen wie z.B. dem Scrolling aufgerufen (noch bevor
      // OnBeforeScroll aufgerufen wird), bei dem man einen MBOnCloseQuery wünscht.
      qryBugs.Tag := 1;
      qryBugs.Cancel;
      qryBugs.Tag := 0;
    end;
  end;
end;

procedure TfrmBugtracker.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  qryBugs.Cancel;
end;

procedure TfrmBugtracker.FormCreate(Sender: TObject);
var
  ini: TMemIniFile;
begin
  ini := TMemIniFile.Create('bugtracker.ini');
  try
    ADOConnection1.Connected := false;
    ADOConnection1.ConnectionString := ini.ReadString('Database', 'ConnectionString', '');
  finally
    ini.Free;
  end;

  ADOConnection1.Connected := true;
  qryBugs.Active := true;
  tblMitarbeiter.Active := true;
  qryVersionen.Active := true;
  tblProjekte.Active := true;
  qryModule.Active := true;
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

  qryModule.SQL.Text := 'SELECT * FROM module WHERE projekt = ' + IntToStr(aktuellesProjekt);
  qryModule.Active := true;

  qryVersionen.SQL.Text := 'SELECT * FROM versionen WHERE projekt = ' + IntToStr(aktuellesProjekt);
  qryVersionen.Active := true;
end;

procedure TfrmBugtracker.NotizHinzufuegen(color: TColor; bez: string);
var
  leerzeilen: integer;
  umbruch: string;
  prefix: string;
begin
  if not (qryBugs.State in [dsEdit, dsInsert]) then qryBugs.Edit;

  // Endet der Text mit zwei Zeilenabständen? Wenn nein, dann einfügen.
  leerzeilen := 0;
  if Copy(DBRichEdit1.Text, 1+Length(DBRichEdit1.Text)-2, 2) = #13#10 then Inc(leerzeilen); // letzte Zeile
  if Copy(DBRichEdit1.Text, 1+Length(DBRichEdit1.Text)-4, 2) = #13#10 then Inc(leerzeilen); // Vorletzte Zeile
  case leerzeilen of
    0: umbruch := #13#10#13#10;
    1: umbruch := #13#10;
    2: umbruch := '';
  end;

  DBRichEdit1.SelStart := DBRichEdit1.GetTextLen;
  DBRichEdit1.SelText := umbruch;

  DBRichEdit1.SelAttributes.Size := 13;
  DBRichEdit1.SelAttributes.Color := color;
  DBRichEdit1.SelAttributes.Style := [fsUnderline];
  if Trim(bez) <> '' then
    prefix := Trim(bez) + ' - '
  else
    prefix := '';
  DBRichEdit1.SelText := prefix + eingeloggtMitarbeiterName + ' ' + FormatDateTime('dd.mm.yyyy hh:nn', Now); // DateTimeToStr(Now);

  DBRichEdit1.SelAttributes.Size := 10;
  DBRichEdit1.SelAttributes.Color := clWindowText;
  DBRichEdit1.SelAttributes.Style := [];
  DBRichEdit1.SelText := #13#10 {+ '<Hier Text eingeben>'};

  // Ans Ende scrollen
  DBRichEdit1.SetFocus;
  DBRichEdit1.SelStart := DBRichEdit1.GetTextLen;
  DBRichEdit1.Perform(EM_SCROLLCARET, 0, 0);
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
