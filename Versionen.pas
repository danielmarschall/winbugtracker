unit Versionen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids;

type
  TfrmVersionen = class(TForm)
    DBGrid1: TDBGrid;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frmVersionen: TfrmVersionen;

implementation

{$R *.dfm}

uses
  BugtrackerMain;

end.
