unit untCadastroCliente;

interface

uses
  ExtCtrls, ComCtrls, TabNotBk, Mask, Buttons, DB,
  DBClient, Grids, DBGrids, System.JSON,Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DBXJSON, DBXJSONReflect,
  IdSMTP, IdSSLOpenSSL, IdMessage, IdText, IdAttachmentFile,
  IdExplicitTLSClientServerBase, Vcl.StdCtrls,idHTTP,
  REST.Client, IPPeerClient;
type
  TFrmCadastroCliente = class(TForm)
    tbnTipoCadastro: TTabbedNotebook;
    stpCadastro: TStatusBar;
    tmr1: TTimer;
    grpDadosCliente: TGroupBox;
    lblNome: TLabel;
    lblIdentidade: TLabel;
    lblCPF: TLabel;
    lblTelefone: TLabel;
    lblEmail: TLabel;
    edtNome: TEdit;
    edtIdentidade: TEdit;
    edtEmail: TEdit;
    mskCPF: TMaskEdit;
    mskTelefone: TMaskEdit;
    grpEndereco: TGroupBox;
    lblCEP: TLabel;
    lblLogradouro: TLabel;
    lblNumero: TLabel;
    lblComplemento: TLabel;
    lblBairro: TLabel;
    lblCidade: TLabel;
    lblEstado: TLabel;
    lblPais: TLabel;
    mskCEP: TMaskEdit;
    edtLogradouro: TEdit;
    edtComplemento: TEdit;
    edtNumero: TEdit;
    edtBairro: TEdit;
    edtCidade: TEdit;
    edtEstado: TEdit;
    edtPais: TEdit;
    btnNovo: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    btnExcluir: TBitBtn;
    btnEditar: TBitBtn;
    cdsCliente: TClientDataSet;
    cdsClienteNome: TStringField;
    cdsClienteIdentidade: TStringField;
    cdsClienteCPF: TStringField;
    cdsClienteTelefone: TStringField;
    cdsClienteEmail: TStringField;
    cdsClienteCEP: TStringField;
    cdsClienteLogradouro: TStringField;
    cdsClienteComplemento: TStringField;
    cdsClienteNumero: TStringField;
    cdsClienteBairro: TStringField;
    cdsClienteCidade: TStringField;
    cdsClienteEstado: TStringField;
    cdsClientePais: TStringField;
    grpListaCliente: TGroupBox;
    dtsCliente: TDataSource;
    dbgCliente: TDBGrid;
    spbBuscarCEP: TSpeedButton;
    grpEmail: TGroupBox;
    grpDestinatario: TGroupBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtPorta: TEdit;
    edtSmtp: TEdit;
    edtLogin: TEdit;
    grpRemetente: TGroupBox;
    lblEmailRem: TLabel;
    edtEmailRem: TEdit;
    btnEmail: TBitBtn;
    lblAssunto: TLabel;
    edtAssunto: TEdit;
    lblEmailDest: TLabel;
    edtDest: TEdit;
    lblMensagem: TLabel;
    edtSenha: TEdit;
    lblSenha: TLabel;
    lblNomeRem: TLabel;
    edtNomeRem: TEdit;
    procedure tmr1Timer(Sender: TObject);
    procedure spbBuscarCEPClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure mskCEPKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure limparCamposEndereco;
    function pegarCEP(pCep: string): TJSONObject;
    procedure BuscarCEPNoViaCEP(pCep: string);
    procedure preencherEndereco(JSON: TJSONObject);
    procedure limparCampos();
    procedure carregarCampos();
    procedure novo();
    procedure salvar(pTipo:String);
    procedure cancelar();
    procedure excluir();
    procedure editar();
    function ValidarEMail(aStr: string): Boolean;
    procedure enviarEmail();
    procedure validarDadosCliente();
  public
    { Public declarations }

  end;

var
  FrmCadastroCliente: TFrmCadastroCliente;
  tipoSalvar: string;
  porta, smtp, login, senha,
  email, assunto, nomeRem, emailDest: string;

implementation

{$R *.dfm}

procedure TFrmCadastroCliente.btnCancelarClick(Sender: TObject);
begin
  cancelar();
end;

procedure TFrmCadastroCliente.btnEditarClick(Sender: TObject);
begin
  editar();
end;

procedure TFrmCadastroCliente.btnEmailClick(Sender: TObject);
var diretorio: string;
begin
   if not(ValidarEMail(Trim(edtEmailRem.Text)))then
   begin
     MessageBox(0,'E-mail para o remetente está inválido. Verifique!!','Mensagem',MB_OK + MB_ICONINFORMATION);
     Abort;
   end;

   if not(ValidarEMail(Trim(edtDest.Text)))then
   begin
     MessageBox(0,'E-mail para o destinatário está inválido. Verifique!!','Mensagem',MB_OK + MB_ICONINFORMATION);
     Abort;
   end;

  diretorio := 'c:\temp';

  if not (DirectoryExists(diretorio)) then
  begin
    if not CreateDir(Diretorio) then
       raise Exception.Create('Não foi possível criar ' + Diretorio);
  end;

  if(FileExists('c:\temp\dados_cliente.xml'))then
  begin
    DeleteFile('c:\temp\dados_cliente.xml');
  end;

  cdsCliente.SaveToFile('c:\temp\dados_cliente.xml',dfXML);
  lblMensagem.Visible := True;
  lblMensagem.Repaint;

  enviarEmail;
end;

procedure TFrmCadastroCliente.btnExcluirClick(Sender: TObject);
begin
  excluir();
end;

procedure TFrmCadastroCliente.btnNovoClick(Sender: TObject);
begin
  novo();
end;

procedure TFrmCadastroCliente.btnSalvarClick(Sender: TObject);
begin
  salvar(tipoSalvar);
end;

procedure TFrmCadastroCliente.BuscarCEPNoViaCEP(pCep: string);
var
  data: TJSONObject;
  RESTClient1: TRESTClient;
  RESTRequest1: TRESTRequest;
  RESTResponse1: TRESTResponse;
begin
  RESTClient1           := TRESTClient.Create(nil);
  RESTRequest1          := TRESTRequest.Create(nil);
  RESTResponse1         := TRESTResponse.Create(nil);
  RESTRequest1.Client   := RESTClient1;
  RESTRequest1.Response := RESTResponse1;
  RESTClient1.BaseURL   := 'https://viacep.com.br/ws/' + pCep + '/json';
  RESTRequest1.Execute;
  data := RESTResponse1.JSONValue as TJSONObject;

  try
    if Assigned(data) then
    begin
        try
          edtLogradouro.Text := Trim(data.Values['logradouro'].Value);
        except
          on Exception do
            edtLogradouro.Text := '';
        end;

        try
          edtBairro.Text := Trim(data.Values['bairro'].Value);
        except
         on Exception do
           edtBairro.Text := '';
        end;

        try
          edtEstado.Text := Trim(data.Values['uf'].Value);
        except
         on Exception do
           edtEstado.Text := '';
        end;

        try
          edtCidade.Text := Trim(data.Values['localidade'].Value);
        except
         on Exception do
           edtCidade.Text := '';
        end;

        try
          edtComplemento.Text := Trim(data.Values['complemento'].Value);
        except
         on Exception do
           edtComplemento.Text := '';
        end;

    end;
  finally
    FreeAndNil(data);
  end;
end;

procedure TFrmCadastroCliente.cancelar;
var nomeCliente: string;
begin
  if(grpDadosCliente.Enabled = false)then
  begin
    Abort;
  end;

  nomeCliente := Trim(UpperCase(cdsClienteNome.AsString));
  if(nomeCliente = '')then
  begin
     if Trim(edtNome.Text) <> '' then
        nomeCliente := Trim(edtNome.Text)
     else
        nomeCliente := '<NÃO DIGITADO>';
  end;

  if(Application.MessageBox(PChar('Deseja cancelar a edição do registro? ' + #13 + 'Cliente: ' + nomeCliente + '?'),'Atenção',MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2)) = IDYES then
  begin
    cdsCliente.Cancel;
    limparCampos;
    grpDadosCliente.Enabled := False;

    //controle dos botões
    btnNovo.Enabled     := True;
    btnSalvar.Enabled   := False;
    btnCancelar.Enabled := False;
    btnExcluir.Enabled  := True;
    btnEditar.Enabled   := True;
  end;
end;

procedure TFrmCadastroCliente.carregarCampos;
begin
  //dados do cliente
  edtNome.Text        := Trim(cdsClienteNome.AsString);
  edtIdentidade.Text  := Trim(cdsClienteIdentidade.AsString);
  mskCPF.Text         := Trim(cdsClienteCPF.AsString);
  mskTelefone.Text    := Trim(cdsClienteTelefone.AsString);
  edtEmail.Text       := Trim(cdsClienteEmail.AsString);

  //dados endereço
  mskCEP.Text         := Trim(cdsClienteCEP.AsString);
  edtLogradouro.Text  := Trim(cdsClienteLogradouro.AsString);
  edtComplemento.Text := Trim(cdsClienteComplemento.AsString);
  edtNumero.Text      := Trim(cdsClienteNumero.AsString);
  edtBairro.Text      := Trim(cdsClienteBairro.AsString);
  edtCidade.Text      := Trim(cdsClienteCidade.AsString);
  edtEstado.Text      := Trim(cdsClienteEstado.AsString);
  edtPais.Text        := Trim(cdsClientePais.AsString);
end;

procedure TFrmCadastroCliente.editar;
begin
  if(cdsCliente.RecordCount = 0)then
  begin
    MessageBox(0,'Não existe registro para edição!','Mensagem',MB_OK + MB_ICONINFORMATION);
    Abort;
  end;

  tipoSalvar := 'A';
  carregarCampos;
  grpDadosCliente.Enabled := True;
  edtNome.SetFocus;

  //controle dos botões
  btnNovo.Enabled     := False;
  btnSalvar.Enabled   := True;
  btnCancelar.Enabled := True;
  btnExcluir.Enabled  := False;
  btnEditar.Enabled   := False;
end;

procedure TFrmCadastroCliente.enviarEmail;
var IdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
    IdSMTP: TIdSMTP;
    IdMessage: TIdMessage;
    IdText: TIdText;
    sAnexo: string;
begin
  // instanciação dos objetos
  IdSSLIOHandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create(Self);
  IdSMTP               := TIdSMTP.Create(Self);
  IdMessage            := TIdMessage.Create(Self);

  try
    // Configuração do protocolo SSL
    IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
    IdSSLIOHandlerSocket.SSLOptions.Mode   := sslmClient;

    // Configuração do servidor SMTP
    IdSMTP.IOHandler := IdSSLIOHandlerSocket;
    IdSMTP.UseTLS    := utUseImplicitTLS;
    IdSMTP.AuthType  := satDefault;
    IdSMTP.Port      := StrToInt(Trim(edtPorta.Text));
    IdSMTP.Host      := Trim(edtSmtp.Text);
    IdSMTP.Username  := Trim(edtLogin.Text);
    IdSMTP.Password  := Trim(edtSenha.Text);

    // Configuração da mensagem
    IdMessage.From.Address           := Trim(edtEmailRem.Text);
    IdMessage.From.Name              := Trim(edtNomeRem.Text);
    IdMessage.ReplyTo.EMailAddresses := IdMessage.From.Address;
    IdMessage.Recipients.Add.Text    := Trim(edtDest.Text);
    IdMessage.Subject                := Trim(edtAssunto.Text);
    IdMessage.Encoding               := meMIME;

    // Configuração do corpo do email
    IdText := TIdText.Create(IdMessage.MessageParts);
    IdText.Body.Add('<html>');
    IdText.Body.Add('<body>');

    cdsCliente.First;
    while not(cdsCliente.Eof) do
    begin
      IdText.Body.Add('<font color="blue"> ' + ' *** Registro: ' + FormatFloat('000',cdsCliente.RecNo) + ' </font><br>');
      IdText.Body.Add('<font color="blue"> ' + 'Nome: '          + cdsClienteNome.AsString       + ' </font><br>');
      IdText.Body.Add('<font color="blue"> ' + 'Identidade: '    + cdsClienteIdentidade.AsString + ' </font><br>');
      IdText.Body.Add('<font color="blue"> ' + 'CPF: '           + cdsClienteCPF.AsString        + ' </font><br>');
      IdText.Body.Add('<font color="blue"> ' + 'Telefone: '      + cdsClienteTelefone.AsString   + ' </font><br>');
      IdText.Body.Add('<font color="blue"> ' + 'E-mail: '        + cdsClienteEmail.AsString      + ' </font><br><br>');

      IdText.Body.Add('<font color="blue"> ' + 'Endereço: '    + ' </font><br>');
      IdText.Body.Add('<font color="blue"> ' + 'CEP: '         + cdsClienteCEP.AsString         + ' </font><br>');
      IdText.Body.Add('<font color="blue"> ' + 'Logradouro: '  + cdsClienteLogradouro.AsString  + ' </font><br>');
      IdText.Body.Add('<font color="blue"> ' + 'Número: '      + cdsClienteNumero.AsString      + ' </font><br>');
      IdText.Body.Add('<font color="blue"> ' + 'Complemento: ' + cdsClienteComplemento.AsString + ' </font><br>');
      IdText.Body.Add('<font color="blue"> ' + 'Bairro: '      + cdsClienteBairro.AsString      + ' </font><br>');
      IdText.Body.Add('<font color="blue"> ' + 'Cidade: '      + cdsClienteCidade.AsString      + ' </font><br>');
      IdText.Body.Add('<font color="blue"> ' + 'Estado: '      + cdsClienteEstado.AsString      + ' </font><br>');
      IdText.Body.Add('<font color="blue"> ' + 'País: '        + cdsClientePais.AsString        + ' </font><br>');

      IdText.Body.Add('<br><br><br>');

      cdsCliente.Next;
    end;

    IdText.Body.Add('</body>');
    IdText.Body.Add('</html>');
    IdText.ContentType := 'text/html; charset=iso-8859-1';

    //Anexo da mensagem
    sAnexo := 'c:\temp\dados_cliente.xml';
    if FileExists(sAnexo) then
    begin
      TIdAttachmentFile.Create(IdMessage.MessageParts, TFileName(sAnexo));
    end;

    // Conexão e autenticação
    try
      IdSMTP.Connect;
      IdSMTP.Authenticate;
    except
      on E:Exception do
      begin
        MessageBox(0,PChar('Erro na conexão ou autenticação:' + e.Message),'Mensagem',MB_OK + MB_ICONWARNING);
        Exit;
      end;
    end;

    // Envio da mensagem
    try
      IdSMTP.Send(IdMessage);
      MessageBox(0,'Mensagem enviada com sucesso!','Mensagem',MB_OK + MB_ICONINFORMATION);
    except
      On E:Exception do
      begin
        MessageBox(0,PChar('Erro ao enviar a mensagem:' + e.Message),'Mensagem',MB_OK + MB_ICONWARNING);
      end;
    end;

  finally
    // desconecta do servidor
    IdSMTP.Disconnect;

    // liberação da DLL
    UnLoadOpenSSLLibrary;

    // liberação dos objetos da memória
    FreeAndNil(IdMessage);
    FreeAndNil(IdSSLIOHandlerSocket);
    FreeAndNil(IdSMTP);
  end;
end;

procedure TFrmCadastroCliente.excluir;
begin
  if(cdsCliente.RecordCount = 0)then
  begin
    MessageBox(0,'Não existe registro para ser excluído!','Mensagem',MB_OK + MB_ICONINFORMATION);
    Abort;
  end;

  if(Application.MessageBox(PChar('Deseja excluir o cliente ' + UpperCase(cdsClienteNome.AsString) + '?'),'Atenção',MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2)) = IDYES then
  begin
    cdsCliente.Delete;
    MessageBox(0,'Registro excluído com sucesso!','Mensagem',MB_OK + MB_ICONINFORMATION);

    //controle dos botões
    btnNovo.Enabled     := True;
    btnSalvar.Enabled   := False;
    btnCancelar.Enabled := False;
    btnExcluir.Enabled  := True;
    btnEditar.Enabled   := True;
  end;
end;

procedure TFrmCadastroCliente.limparCampos;
var i: Integer;
begin
  porta     := edtPorta.Text;
  smtp      := edtSmtp.Text;
  login     := edtLogin.Text;
  senha     := edtSenha.Text;
  email     := edtEmailRem.Text;
  assunto   := edtAssunto.Text;
  nomeRem   := edtNomeRem.Text;
  emailDest := edtDest.Text;

  for i := 0 to (ComponentCount)-1 do
  begin
    if(Components[i] is TEdit)then
      (Components[i] as TEdit).Clear;

    if(Components[i] is TMaskEdit)then
      (Components[i] as TMaskEdit).Clear;
  end;

  edtPorta.Text    :=  porta;
  edtSmtp.Text     :=  smtp;
  edtLogin.Text    :=  login;
  edtSenha.Text    :=  senha;
  edtEmailRem.Text :=  email;
  edtAssunto.Text  :=  assunto;
  edtNomeRem.Text  :=  nomeRem;
  edtDest.Text     :=  emailDest;
end;

procedure TFrmCadastroCliente.limparCamposEndereco;
begin
  mskCEP.Clear;
  edtLogradouro.Clear;
  edtComplemento.Clear;
  edtNumero.Clear;
  edtBairro.Clear;
  edtCidade.Clear;
  edtEstado.Clear;
  edtPais.Clear;
end;

procedure TFrmCadastroCliente.mskCEPKeyPress(Sender: TObject; var Key: Char);
begin
  if(key = #13)then
  begin
    spbBuscarCEPClick(Self);
  end;
end;

procedure TFrmCadastroCliente.novo;
begin
  tipoSalvar := 'N';
  limparCampos();
  grpDadosCliente.Enabled := True;
  edtNome.SetFocus;

  //controle dos botões
  btnNovo.Enabled     := False;
  btnSalvar.Enabled   := True;
  btnCancelar.Enabled := True;
  btnExcluir.Enabled  := False;
  btnEditar.Enabled   := False;
end;

procedure TFrmCadastroCliente.salvar(pTipo: String);
begin
  if(grpDadosCliente.Enabled = false)then
  begin
    Abort;
  end;

  validarDadosCliente;

  try
    //Novo Registro
    if(pTipo = 'N')then
    begin
      cdsCliente.Insert;
    end
    else
    begin
      cdsCliente.Edit;
    end;

    //dados do cliente
    cdsClienteNome.AsString       := Trim(edtNome.Text);
    cdsClienteIdentidade.AsString := Trim(edtIdentidade.Text);
    cdsClienteCPF.AsString        := Trim(mskCPF.Text);
    cdsClienteTelefone.AsString   := Trim(mskTelefone.Text);
    cdsClienteEmail.AsString      := Trim(edtEmail.Text);

    //dados do endereço
    cdsClienteCEP.AsString        := Trim(mskCEP.Text);
    cdsClienteLogradouro.AsString := Trim(edtLogradouro.Text);
    cdsClienteComplemento.AsString:= Trim(edtComplemento.Text);
    cdsClienteNumero.AsString     := Trim(edtNumero.Text);
    cdsClienteBairro.AsString     := Trim(edtBairro.Text);
    cdsClienteCidade.AsString     := Trim(edtCidade.Text);
    cdsClienteEstado.AsString     := Trim(edtEstado.Text);
    cdsClientePais.AsString       := Trim(edtPais.Text);

    cdsCliente.Post;
  except on e: Exception do
   begin
     MessageBox(0,PChar('Erro ao gravar dados!' + #13 + 'Tipo do erro: ' + e.Message),'Mensagem',MB_OK + MB_ICONERROR);
   end;
  end;

  limparCampos;
  grpDadosCliente.Enabled := False;

  //controle dos botões
  btnNovo.Enabled     := True;
  btnSalvar.Enabled   := False;
  btnCancelar.Enabled := False;
  btnExcluir.Enabled  := True;
  btnEditar.Enabled   := True;

  MessageBox(0,'Registro gravado com sucesso!','Mensagem',MB_OK + MB_ICONINFORMATION);
end;


function TFrmCadastroCliente.pegarCEP(pCep: string): TJSONObject;
var
   HTTP: TIdHTTP;
   IDSSLHandler : TIdSSLIOHandlerSocketOpenSSL;
   Response: TStringStream;
   LJsonObj: TJSONObject;
begin
   try
      HTTP := TIdHTTP.Create;
      IDSSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create;
      HTTP.IOHandler := IDSSLHandler;

      IDSSLHandler.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];

      Response := TStringStream.Create('');
      HTTP.Get('https://viacep.com.br/ws/' + pCep + '/json', Response);
      if (HTTP.ResponseCode = 200) and not(Utf8ToAnsi(Response.DataString) = '{'#$A'  "erro": true'#$A'}') then
         Result := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes( Utf8ToAnsi(Response.DataString)), 0) as TJSONObject;
   finally
      FreeAndNil(HTTP);
      FreeAndNil(IDSSLHandler);
      Response.Destroy;
   end;
end;

procedure TFrmCadastroCliente.preencherEndereco(JSON: TJSONObject);
begin
   edtLogradouro.Text  := JSON.Get('logradouro').JsonValue.Value;
   edtComplemento.Text := JSON.Get('complemento').JsonValue.Value;
   edtNumero.Text      := JSON.Get('numero').JsonValue.Value;
   edtBairro.Text      := JSON.Get('bairro').JsonValue.Value;
   edtCidade.Text      := UpperCase(JSON.Get('localidade').JsonValue.Value);
   edtEstado.Text      := JSON.Get('uf').JsonValue.Value;
   edtPais.Text        := JSON.Get('pais').JsonValue.Value;
end;

procedure TFrmCadastroCliente.spbBuscarCEPClick(Sender: TObject);
//var LJsonObj: TJSONObject;
begin
   if (Length(mskCEP.Text) <> 8)then
   begin
     MessageBox(0,'CEP incorreto!','Mensagem',MB_OK + MB_ICONINFORMATION);
     limparCamposEndereco;
     mskCEP.SetFocus;
     Abort;
   end;

   BuscarCEPNoViaCEP(mskCEP.Text);

//   LJsonObj := pegarCEP(mskCEP.text);
//   if LJsonOBJ <> nil then
//      preencherEndereco(LJsonObj)
//   else
//   begin
//     showMessage('CEP inválido ou não encontrado!');
//     limparCamposEndereco;
//     mskCEP.SetFocus;
//     exit;
//   end;
end;

procedure TFrmCadastroCliente.tmr1Timer(Sender: TObject);
begin
  stpCadastro.Panels[3].Text := DateToStr(Date);
  stpCadastro.Panels[5].Text := TimeToStr(Time);
end;

procedure TFrmCadastroCliente.validarDadosCliente;
var email: Boolean;
begin
  if(Trim(edtNome.Text) = '')then
  begin
    MessageBox(0,'Digite o nome do cliente!','Mensagem',MB_OK + MB_ICONINFORMATION);
    edtNome.SetFocus;
    Abort;
  end;

  email := ValidarEMail(Trim(edtEmail.Text));
  if not(email) then
  begin
    MessageBox(0,'Informe um e-mail válido para o cliente!','Mensagem',MB_OK + MB_ICONINFORMATION);
    edtEmail.SetFocus;
    Abort;
  end;

end;

function TFrmCadastroCliente.ValidarEMail(aStr: string): Boolean;
begin
   aStr := Trim(UpperCase(aStr));

   if Pos('@', aStr) > 1 then
   begin
     Delete(aStr, 1, pos('@', aStr));
     Result := (Length(aStr) > 0) and (Pos('.', aStr) > 2);
   end
   else
     Result := False;
end;

end.
