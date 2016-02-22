program Bugtracker;

uses
  Forms,
  BugtrackerMain in 'BugtrackerMain.pas' {frmBugtracker},
  Mitarbeiter in 'Mitarbeiter.pas' {frmMitarbeiter},
  Versionen in 'Versionen.pas' {frmVersionen},
  Module in 'Module.pas' {frmModule},
  Projekte in 'Projekte.pas' {frmProjekte},
  Login in 'Login.pas' {frmLogin},
  About in 'About.pas' {AboutBox};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmBugtracker, frmBugtracker);
  Application.CreateForm(TfrmMitarbeiter, frmMitarbeiter);
  Application.CreateForm(TfrmVersionen, frmVersionen);
  Application.CreateForm(TfrmModule, frmModule);
  Application.CreateForm(TfrmProjekte, frmProjekte);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
