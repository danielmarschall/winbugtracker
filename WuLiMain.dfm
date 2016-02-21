object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'ViaThinkSoft Bugtracker f'#252'r Windows'
  ClientHeight = 440
  ClientWidth = 691
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 247
    Top = 53
    Width = 50
    Height = 13
    Caption = 'Bearbeiter'
  end
  object Label2: TLabel
    Left = 247
    Top = 149
    Width = 20
    Height = 13
    Caption = 'Titel'
  end
  object Label3: TLabel
    Left = 472
    Top = 53
    Width = 33
    Height = 13
    Caption = 'Erstellt'
  end
  object Label4: TLabel
    Left = 472
    Top = 101
    Width = 29
    Height = 13
    Caption = 'Gefixt'
  end
  object Label5: TLabel
    Left = 247
    Top = 101
    Width = 28
    Height = 13
    Caption = 'Modul'
  end
  object Label6: TLabel
    Left = 472
    Top = 149
    Width = 119
    Height = 13
    Caption = 'Ver'#246'ffentlicht als Version'
  end
  object DBNavigator1: TDBNavigator
    Left = 247
    Top = 16
    Width = 224
    Height = 25
    DataSource = dsBugs
    VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel]
    TabOrder = 0
  end
  object DBRichEdit1: TDBRichEdit
    Left = 247
    Top = 208
    Width = 402
    Height = 209
    DataField = 'beschreibung'
    DataSource = dsBugs
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 47
    Width = 233
    Height = 370
    DataSource = dsBugs
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'titel'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'wichtigkeit'
        Width = 36
        Visible = True
      end>
  end
  object DBEdit1: TDBEdit
    Left = 247
    Top = 168
    Width = 186
    Height = 21
    DataField = 'titel'
    DataSource = dsBugs
    TabOrder = 3
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 247
    Top = 72
    Width = 186
    Height = 21
    DataField = 'bearbeiter'
    DataSource = dsBugs
    KeyField = 'id'
    ListField = 'name'
    ListSource = dsMitarbeiter
    TabOrder = 4
  end
  object DBEdit2: TDBEdit
    Left = 472
    Top = 72
    Width = 121
    Height = 21
    Color = clBtnFace
    DataField = 'erstellt'
    DataSource = dsBugs
    ReadOnly = True
    TabOrder = 5
  end
  object DBEdit3: TDBEdit
    Left = 472
    Top = 120
    Width = 121
    Height = 21
    Color = clBtnFace
    DataField = 'fixdatum'
    DataSource = dsBugs
    ReadOnly = True
    TabOrder = 6
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 247
    Top = 120
    Width = 186
    Height = 21
    DataField = 'modul'
    DataSource = dsBugs
    KeyField = 'id'
    ListField = 'modul'
    ListSource = dsModule
    TabOrder = 7
  end
  object DBLookupComboBox3: TDBLookupComboBox
    Left = 472
    Top = 168
    Width = 121
    Height = 21
    DataField = 'version_release'
    DataSource = dsBugs
    KeyField = 'id'
    ListField = 'version'
    ListSource = dsVersionen
    TabOrder = 8
  end
  object TrackBar1: TTrackBar
    Left = 477
    Top = 8
    Width = 150
    Height = 45
    Position = 5
    TabOrder = 9
    OnChange = TrackBar1Change
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 8
    Width = 233
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 10
    Text = 'Meine offene Bugs (nach Wichtigkeit)'
    Items.Strings = (
      'Meine offene Bugs (nach Wichtigkeit)'
      'Alle ofene Bugs (nach Wichtigkeit)'
      'Gel'#246'st ohne Ver'#246'ffentlichung (nach L'#246'sungsdatum)'
      'Gel'#246'st und Ver'#246'ffentlicht (nach Version und L'#246'sungsdatum)')
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Data Source=MySQL' +
      ' RAS;Initial Catalog=bugtracker'
    LoginPrompt = False
    Left = 336
    Top = 344
  end
  object dsBugs: TDataSource
    DataSet = qryBugs
    Left = 400
    Top = 312
  end
  object tblMitarbeiter: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'mitarbeiter'
    Left = 440
    Top = 344
  end
  object dsMitarbeiter: TDataSource
    DataSet = tblMitarbeiter
    Left = 440
    Top = 312
  end
  object MainMenu1: TMainMenu
    Left = 640
    Top = 48
    object Stammdaten1: TMenuItem
      Caption = 'Stammdaten'
      object Mitarbeiter1: TMenuItem
        Caption = 'Mitarbeiter'
        OnClick = Mitarbeiter1Click
      end
      object Projekte1: TMenuItem
        Caption = 'Projekte'
        OnClick = Projekte1Click
      end
      object Module1: TMenuItem
        Caption = 'Module'
        OnClick = Module1Click
      end
      object Versionen1: TMenuItem
        Caption = 'Versionen'
        OnClick = Versionen1Click
      end
    end
  end
  object XPManifest1: TXPManifest
    Left = 640
    Top = 8
  end
  object qryBugs: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterScroll = qryBugsAfterScroll
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM bugs order by wichtigkeit')
    Left = 400
    Top = 344
  end
  object tblVersionen: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'versionen'
    Left = 472
    Top = 344
  end
  object dsVersionen: TDataSource
    DataSet = tblVersionen
    Left = 472
    Top = 312
  end
  object tblProjekte: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'projekte'
    Left = 504
    Top = 344
  end
  object dsProjekte: TDataSource
    DataSet = tblProjekte
    Left = 504
    Top = 312
  end
  object tblModule: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'module'
    Left = 536
    Top = 344
  end
  object dsModule: TDataSource
    DataSet = tblModule
    Left = 536
    Top = 312
  end
end
