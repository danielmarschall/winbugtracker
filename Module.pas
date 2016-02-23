unit Module;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, ExtCtrls, DBCtrls;

type
  TfrmModule = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frmModule: TfrmModule;

implementation

{$R *.dfm}

uses
  BugtrackerMain;

end.
