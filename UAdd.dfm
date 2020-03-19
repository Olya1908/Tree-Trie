object Form2: TForm2
  Left = 364
  Top = 360
  BorderStyle = bsDialog
  Caption = #1042#1074#1077#1076#1080#1090#1077' '#1089#1083#1086#1074#1086' '#1076#1083#1103' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103
  ClientHeight = 129
  ClientWidth = 359
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  DesignSize = (
    359
    129)
  PixelsPerInch = 96
  TextHeight = 13
  object pnlAdd: TPanel
    Left = 0
    Top = 0
    Width = 375
    Height = 150
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    DesignSize = (
      375
      150)
    object lableWord: TLabel
      Left = 24
      Top = 16
      Width = 35
      Height = 13
      Caption = #1057#1083#1086#1074#1086':'
    end
    object edtInputWrd: TEdit
      Left = 24
      Top = 40
      Width = 294
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 50
      TabOrder = 0
      OnChange = edtInputWrdChange
      OnKeyPress = edtInputWrdKeyPress
    end
    object btnOk: TButton
      Left = 46
      Top = 88
      Width = 114
      Height = 25
      Anchors = [akTop]
      BiDiMode = bdRightToLeft
      Caption = 'OK'
      Default = True
      Enabled = False
      ParentBiDiMode = False
      TabOrder = 1
      OnClick = btnOkClick
    end
    object btnCancel: TButton
      Left = 184
      Top = 88
      Width = 117
      Height = 25
      Anchors = [akTop]
      Caption = 'Cancel'
      TabOrder = 2
      OnClick = btnCancelClick
    end
  end
end
