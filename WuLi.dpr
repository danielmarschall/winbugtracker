program WuLi;

uses
  Forms,
  WuLiMain in 'WuLiMain.pas' {Form1},
  Mitarbeiter in 'Mitarbeiter.pas' {frmMitarbeiter},
  Versionen in 'Versionen.pas' {frmVersionen},
  Module in 'Module.pas' {frmModule},
  Projekte in 'Projekte.pas' {frmProdukte};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmMitarbeiter, frmMitarbeiter);
  Application.CreateForm(TfrmVersionen, frmVersionen);
  Application.CreateForm(TfrmModule, frmModule);
  Application.CreateForm(TfrmProdukte, frmProdukte);
  Application.Run;
end.
