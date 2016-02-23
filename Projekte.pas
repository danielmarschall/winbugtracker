unit Projekte;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, ExtCtrls, DBCtrls;

type
  TfrmProjekte = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
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
