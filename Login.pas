unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, DB, DBClient;

type
  TfrmLogin = class(TForm)
    Label1: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    cbxMitarbeiter: TDBLookupComboBox;
    cbxProjekt: TDBLookupComboBox;
    procedure Label2Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses
  WuLiMain, Mitarbeiter, Projekte;

{$R *.dfm}

procedure TfrmLogin.Button1Click(Sender: TObject);
begin
  if VarIsNull(cbxMitarbeiter.KeyValue) then
  begin
    ShowMessage('Bitte Mitarbeiter ausw‰hlen.');
    cbxMitarbeiter.SetFocus;
    Exit;
  end;
  if VarIsNull(cbxProjekt.KeyValue) then
  begin
    ShowMessage('Bitte Projekt ausw‰hlen.');
    cbxProjekt.SetFocus;
    Exit;
  end;
  frmBugtracker.eingeloggtMitarbeiter := cbxMitarbeiter.KeyValue;
  frmBugtracker.aktuellesProjekt := cbxProjekt.KeyValue;
  frmBugtracker.NeuFiltern;
  ModalResult := mrOk; // Das schlieﬂt den Dialog
end;

procedure TfrmLogin.Label2Click(Sender: TObject);
begin
  frmMitarbeiter.ShowModal;
end;

procedure TfrmLogin.Label3Click(Sender: TObject);
begin
  frmProjekte.ShowModal;
end;

end.
