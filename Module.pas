unit Module;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids;

type
  TfrmModule = class(TForm)
    DBGrid1: TDBGrid;
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
  WuLiMain;

end.
