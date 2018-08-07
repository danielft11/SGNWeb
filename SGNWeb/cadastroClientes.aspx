<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cadastroClientes.aspx.cs" Inherits="SGNWeb.cadastroClientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="Content/bootstrap.css" rel="stylesheet"/>
    <link href="Content/jquery.maxlength.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/jquery.maskedinput-1.3.min.js"></script>
    <script src="Scripts/jquery.plugin.js"></script>
    <script src="Scripts/jquery.maxlength.js"></script>
    <title>SGN Web - Cadastro de Clientes</title>
    <script type="text/javascript">
        function ShowModal(titulo, detalhes) {
            $("#myModal").modal('show');
            $('.modal-title').text(titulo);
            $('.modal-body').text(detalhes);
        }
    </script>
    <script>
        jQuery(function ($) {
            $("#txtCPF").mask("999.999.999-99");
            $("#txtCNPJ").mask("99.999.999/9999-99");
            $("#txtCEP").mask("99999-999");
            $("#txtTelefone").mask("9999-9999");
            $("#txtTel2").mask("9999-9999");
            $("#txtCelular").mask("99999-9999");
            $("#txtCel2").mask("99999-9999");
            $("#txtDataNascimento").mask("99/99/9999");
            $("#txtClienteDesde").mask("99/99/9999");
            $("#txtDDD").mask("999");
        });
    </script>
    <script>
        $(function () {
            $('#txtObservacoes').maxlength({ max: 300 });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12 col-sm-12" style="background-color:black">
                    <h3 class="text-center" style="color: white">Cadastro de Clientes</h3>
                </div>
            </div> <%--Linha Título--%>
            <div class="row"> 
                  <div class="col-md-3 col-sm-3">
                      <div class="checkbox">
                          <asp:RadioButtonList ID="rbTipoCliente" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rbTipoCliente_SelectedIndexChanged">
                              <asp:ListItem Value="F">Pessoa Física</asp:ListItem>
                              <asp:ListItem Value="J">Pessoa Jurídica</asp:ListItem>
                          </asp:RadioButtonList>
                          <asp:RequiredFieldValidator ID="RFValidadorTipo" runat="server" ErrorMessage="Selecione o tipo." ControlToValidate="rbTipoCliente" EnableClientScript="False" BackColor="#FFFF66" ForeColor="#990000"></asp:RequiredFieldValidator>
                      </div>
                  </div>
            </div> <%--Linha de seleção de tipo de cliente--%>
            <div class="row">
                <div class="col-md-6 col-sm-6">
                    <div class="form-group">
                        <label class="control-label" for="txtNome">Nome ou Razão Social</label>
                        <asp:TextBox ID="txtNome" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFValidatorNome" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="txtNome" EnableClientScript="False" BackColor="#FFFF66" ForeColor="#990000"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6">
                    <div class="form-group">
                        <label class="control-label" for="txtNomeFantasia">Nome Fantasia</label>
                        <asp:TextBox ID="txtNomeFantasia" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>
                    </div>
                </div>
            </div> <%--Linha Nome|Razão Social e Nome Fantasia--%> 
            <div class="row">
                <div class="col-md-3 col-sm-3">
                    <div class="form-group">
                        <label class="control-label" for="txtCPF">CPF</label>
                        <asp:TextBox ID="txtCPF" runat="server" CssClass="form-control" MaxLength="11"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFValidatorCPF" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="txtNome" EnableClientScript="False" BackColor="#FFFF66" ForeColor="#990000"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3">
                    <div class="form-group">
                        <label class="control-label" for="txtIdentidade">Identidade</label>
                        <asp:TextBox ID="txtIdentidade" runat="server" CssClass="form-control" MaxLength="14"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3">
                    <div class="form-group">
                        <label class="control-label" for="txtCNPJ">CNPJ</label>
                        <asp:TextBox ID="txtCNPJ" runat="server" CssClass="form-control" MaxLength="14"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFValidatorCNPJ" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="txtCNPJ" EnableClientScript="False" BackColor="#FFFF66" ForeColor="#990000"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3">
                    <div class="form-group">
                        <label class="control-label" for="txtInscEstadual">Inscrição Estadual</label>
                        <asp:TextBox ID="txtInscEstadual" runat="server" CssClass="form-control" MaxLength="9"></asp:TextBox>
                    </div>
                </div>
            </div> <%--Linha CPF, CNPJ, Identidade e Inscrição Estadual--%>
            <div class="row">
                <div class="col-md-4 col-sm-4">
                    <div class="form-group">
                        <label class="control-label" for="txtEndereco">Endereco</label>
                        <asp:TextBox ID="txtEndereco" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFValidatorEndereco" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="txtEndereco" EnableClientScript="False" BackColor="#FFFF66" ForeColor="#990000"></asp:RequiredFieldValidator>
                    </div> 
                </div>
                <div class="col-md-2 col-sm-2">
                    <div class="form-group">
                        <label class="control-label" for="txtBairro">Bairro</label>
                        <asp:TextBox ID="txtBairro" runat="server" CssClass="form-control" MaxLength="20"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFValidatorBairro" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="txtBairro" EnableClientScript="False" BackColor="#FFFF66" ForeColor="#990000"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3">
                    <div class="form-group">
                        <label class="control-label" for="txtCidade">Cidade</label>
                        <asp:TextBox ID="txtCidade" runat="server" CssClass="form-control" MaxLength="40"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFValidatorCidade" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="txtCidade" EnableClientScript="False" BackColor="#FFFF66" ForeColor="#990000"></asp:RequiredFieldValidator>
                    </div>
                    
                </div>
                <div class="col-md-1 col-sm-1">
                    <div class="form-group">
                        <label class="control-label" for="txtEstado">Estado</label>
                        <asp:TextBox ID="txtEstado" runat="server" CssClass="form-control" MaxLength="2"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFValidatorEstado" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="txtEstado" EnableClientScript="False" BackColor="#FFFF66" ForeColor="#990000"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-2 col-sm-2">
                    <div class="form-group">
                        <label class="control-label" for="txtCEP">CEP</label>
                        <asp:TextBox ID="txtCEP" runat="server" CssClass="form-control" MaxLength="8"></asp:TextBox>
                    </div>
                </div>
            </div> <%--Linha Endereço--%>
            <div class="row">
                <div class="col-md-1 col-sm-1">
                    <div class="form-group">
                        <label class="control-label" for="txtDDD">DDD</label>
                        <asp:TextBox ID="txtDDD" runat="server" CssClass="form-control" MaxLength="3"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3">
                    <div class="form-group">
                        <label class="control-label" for="txtTelefone">Telefone Principal</label>
                        <asp:TextBox ID="txtTelefone" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-2 col-sm-2">
                    <div class="form-group">
                        <label class="control-label" for="txtTel2">Telefone Alternativo</label>
                        <asp:TextBox ID="txtTel2" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3">
                    <div class="form-group">
                        <label class="control-label" for="txtCelular">Celular Principal</label>
                        <asp:TextBox ID="txtCelular" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3">
                    <div class="form-group">
                        <label class="control-label" for="txtCel2">Celular Alternativo</label>
                        <asp:TextBox ID="txtCel2" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox>
                    </div>
                </div>
            </div> <%--Linha Contatos--%>
            <div class="row">
                <div class="col-md-4 col-sm-4">
                    <div class="form-group">
                        <label class="control-label" for="txtEmail">E-mail</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="REValidatorEmail" runat="server" ErrorMessage="E-mail com formato inválido." ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" EnableClientScript="False" BackColor="#FFFF66" ForeColor="#990000"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4">
                    <div class="form-group">
                        <label class="control-label" for="txtEmail2">E-mail Alternativo</label>
                        <asp:TextBox ID="txtEmail2" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="REValidatorEmail2" runat="server" ErrorMessage="E-mail com formato inválido." ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" EnableClientScript="False" BackColor="#FFFF66" ForeColor="#990000"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="col-md-2 col-sm-2">
                    <div class="form-group">
                        <label class="control-label" for="txtDataNascimento">Nascimento</label>
                        <asp:TextBox ID="txtDataNascimento" runat="server" CssClass="form-control" MaxLength="8"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-2 col-sm-2">
                    <div class="form-group">
                        <label class="control-label" for="txtClienteDesde">Cliente Desde</label>
                        <asp:TextBox ID="txtClienteDesde" runat="server" CssClass="form-control" MaxLength="8"></asp:TextBox>
                    </div>
                </div>
            </div> <%--Linha E-mail e datas--%>
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <div class="form-group">
                        <label class="control-label" for="txtObservacoes">Observações</label>
                        <asp:TextBox ID="txtObservacoes" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
            </div> <%--Linha Observações--%>
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <asp:Button ID="btnSalvar" runat="server" Text="Salvar" CssClass="btn btn-success btn-sm" OnClick="btnSalvar_Click" />
                    <asp:Button ID="btnSair" runat="server" Text="Cancelar" CssClass="btn btn btn-danger btn-sm" OnClientClick="window.close();"/>
                </div>
            </div> <%--Linha de Botões--%>
            <div class="row"> 
                <div class="col-md-12 col-sm-12">           
                    <!-- Modal -->
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <p></p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary" data-dismiss="modal">Fechar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div><%--Linha do Modal--%>
        </div>    
    </form>
</body>
</html>
