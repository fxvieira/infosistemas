object FrmCadastroCliente: TFrmCadastroCliente
  Left = 301
  Top = 137
  Caption = 'Teste InfoSistemas'
  ClientHeight = 558
  ClientWidth = 916
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object tbnTipoCadastro: TTabbedNotebook
    Left = 0
    Top = 0
    Width = 916
    Height = 377
    Align = alTop
    TabFont.Charset = DEFAULT_CHARSET
    TabFont.Color = clBtnText
    TabFont.Height = -11
    TabFont.Name = 'MS Sans Serif'
    TabFont.Style = []
    TabOrder = 0
    object TTabPage
      Left = 4
      Top = 24
      Caption = 'Cadastro de Clientes'
      object grpDadosCliente: TGroupBox
        Left = 8
        Top = 0
        Width = 547
        Height = 306
        Caption = 'Dados do Cliente'
        Enabled = False
        TabOrder = 0
        object lblNome: TLabel
          Left = 4
          Top = 24
          Width = 60
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Nome:'
        end
        object lblIdentidade: TLabel
          Left = 4
          Top = 48
          Width = 60
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Identidade:'
        end
        object lblCPF: TLabel
          Left = 4
          Top = 72
          Width = 60
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'C.P.F:'
        end
        object lblTelefone: TLabel
          Left = 4
          Top = 96
          Width = 60
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Telefone:'
        end
        object lblEmail: TLabel
          Left = 4
          Top = 120
          Width = 60
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'E-mail:'
        end
        object edtNome: TEdit
          Left = 72
          Top = 22
          Width = 250
          Height = 19
          CharCase = ecUpperCase
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
        end
        object edtIdentidade: TEdit
          Left = 72
          Top = 46
          Width = 121
          Height = 19
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 1
        end
        object edtEmail: TEdit
          Left = 72
          Top = 118
          Width = 250
          Height = 19
          CharCase = ecLowerCase
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 4
        end
        object mskCPF: TMaskEdit
          Left = 72
          Top = 70
          Width = 117
          Height = 19
          Ctl3D = False
          EditMask = '999.999.999-99;1;_'
          MaxLength = 14
          ParentCtl3D = False
          TabOrder = 2
          Text = '   .   .   -  '
        end
        object mskTelefone: TMaskEdit
          Left = 72
          Top = 94
          Width = 113
          Height = 19
          Ctl3D = False
          EditMask = '(99)'
          MaxLength = 4
          ParentCtl3D = False
          TabOrder = 3
          Text = '(  )'
        end
        object grpEndereco: TGroupBox
          Left = 10
          Top = 144
          Width = 528
          Height = 153
          Caption = 'Endere'#231'o'
          TabOrder = 5
          object lblCEP: TLabel
            Left = 4
            Top = 24
            Width = 67
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'C.E.P.:'
          end
          object lblLogradouro: TLabel
            Left = 4
            Top = 48
            Width = 67
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Logradouro:'
          end
          object lblNumero: TLabel
            Left = 4
            Top = 96
            Width = 67
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'N'#250'mero:'
          end
          object lblComplemento: TLabel
            Left = 4
            Top = 72
            Width = 67
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Complemento:'
          end
          object lblBairro: TLabel
            Left = 140
            Top = 96
            Width = 38
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Bairro:'
          end
          object lblCidade: TLabel
            Left = 4
            Top = 120
            Width = 67
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Cidade:'
          end
          object lblEstado: TLabel
            Left = 236
            Top = 120
            Width = 40
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Estado:'
          end
          object lblPais: TLabel
            Left = 343
            Top = 120
            Width = 33
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Pa'#237's:'
          end
          object spbBuscarCEP: TSpeedButton
            Left = 202
            Top = 20
            Width = 23
            Height = 22
            Cursor = crHandPoint
            Hint = 'Buscar CEP | Via CEP'
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
              333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
              C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
              F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
              F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
              00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
              3333333373FF7333333333333000333333333333377733333333333333333333
              3333333333333333333333333333333333333333333333333333}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = spbBuscarCEPClick
          end
          object mskCEP: TMaskEdit
            Left = 77
            Top = 22
            Width = 120
            Height = 19
            CharCase = ecUpperCase
            Ctl3D = False
            MaxLength = 8
            ParentCtl3D = False
            TabOrder = 0
            Text = ''
            OnKeyPress = mskCEPKeyPress
          end
          object edtLogradouro: TEdit
            Left = 77
            Top = 46
            Width = 443
            Height = 19
            CharCase = ecUpperCase
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 1
          end
          object edtComplemento: TEdit
            Left = 77
            Top = 70
            Width = 443
            Height = 19
            CharCase = ecUpperCase
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 2
          end
          object edtNumero: TEdit
            Left = 77
            Top = 94
            Width = 59
            Height = 19
            CharCase = ecUpperCase
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 3
          end
          object edtBairro: TEdit
            Left = 181
            Top = 94
            Width = 339
            Height = 19
            CharCase = ecUpperCase
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 4
          end
          object edtCidade: TEdit
            Left = 77
            Top = 118
            Width = 155
            Height = 19
            CharCase = ecUpperCase
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 5
          end
          object edtEstado: TEdit
            Left = 281
            Top = 119
            Width = 61
            Height = 19
            CharCase = ecUpperCase
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 6
          end
          object edtPais: TEdit
            Left = 381
            Top = 118
            Width = 139
            Height = 19
            CharCase = ecUpperCase
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 7
          end
        end
      end
      object btnNovo: TBitBtn
        Left = 77
        Top = 315
        Width = 75
        Height = 25
        Cursor = crHandPoint
        Caption = '&Novo'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
          333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
          0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
          0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
          33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
          B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
          3BB33773333773333773B333333B3333333B7333333733333337}
        NumGlyphs = 2
        TabOrder = 1
        OnClick = btnNovoClick
      end
      object btnSalvar: TBitBtn
        Left = 156
        Top = 315
        Width = 75
        Height = 25
        Cursor = crHandPoint
        Caption = '&Salvar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
          00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
          00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
          00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
          0003737FFFFFFFFF7F7330099999999900333777777777777733}
        NumGlyphs = 2
        TabOrder = 2
        OnClick = btnSalvarClick
      end
      object btnCancelar: TBitBtn
        Left = 236
        Top = 315
        Width = 75
        Height = 25
        Cursor = crHandPoint
        Caption = '&Cancelar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333333333333333333FFF33FF333FFF339993370733
          999333777FF37FF377733339993000399933333777F777F77733333399970799
          93333333777F7377733333333999399933333333377737773333333333990993
          3333333333737F73333333333331013333333333333777FF3333333333910193
          333333333337773FF3333333399000993333333337377737FF33333399900099
          93333333773777377FF333399930003999333337773777F777FF339993370733
          9993337773337333777333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        TabOrder = 3
        OnClick = btnCancelarClick
      end
      object btnExcluir: TBitBtn
        Left = 315
        Top = 315
        Width = 75
        Height = 25
        Cursor = crHandPoint
        Caption = 'E&xcluir'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333FF33333333333330003333333333333777333333333333
          300033FFFFFF3333377739999993333333333777777F3333333F399999933333
          3300377777733333337733333333333333003333333333333377333333333333
          3333333333333333333F333333333333330033333F33333333773333C3333333
          330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
          993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
          333333377F33333333FF3333C333333330003333733333333777333333333333
          3000333333333333377733333333333333333333333333333333}
        NumGlyphs = 2
        TabOrder = 4
        OnClick = btnExcluirClick
      end
      object btnEditar: TBitBtn
        Left = 395
        Top = 315
        Width = 75
        Height = 25
        Cursor = crHandPoint
        Caption = '&Editar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
          000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
          00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
          F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
          0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
          FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
          FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
          0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
          00333377737FFFFF773333303300000003333337337777777333}
        NumGlyphs = 2
        TabOrder = 5
        OnClick = btnEditarClick
      end
      object grpEmail: TGroupBox
        Left = 561
        Top = 0
        Width = 342
        Height = 346
        Caption = 'Enviar E-mail'
        TabOrder = 6
        object lblMensagem: TLabel
          Left = 5
          Top = 327
          Width = 220
          Height = 13
          Caption = 'Arquivo: dados_cliente.xml gerado em C:\temp'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object grpDestinatario: TGroupBox
          Left = 2
          Top = 171
          Width = 338
          Height = 83
          Align = alTop
          Caption = 'Destinat'#225'rio | Dados do E-mail'
          TabOrder = 0
          object lblAssunto: TLabel
            Left = 40
            Top = 26
            Width = 41
            Height = 13
            Caption = 'Assunto:'
          end
          object lblEmailDest: TLabel
            Left = 17
            Top = 52
            Width = 64
            Height = 13
            Caption = 'Dest. | E-mail:'
          end
          object edtAssunto: TEdit
            Left = 87
            Top = 21
            Width = 226
            Height = 21
            TabOrder = 0
            Text = 'Teste programador Delphi - InfoSistemas'
          end
          object edtDest: TEdit
            Left = 87
            Top = 48
            Width = 226
            Height = 21
            TabOrder = 1
            Text = 'analista.go@gmail.com'
          end
        end
        object GroupBox1: TGroupBox
          Left = 2
          Top = 15
          Width = 338
          Height = 78
          Align = alTop
          Caption = 'Configura'#231#227'o'
          TabOrder = 1
          object Label1: TLabel
            Left = 10
            Top = 22
            Width = 28
            Height = 13
            Caption = 'Porta:'
          end
          object Label2: TLabel
            Left = 82
            Top = 22
            Width = 33
            Height = 13
            Caption = 'SMTP:'
          end
          object Label3: TLabel
            Left = 10
            Top = 49
            Width = 29
            Height = 13
            Caption = 'Login:'
          end
          object lblSenha: TLabel
            Left = 210
            Top = 49
            Width = 34
            Height = 13
            Caption = 'Senha:'
          end
          object edtPorta: TEdit
            Left = 42
            Top = 19
            Width = 33
            Height = 21
            TabOrder = 0
            Text = '465'
          end
          object edtSmtp: TEdit
            Left = 120
            Top = 19
            Width = 84
            Height = 21
            TabOrder = 1
            Text = 'smtp.gmail.com'
          end
          object edtLogin: TEdit
            Left = 42
            Top = 46
            Width = 162
            Height = 21
            TabOrder = 2
            Text = 'fxvieira79@gmail.com'
          end
          object edtSenha: TEdit
            Left = 248
            Top = 46
            Width = 57
            Height = 21
            PasswordChar = '?'
            TabOrder = 3
            Text = 'F123456*'
          end
        end
        object grpRemetente: TGroupBox
          Left = 2
          Top = 93
          Width = 338
          Height = 78
          Align = alTop
          Caption = 'Remetente'
          TabOrder = 2
          object lblEmailRem: TLabel
            Left = 7
            Top = 23
            Width = 31
            Height = 13
            Caption = 'E-mail:'
          end
          object lblNomeRem: TLabel
            Left = 9
            Top = 48
            Width = 31
            Height = 13
            Caption = 'Nome:'
          end
          object edtEmailRem: TEdit
            Left = 46
            Top = 20
            Width = 162
            Height = 21
            TabOrder = 0
            Text = 'analista.go@gmail.com'
          end
          object edtNomeRem: TEdit
            Left = 46
            Top = 47
            Width = 162
            Height = 21
            TabOrder = 1
            Text = 'FERNANDO VIEIRA DE SOUZA'
          end
        end
        object btnEmail: TBitBtn
          Left = 240
          Top = 318
          Width = 99
          Height = 25
          Cursor = crHandPoint
          Caption = 'Enviar E-&mail'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333333333333333333FFFFFFFFFFFFFFF000000000000
            000077777777777777770FFFFFFFFFFFFFF07F3333FFF33333370FFFF777FFFF
            FFF07F333777333333370FFFFFFFFFFFFFF07F3333FFFFFF33370FFFF777777F
            FFF07F33377777733FF70FFFFFFFFFFF99907F3FFF33333377770F777FFFFFFF
            9CA07F77733333337F370FFFFFFFFFFF9A907FFFFFFFFFFF7FF7000000000000
            0000777777777777777733333333333333333333333333333333333333333333
            3333333333333333333333333333333333333333333333333333333333333333
            3333333333333333333333333333333333333333333333333333}
          NumGlyphs = 2
          TabOrder = 3
          OnClick = btnEmailClick
        end
      end
    end
  end
  object stpCadastro: TStatusBar
    Left = 0
    Top = 539
    Width = 916
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Text = 'Candidato:'
        Width = 70
      end
      item
        Alignment = taCenter
        Text = 'Fernando Vieira de Souza - Goi'#226'nia | Go'
        Width = 250
      end
      item
        Alignment = taCenter
        Text = 'Data:'
        Width = 50
      end
      item
        Alignment = taCenter
        Width = 80
      end
      item
        Alignment = taCenter
        Text = 'Hora:'
        Width = 50
      end
      item
        Alignment = taCenter
        Width = 80
      end
      item
        Alignment = taCenter
        Width = 50
      end>
  end
  object grpListaCliente: TGroupBox
    Left = 0
    Top = 377
    Width = 916
    Height = 162
    Align = alClient
    Caption = 'Clientes Cadastrados'
    TabOrder = 2
    object dbgCliente: TDBGrid
      Left = 2
      Top = 15
      Width = 912
      Height = 145
      Align = alClient
      Color = 16776858
      DataSource = dtsCliente
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Nome'
          Width = 332
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Identidade'
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CPF'
          Title.Caption = 'C.P.F.'
          Width = 128
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Telefone'
          Width = 126
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Email'
          Width = 220
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CEP'
          Title.Caption = 'C.E.P.'
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Logradouro'
          Width = 252
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Complemento'
          Width = 245
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Numero'
          Title.Caption = 'N'#250'mero'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Bairro'
          Width = 239
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Cidade'
          Width = 194
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Estado'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Pais'
          Title.Caption = 'Pa'#237's'
          Width = 161
          Visible = True
        end>
    end
  end
  object tmr1: TTimer
    OnTimer = tmr1Timer
    Left = 396
    Top = 32
  end
  object cdsCliente: TClientDataSet
    PersistDataPacket.Data = {
      7D0100009619E0BD01000000180000000D0000000000030000007D01044E6F6D
      65020049000000010005574944544802000200FF000A4964656E746964616465
      0100490000000100055749445448020002001E00034350460100490000000100
      055749445448020002000F000854656C65666F6E650100490000000100055749
      445448020002000F0005456D61696C0100490000000100055749445448020002
      006400034345500100490000000100055749445448020002000A000A4C6F6772
      61646F75726F020049000000010005574944544802000200FF000B436F6D706C
      656D656E746F020049000000010005574944544802000200FF00064E756D6572
      6F01004900000001000557494454480200020006000642616972726F01004900
      0000010005574944544802000200320006436964616465010049000000010005
      57494454480200020032000645737461646F0100490000000100055749445448
      0200020002000450616973010049000000010005574944544802000200320000
      00}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 444
    Top = 32
    object cdsClienteNome: TStringField
      FieldName = 'Nome'
      Size = 255
    end
    object cdsClienteIdentidade: TStringField
      FieldName = 'Identidade'
      Size = 30
    end
    object cdsClienteCPF: TStringField
      FieldName = 'CPF'
      Size = 15
    end
    object cdsClienteTelefone: TStringField
      FieldName = 'Telefone'
      Size = 15
    end
    object cdsClienteEmail: TStringField
      FieldName = 'Email'
      Size = 100
    end
    object cdsClienteCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object cdsClienteLogradouro: TStringField
      FieldName = 'Logradouro'
      Size = 255
    end
    object cdsClienteComplemento: TStringField
      FieldName = 'Complemento'
      Size = 255
    end
    object cdsClienteNumero: TStringField
      FieldName = 'Numero'
      Size = 6
    end
    object cdsClienteBairro: TStringField
      FieldName = 'Bairro'
      Size = 50
    end
    object cdsClienteCidade: TStringField
      FieldName = 'Cidade'
      Size = 50
    end
    object cdsClienteEstado: TStringField
      FieldName = 'Estado'
      Size = 2
    end
    object cdsClientePais: TStringField
      FieldName = 'Pais'
      Size = 50
    end
  end
  object dtsCliente: TDataSource
    DataSet = cdsCliente
    Left = 504
    Top = 32
  end
end
