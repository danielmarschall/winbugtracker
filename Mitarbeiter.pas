unit Mitarbeiter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids;

type
  TfrmMitarbeiter = class(TForm)
    DBGrid1: TDBGrid;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frmMitarbeiter: TfrmMitarbeiter;

implementation

{$R *.dfm}

uses
  WuLiMain;

end.
