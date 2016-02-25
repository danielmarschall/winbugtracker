object frmBugtracker: TfrmBugtracker
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'ViaThinkSoft Bugtracker f'#252'r Windows'
  ClientHeight = 596
  ClientWidth = 763
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 249
    Top = 0
    Height = 596
    ExplicitLeft = 0
    ExplicitTop = 136
    ExplicitHeight = 100
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 249
    Height = 596
    Align = alLeft
    TabOrder = 0
    DesignSize = (
      249
      596)
    object DBGrid1: TDBGrid
      Left = 8
      Top = 35
      Width = 233
      Height = 504
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
      TabOrder = 1
      OnChange = ComboBox1Change
      Items.Strings = (
        'Meine offenen Aufgaben (nach Wichtigkeit)'
        'Alle offenen Aufgaben (nach Wichtigkeit)'
        'Gel'#246'st ohne Ver'#246'ffentlichung (nach L'#246'sungsdatum)'
        'Gel'#246'st und Ver'#246'ffentlicht (nach Version und L'#246'sungsdatum)'
        'Von mir erfasste Aufgaben (nach Erfassungsdatum)'
        'Alle Aufgaben (nach Er'#246'ffnungsdatum)')
    end
    object DBNavigator2: TDBNavigator
      Left = 11
      Top = 554
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
    Width = 511
    Height = 596
    Align = alClient
    TabOrder = 1
    DesignSize = (
      511
      596)
    object Label1: TLabel
      Left = 17
      Top = 101
      Width = 50
      Height = 13
      Caption = 'Bearbeiter'
    end
    object Label2: TLabel
      Left = 17
      Top = 195
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
      Width = 31
      Height = 13
      BiDiMode = bdLeftToRight
      Caption = 'Status'
      ParentBiDiMode = False
    end
    object Label5: TLabel
      Left = 17
      Top = 147
      Width = 28
      Height = 13
      Caption = 'Modul'
    end
    object Label6: TLabel
      Left = 240
      Top = 216
      Width = 119
      Height = 13
      Caption = 'Ver'#246'ffentlicht als Version'
    end
    object LblAngemeldet: TLabel
      Left = 3
      Top = 0
      Width = 83
      Height = 13
      Caption = 'Nicht angemeldet'
    end
    object Label7: TLabel
      Left = 250
      Top = 0
      Width = 46
      Height = 13
      Caption = 'Unwichtig'
    end
    object Label8: TLabel
      Left = 366
      Top = 0
      Width = 34
      Height = 13
      Alignment = taRightJustify
      Caption = 'Kritisch'
    end
    object Label9: TLabel
      Left = 240
      Top = 170
      Width = 92
      Height = 13
      Caption = 'Geplant f'#252'r Version'
    end
    object Label10: TLabel
      Left = 17
      Top = 53
      Width = 40
      Height = 13
      Caption = 'Erfasser'
    end
    object DBNavigator1: TDBNavigator
      Left = 15
      Top = 19
      Width = 184
      Height = 25
      DataSource = dsBugs
      VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel]
      TabOrder = 0
      BeforeAction = DBNavigator1BeforeAction
    end
    object DBRichEdit1: TDBRichEdit
      Left = 15
      Top = 280
      Width = 483
      Height = 299
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataField = 'beschreibung'
      DataSource = dsBugs
      TabOrder = 10
    end
    object DBEdit1: TDBEdit
      Left = 17
      Top = 213
      Width = 186
      Height = 21
      DataField = 'titel'
      DataSource = dsBugs
      TabOrder = 6
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 17
      Top = 120
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
      TabOrder = 8
    end
    object DBEdit3: TDBEdit
      Left = 240
      Top = 141
      Width = 155
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'status_geaendert'
      DataSource = dsBugs
      ReadOnly = True
      TabOrder = 3
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 17
      Top = 168
      Width = 186
      Height = 21
      DataField = 'modul'
      DataSource = dsBugs
      KeyField = 'id'
      ListField = 'modul'
      ListSource = dsModule
      NullValueKey = 46
      TabOrder = 4
    end
    object DBLookupComboBox3: TDBLookupComboBox
      Left = 240
      Top = 235
      Width = 155
      Height = 21
      DataField = 'version_release'
      DataSource = dsBugs
      KeyField = 'id'
      ListField = 'version'
      ListSource = dsVersionen
      TabOrder = 7
    end
    object TrackBar1: TTrackBar
      Left = 245
      Top = 12
      Width = 164
      Height = 45
      Position = 5
      TabOrder = 11
      OnChange = TrackBar1Change
    end
    object btnBearbeitungsnotiz: TButton
      Left = 17
      Top = 240
      Width = 185
      Height = 25
      Caption = 'Notiz hinzuf'#252'gen'
      TabOrder = 9
      OnClick = btnBearbeitungsnotizClick
    end
    object DBLookupComboBox4: TDBLookupComboBox
      Left = 240
      Top = 189
      Width = 155
      Height = 21
      DataField = 'version_agenda'
      DataSource = dsBugs
      KeyField = 'id'
      ListField = 'version'
      ListSource = dsVersionen
      TabOrder = 5
    end
    object cbxErfasser: TDBLookupComboBox
      Left = 17
      Top = 72
      Width = 186
      Height = 21
      Color = clBtnFace
      DataField = 'erfasser'
      DataSource = dsBugs
      KeyField = 'id'
      ListField = 'name'
      ListSource = dsMitarbeiter
      NullValueKey = 46
      ReadOnly = True
      TabOrder = 12
    end
    object DBLookupComboBox5: TDBLookupComboBox
      Left = 240
      Top = 120
      Width = 155
      Height = 21
      DataField = 'status'
      DataSource = dsBugs
      KeyField = 'id'
      ListField = 'status'
      ListSource = dsStatus
      TabOrder = 2
    end
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=WULI;Data Source=GREINER\CORA2012,49001'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
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
    object Bugs1: TMenuItem
      Caption = 'Bugs'
      object Wechselnzu1: TMenuItem
        Caption = 'Wechseln zu...'
        OnClick = Wechselnzu1Click
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
    BeforeCancel = qryBugsBeforeCancel
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
    object qryBugserfasser: TIntegerField
      FieldName = 'erfasser'
    end
    object qryBugsversion_agenda: TIntegerField
      FieldName = 'version_agenda'
    end
    object qryBugsstatus: TIntegerField
      FieldName = 'status'
      OnChange = qryBugsstatusChange
    end
    object qryBugsstatus_geaendert: TDateTimeField
      FieldName = 'status_geaendert'
    end
  end
  object dsVersionen: TDataSource
    DataSet = qryVersionen
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
  object dsModule: TDataSource
    DataSet = qryModule
    Left = 304
    Top = 312
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 128
    Top = 216
  end
  object qryVersionen: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterInsert = qryVersionenAfterInsert
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM versionen')
    Left = 240
    Top = 344
  end
  object qryModule: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterInsert = qryModuleAfterInsert
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM module')
    Left = 304
    Top = 344
  end
  object lkpStatus: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'lkp_status'
    Left = 344
    Top = 344
    object lkpStatusid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object lkpStatusstatus: TStringField
      FieldName = 'status'
      Size = 255
    end
    object lkpStatuscolor: TIntegerField
      FieldName = 'color'
    end
  end
  object dsStatus: TDataSource
    DataSet = lkpStatus
    Left = 344
    Top = 312
  end
end
