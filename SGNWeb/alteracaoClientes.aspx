<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="alteracaoClientes.aspx.cs" Inherits="SGNWeb.alteracaoClientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="Content/bootstrap.css" rel="stylesheet"/>
    <script src="Scripts/jquery-1.9.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/jquery.maskedinput-1.3.min.js"></script>
    <title>SGN Web - Atualização do cliente</title>
</head>
<body>
    <form id="formAlteracao" runat="server">
        <div class="container-fluid">
            <div class="row" style="margin-bottom:10px">
                <div class="col-md-12 col-sm-12" style="background-color:black">
                    <h3 class="text-center" style="color: white">Edição do cliente</h3>
                </div>
            </div> <%--Linha Título--%>
            <div class="row">
                <div class="col-md-1 col-sm-1">
                    <div class="form-group">
                        <label class="control-label" for="txtIdClienteFormAlteracao">ID</label>
                        <asp:TextBox ID="txtIdClienteFormAlteracao" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-5 col-sm-5">
                    <div class="form-group">
                        <label class="control-label" for="txtNomeFormAlteracao">Nome ou Razão Social</label>
                        <asp:TextBox ID="txtNomeFormAlteracao" runat="server" CssClass="form-control" ReadOnly="false" MaxLength="50"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6">
                    <div class="form-group">
                        <label class="control-label" for="txtNomeFantasiaFormAlteracao">Nome Fantasia</label>
                        <asp:TextBox ID="txtNomeFantasiaFormAlteracao" runat="server" CssClass="form-control" ReadOnly="false" MaxLength="50"></asp:TextBox>
                    </div>
                </div>
            </div> <%--Linha Nome|Razão Social e Nome Fantasia--%> 
            <div class="row">
                <div class="col-md-3 col-sm-3">
                    <div class="form-group">
                        <label class="control-label" for="txtCPFFormAlteracao">CPF</label>
                        <asp:TextBox ID="txtCPFFormAlteracao" runat="server" CssClass="form-control" ReadOnly="false" MaxLength="11"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3">
                    <div class="form-group">
                        <label class="control-label" for="txtIdentidadeFormAlteracao">Identidade</label>
                        <asp:TextBox ID="txtIdentidadeFormAlteracao" runat="server" CssClass="form-control" ReadOnly="false" MaxLength="14"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3">
                    <div class="form-group">
                        <label class="control-label" for="txtCNPJFormAlteracao">CNPJ</label>
                        <asp:TextBox ID="txtCNPJFormAlteracao" runat="server" CssClass="form-control" ReadOnly="false" MaxLength="14"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3">
                    <div class="form-group">
                        <label class="control-label" for="txtInscEstadualFormAlteracao">Inscrição Estadual</label>
                        <asp:TextBox ID="txtInscEstadualFormAlteracao" runat="server" CssClass="form-control" ReadOnly="false" MaxLength="9"></asp:TextBox>
                    </div>
                </div>
            </div> <%--Linha CPF, CNPJ, Identidade e Inscrição Estadual--%>
            <div class="row">
                <div class="col-md-4 col-sm-4">
                    <div class="form-group">
                        <label class="control-label" for="txtEnderecoFormAlteracao">Endereco</label>
                        <asp:TextBox ID="txtEnderecoFormAlteracao" runat="server" CssClass="form-control" ReadOnly="false" MaxLength="50"></asp:TextBox>     
                    </div> 
                </div>
                <div class="col-md-2 col-sm-2">
                    <div class="form-group">
                        <label class="control-label" for="txtBairroFormAlteracao">Bairro</label>
                        <asp:TextBox ID="txtBairroFormAlteracao" runat="server" CssClass="form-control" ReadOnly="false" MaxLength="20"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3">
                    <div class="form-group">
                        <label class="control-label" for="txtCidadeFormAlteracao">Cidade</label>
                        <asp:TextBox ID="txtCidadeFormAlteracao" runat="server" CssClass="form-control" ReadOnly="false" MaxLength="40"></asp:TextBox>
                    </div>
                    
                </div>
                <div class="col-md-1 col-sm-1">
                    <div class="form-group">
                        <label class="control-label" for="txtEstadoFormAlteracao">Estado</label>
                        <asp:TextBox ID="txtEstadoFormAlteracao" runat="server" CssClass="form-control" ReadOnly="false" MaxLength="2"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-2 col-sm-2">
                    <div class="form-group">
                        <label class="control-label" for="txtCEP">CEP</label>
                        <asp:TextBox ID="txtCEPFormAlteracao" runat="server" CssClass="form-control" ReadOnly="false" MaxLength="8"></asp:TextBox>
                    </div>
                </div>
            </div> <%--Linha Endereço--%>
            <div class="row">
                <div class="col-md-1 col-sm-1">
                    <div class="form-group">
                        <label class="control-label" for="txtDDDFormAlteracao">DDD</label>
                        <asp:TextBox ID="txtDDDFormAlteracao" runat="server" CssClass="form-control" ReadOnly="false" MaxLength="3"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3">
                    <div class="form-group">
                        <label class="control-label" for="txtTelefoneFormAlteracao">Telefone Principal</label>
                        <asp:TextBox ID="txtTelefoneFormAlteracao" runat="server" CssClass="form-control" ReadOnly="false" MaxLength="10"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-2 col-sm-2">
                    <div class="form-group">
                        <label class="control-label" for="txtTel2FormAlteracao">Telefone Alternativo</label>
                        <asp:TextBox ID="txtTel2FormAlteracao" runat="server" CssClass="form-control" ReadOnly="false" MaxLength="10"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3">
                    <div class="form-group">
                        <label class="control-label" for="txtCelularFormAlteracao">Celular Principal</label>
                        <asp:TextBox ID="txtCelularFormAlteracao" runat="server" CssClass="form-control" ReadOnly="false" MaxLength="10"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3">
                    <div class="form-group">
                        <label class="control-label" for="txtCel2FormAlteracao">Celular Alternativo</label>
                        <asp:TextBox ID="txtCel2FormAlteracao" runat="server" CssClass="form-control" ReadOnly="false" MaxLength="10"></asp:TextBox>
                    </div>
                </div>
            </div> <%--Linha Contatos--%>
            <div class="row">
                <div class="col-md-4 col-sm-4">
                    <div class="form-group">
                        <label class="control-label" for="txtEmailFormAlteracao">E-mail</label>
                        <asp:TextBox ID="txtEmailFormAlteracao" runat="server" CssClass="form-control" ReadOnly="false" MaxLength="50"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4">
                    <div class="form-group">
                        <label class="control-label" for="txtEmail2FormAlteracao">E-mail Alternativo</label>
                        <asp:TextBox ID="txtEmail2FormAlteracao" runat="server" CssClass="form-control" ReadOnly="false" MaxLength="50"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-2 col-sm-2">
                    <div class="form-group">
                        <label class="control-label" for="txtDataNascimentoFormAlteracao">Nascimento</label>
                        <asp:TextBox ID="txtDataNascimentoFormAlteracao" runat="server" CssClass="form-control" ReadOnly="false" MaxLength="8"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-2 col-sm-2">
                    <div class="form-group">
                        <label class="control-label" for="txtClienteDesdeFormAlteracao">Cliente Desde</label>
                        <asp:TextBox ID="txtClienteDesdeFormAlteracao" runat="server" CssClass="form-control" ReadOnly="false" MaxLength="8"></asp:TextBox>
                    </div>
                </div>
            </div> <%--Linha E-mail e datas--%>
            <div class="row">
                <div class="col-md-6 col-sm-6">
                    <div class="form-group">
                        <label class="control-label" for="txtObservacoesFormAlteracao">Observações</label>
                        <asp:TextBox ID="txtObservacoesFormAlteracao" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" ReadOnly="false" MaxLength="300"></asp:TextBox>
                    </div>
                </div>
            </div> <%--Linha Observações--%>
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <asp:Button ID="btnSalvarFormAlteracao" runat="server" Text="Salvar" CssClass="btn btn-success btn-sm" OnClick="btnSalvarFormAlteracao_Click"/>
                    <asp:Button ID="btnSairFormAlteracao" runat="server" Text="Cancelar" CssClass="btn btn btn-danger btn-sm" OnClientClick="window.close();"/>
                </div>
            </div> <%--Linha de Botões--%>
        </div>
    </form>
</body>
    <script>
		jQuery(function($){
		    $("#txtCPFFormAlteracao").mask("999.999.999-99");
		    $("#txtCNPJFormAlteracao").mask("99.999.999/9999-99");
		    $("#txtCEPFormAlteracao").mask("99999-999");
		    $("#txtTelefoneFormAlteracao").mask("9999-9999");
		    $("#txtTel2FormAlteracao").mask("9999-9999");
		    $("#txtCelularFormAlteracao").mask("99999-9999");
		    $("#txtCel2FormAlteracao").mask("99999-9999");
		    $("#txtDataNascimentoFormAlteracao").mask("99/99/9999");
		    $("#txtClienteDesdeFormAlteracao").mask("99/99/9999");
		    $("#txtDDDFormAlteracao").mask("999");
		});
	</script>
</html>
