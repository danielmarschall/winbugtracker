unit Projekte;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids;

type
  TfrmProjekte = class(TForm)
    DBGrid1: TDBGrid;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frmProjekte: TfrmProjekte;

implementation

{$R *.dfm}

uses
  BugtrackerMain;

end.
