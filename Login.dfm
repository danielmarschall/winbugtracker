object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'ViaThinkSoft Bugtracker f'#252'r Windows'
  ClientHeight = 385
  ClientWidth = 298
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 24
    Width = 233
    Height = 33
    AutoSize = False
    Caption = 'Wilkommen'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 32
    Top = 80
    Width = 233
    Height = 105
    Caption = 'Wer sind Sie?'
    TabOrder = 0
    object Label2: TLabel
      Left = 98
      Top = 59
      Width = 103
      Height = 13
      Cursor = crHandPoint
      Alignment = taRightJustify
      Caption = 'Mitarbeiter verwalten'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = Label2Click
    end
    object cbxMitarbeiter: TDBLookupComboBox
      Left = 24
      Top = 32
      Width = 177
      Height = 21
      KeyField = 'id'
      ListField = 'name'
      ListSource = frmBugtracker.dsMitarbeiter
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 32
    Top = 200
    Width = 233
    Height = 105
    Caption = 'An was m'#246'chten Sie arbeiten?'
    TabOrder = 1
    object Label3: TLabel
      Left = 110
      Top = 59
      Width = 91
      Height = 13
      Cursor = crHandPoint
      Alignment = taRightJustify
      Caption = 'Projekte verwalten'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = Label3Click
    end
    object cbxProjekt: TDBLookupComboBox
      Left = 24
      Top = 32
      Width = 177
      Height = 21
      KeyField = 'id'
      ListField = 'projekt'
      ListSource = frmBugtracker.dsProjekte
      TabOrder = 0
    end
  end
  object Button1: TButton
    Left = 94
    Top = 327
    Width = 115
    Height = 36
    Caption = 'Los geht'#39's'
    TabOrder = 2
    OnClick = Button1Click
  end
end
