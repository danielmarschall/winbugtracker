object frmBugtracker: TfrmBugtracker
  Left = 0
  Top = 0
  Caption = 'ViaThinkSoft Bugtracker f'#252'r Windows'
  ClientHeight = 498
  ClientWidth = 751
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 249
    Top = 0
    Height = 498
    ExplicitLeft = 0
    ExplicitTop = 136
    ExplicitHeight = 100
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 249
    Height = 498
    Align = alLeft
    TabOrder = 0
    ExplicitLeft = 256
    ExplicitTop = 448
    DesignSize = (
      249
      498)
    object DBGrid1: TDBGrid
      Left = 8
      Top = 35
      Width = 233
      Height = 406
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsBugs
      ReadOnly = True
      TabOrder = 0
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
    object ComboBox1: TComboBox
      Left = 8
      Top = 8
      Width = 233
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = 'Meine offenen Bugs (nach Wichtigkeit)'
      OnChange = ComboBox1Change
      Items.Strings = (
        'Meine offenen Bugs (nach Wichtigkeit)'
        'Alle offenen Bugs (nach Wichtigkeit)'
        'Gel'#246'st ohne Ver'#246'ffentlichung (nach L'#246'sungsdatum)'
        'Gel'#246'st und Ver'#246'ffentlicht (nach Version und L'#246'sungsdatum)'
        'Alle Bugs (nach Er'#246'ffnungsdatum)')
    end
    object DBNavigator2: TDBNavigator
      Left = 11
      Top = 456
      Width = 232
      Height = 25
      DataSource = dsBugs
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 252
    Top = 0
    Width = 499
    Height = 498
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 320
    ExplicitTop = 8
    ExplicitWidth = 441
    DesignSize = (
      499
      498)
    object Label1: TLabel
      Left = 15
      Top = 53
      Width = 50
      Height = 13
      Caption = 'Bearbeiter'
    end
    object Label2: TLabel
      Left = 15
      Top = 149
      Width = 20
      Height = 13
      Caption = 'Titel'
    end
    object Label3: TLabel
      Left = 240
      Top = 53
      Width = 33
      Height = 13
      Caption = 'Erstellt'
    end
    object Label4: TLabel
      Left = 240
      Top = 101
      Width = 29
      Height = 13
      Caption = 'Gefixt'
    end
    object Label5: TLabel
      Left = 15
      Top = 101
      Width = 28
      Height = 13
      Caption = 'Modul'
    end
    object Label6: TLabel
      Left = 240
      Top = 149
      Width = 119
      Height = 13
      Caption = 'Ver'#246'ffentlicht als Version'
    end
    object DBNavigator1: TDBNavigator
      Left = 15
      Top = 16
      Width = 224
      Height = 25
      DataSource = dsBugs
      VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel]
      TabOrder = 0
    end
    object DBRichEdit1: TDBRichEdit
      Left = 15
      Top = 248
      Width = 471
      Height = 233
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataField = 'beschreibung'
      DataSource = dsBugs
      TabOrder = 9
    end
    object DBEdit1: TDBEdit
      Left = 15
      Top = 168
      Width = 186
      Height = 21
      DataField = 'titel'
      DataSource = dsBugs
      TabOrder = 5
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 15
      Top = 72
      Width = 186
      Height = 21
      DataField = 'bearbeiter'
      DataSource = dsBugs
      KeyField = 'id'
      ListField = 'name'
      ListSource = dsMitarbeiter
      NullValueKey = 46
      TabOrder = 1
    end
    object DBEdit2: TDBEdit
      Left = 240
      Top = 72
      Width = 155
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'erstellt'
      DataSource = dsBugs
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit3: TDBEdit
      Left = 240
      Top = 120
      Width = 155
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'fixdatum'
      DataSource = dsBugs
      ReadOnly = True
      TabOrder = 4
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 15
      Top = 120
      Width = 186
      Height = 21
      DataField = 'modul'
      DataSource = dsBugs
      KeyField = 'id'
      ListField = 'modul'
      ListSource = dsModule
      NullValueKey = 46
      TabOrder = 3
    end
    object DBLookupComboBox3: TDBLookupComboBox
      Left = 240
      Top = 168
      Width = 155
      Height = 21
      DataField = 'version_release'
      DataSource = dsBugs
      KeyField = 'id'
      ListField = 'version'
      ListSource = dsVersionen
      TabOrder = 6
    end
    object TrackBar1: TTrackBar
      Left = 245
      Top = 8
      Width = 164
      Height = 45
      Position = 5
      TabOrder = 10
      OnChange = TrackBar1Change
    end
    object btnFixedToggle: TButton
      Left = 401
      Top = 118
      Width = 72
      Height = 25
      Caption = 'Umschalten'
      TabOrder = 8
      OnClick = btnFixedToggleClick
    end
    object btnBearbeitungsnotiz: TButton
      Left = 16
      Top = 208
      Width = 185
      Height = 25
      Caption = 'Bearbeitungsnotiz hinzuf'#252'gen'
      TabOrder = 7
    end
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Data Source=MySQL' +
      ' RAS;Initial Catalog=bugtracker'
    LoginPrompt = False
    Left = 104
    Top = 344
  end
  object dsBugs: TDataSource
    DataSet = qryBugs
    Left = 168
    Top = 312
  end
  object tblMitarbeiter: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'mitarbeiter'
    Left = 208
    Top = 344
  end
  object dsMitarbeiter: TDataSource
    DataSet = tblMitarbeiter
    Left = 208
    Top = 312
  end
  object MainMenu1: TMainMenu
    Left = 88
    Top = 216
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
    object Projektwechseln1: TMenuItem
      Caption = 'Projekt wechseln'
      OnClick = Projektwechseln1Click
    end
    object Hilfe1: TMenuItem
      Caption = 'Hilfe'
      object ber1: TMenuItem
        Caption = #220'ber'
        OnClick = ber1Click
      end
    end
  end
  object XPManifest1: TXPManifest
    Left = 48
    Top = 216
  end
  object qryBugs: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterInsert = qryBugsAfterInsert
    AfterScroll = qryBugsAfterScroll
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM bugs order by wichtigkeit')
    Left = 168
    Top = 344
    object qryBugsid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object qryBugstitel: TStringField
      FieldName = 'titel'
      Size = 255
    end
    object qryBugsbeschreibung: TMemoField
      FieldName = 'beschreibung'
      BlobType = ftMemo
    end
    object qryBugserstellt: TDateTimeField
      FieldName = 'erstellt'
    end
    object qryBugswichtigkeit: TIntegerField
      FieldName = 'wichtigkeit'
    end
    object qryBugsbearbeiter: TIntegerField
      FieldName = 'bearbeiter'
    end
    object qryBugsfixdatum: TDateTimeField
      FieldName = 'fixdatum'
    end
    object qryBugsversion_release: TIntegerField
      FieldName = 'version_release'
      OnValidate = qryBugsversion_releaseValidate
    end
    object qryBugsmodul: TIntegerField
      FieldName = 'modul'
    end
    object qryBugsprojekt: TIntegerField
      FieldName = 'projekt'
    end
  end
  object tblVersionen: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'versionen'
    Left = 240
    Top = 344
  end
  object dsVersionen: TDataSource
    DataSet = tblVersionen
    Left = 240
    Top = 312
  end
  object tblProjekte: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'projekte'
    Left = 272
    Top = 344
  end
  object dsProjekte: TDataSource
    DataSet = tblProjekte
    Left = 272
    Top = 312
  end
  object tblModule: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'module'
    Left = 304
    Top = 344
  end
  object dsModule: TDataSource
    DataSet = tblModule
    Left = 304
    Top = 312
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 128
    Top = 216
  end
end