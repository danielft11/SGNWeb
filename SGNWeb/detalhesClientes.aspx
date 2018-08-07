<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="~/detalhesClientes.aspx.cs" Inherits="SGNWeb.detalhesClientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="Content/bootstrap.css" rel="stylesheet"/>
    <script src="Scripts/jquery-1.9.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <title>SGN Web - Detalhes do cliente</title>
    <script src="Scripts/jquery.maskedinput-1.3.min.js"></script>
</head>
<body>
    <form id="formDetalhes" runat="server">
        <div class="container-fluid">
            <div class="row" style="margin-bottom:10px">
                <div class="col-md-12 col-sm-12" style="background-color:black">
                    <h3 class="text-center" style="color: white">Detalhes do cliente</h3>
                </div>
            </div> <%--Linha Título--%>
            <div class="row">
                <div class="col-md-1 col-sm-1">
                    <div class="form-group">
                        <label class="control-label" for="txtIdClienteFormDetalhes">ID</label>
                        <asp:TextBox ID="txtIdClienteFormDetalhes" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-5 col-sm-5">
                    <div class="form-group">
                        <label class="control-label" for="txtNomeFormDetalhes">Nome ou Razão Social</label>
                        <asp:TextBox ID="txtNomeFormDetalhes" runat="server" CssClass="form-control" ReadOnly="True" MaxLength="50"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6">
                    <div class="form-group">
                        <label class="control-label" for="txtNomeFantasiaFormDetalhes">Nome Fantasia</label>
                        <asp:TextBox ID="txtNomeFantasiaFormDetalhes" runat="server" CssClass="form-control" ReadOnly="True" MaxLength="50"></asp:TextBox>
                    </div>
                </div>
            </div> <%--Linha Nome|Razão Social e Nome Fantasia--%> 
            <div class="row">
                <div class="col-md-3 col-sm-3">
                    <div class="form-group">
                        <label class="control-label" for="txtCPFFormDetalhes">CPF</label>
                        <asp:TextBox ID="txtCPFFormDetalhes" runat="server" CssClass="form-control" ReadOnly="True" MaxLength="11"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3">
                    <div class="form-group">
                        <label class="control-label" for="txtIdentidadeFormDetalhes">Identidade</label>
                        <asp:TextBox ID="txtIdentidadeFormDetalhes" runat="server" CssClass="form-control" ReadOnly="True" MaxLength="14"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3">
                    <div class="form-group">
                        <label class="control-label" for="txtCNPJFormDetalhes">CNPJ</label>
                        <asp:TextBox ID="txtCNPJFormDetalhes" runat="server" CssClass="form-control" ReadOnly="True" MaxLength="14"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3">
                    <div class="form-group">
                        <label class="control-label" for="txtInscEstadualFormDetalhes">Inscrição Estadual</label>
                        <asp:TextBox ID="txtInscEstadualFormDetalhes" runat="server" CssClass="form-control" ReadOnly="True" MaxLength="9"></asp:TextBox>
                    </div>
                </div>
            </div> <%--Linha CPF, CNPJ, Identidade e Inscrição Estadual--%>
            <div class="row">
                <div class="col-md-4 col-sm-4">
                    <div class="form-group">
                        <label class="control-label" for="txtEnderecoFormDetalhes">Endereco</label>
                        <asp:TextBox ID="txtEnderecoFormDetalhes" runat="server" CssClass="form-control" ReadOnly="True" MaxLength="50"></asp:TextBox>     
                    </div> 
                </div>
                <div class="col-md-2 col-sm-2">
                    <div class="form-group">
                        <label class="control-label" for="txtBairroFormDetalhes">Bairro</label>
                        <asp:TextBox ID="txtBairroFormDetalhes" runat="server" CssClass="form-control" ReadOnly="True" MaxLength="20"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3">
                    <div class="form-group">
                        <label class="control-label" for="txtCidadeFormDetalhes">Cidade</label>
                        <asp:TextBox ID="txtCidadeFormDetalhes" runat="server" CssClass="form-control" ReadOnly="True" MaxLength="40"></asp:TextBox>
                    </div>
                    
                </div>
                <div class="col-md-1 col-sm-1">
                    <div class="form-group">
                        <label class="control-label" for="txtEstadoFormDetalhes">Estado</label>
                        <asp:TextBox ID="txtEstadoFormDetalhes" runat="server" CssClass="form-control" ReadOnly="True" MaxLength="2"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-2 col-sm-2">
                    <div class="form-group">
                        <label class="control-label" for="txtCEP">CEP</label>
                        <asp:TextBox ID="txtCEP" runat="server" CssClass="form-control" ReadOnly="True" MaxLength="8"></asp:TextBox>
                    </div>
                </div>
            </div> <%--Linha Endereço--%>
            <div class="row">
                <div class="col-md-1 col-sm-1">
                    <div class="form-group">
                        <label class="control-label" for="txtDDDFormDetalhes">DDD</label>
                        <asp:TextBox ID="txtDDDFormDetalhes" runat="server" CssClass="form-control" ReadOnly="True" MaxLength="3"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3">
                    <div class="form-group">
                        <label class="control-label" for="txtTelefoneFormDetalhes">Telefone Principal</label>
                        <asp:TextBox ID="txtTelefoneFormDetalhes" runat="server" CssClass="form-control" ReadOnly="True" MaxLength="10"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-2 col-sm-2">
                    <div class="form-group">
                        <label class="control-label" for="txtTel2FormDetalhes">Telefone Alternativo</label>
                        <asp:TextBox ID="txtTel2FormDetalhes" runat="server" CssClass="form-control" ReadOnly="True" MaxLength="10"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3">
                    <div class="form-group">
                        <label class="control-label" for="txtCelularFormDetalhes">Celular Principal</label>
                        <asp:TextBox ID="txtCelularFormDetalhes" runat="server" CssClass="form-control" ReadOnly="True" MaxLength="10"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3">
                    <div class="form-group">
                        <label class="control-label" for="txtCel2FormDetalhes">Celular Alternativo</label>
                        <asp:TextBox ID="txtCel2FormDetalhes" runat="server" CssClass="form-control" ReadOnly="True" MaxLength="10"></asp:TextBox>
                    </div>
                </div>
            </div> <%--Linha Contatos--%>
            <div class="row">
                <div class="col-md-4 col-sm-4">
                    <div class="form-group">
                        <label class="control-label" for="txtEmailFormDetalhes">E-mail</label>
                        <asp:TextBox ID="txtEmailFormDetalhes" runat="server" CssClass="form-control" ReadOnly="True" MaxLength="50"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4">
                    <div class="form-group">
                        <label class="control-label" for="txtEmail2FormDetalhes">E-mail Alternativo</label>
                        <asp:TextBox ID="txtEmail2FormDetalhes" runat="server" CssClass="form-control" ReadOnly="True" MaxLength="50"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-2 col-sm-2">
                    <div class="form-group">
                        <label class="control-label" for="txtDataNascimentoFormDetalhes">Nascimento</label>
                        <asp:TextBox ID="txtDataNascimentoFormDetalhes" runat="server" CssClass="form-control" ReadOnly="True" MaxLength="8"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-2 col-sm-2">
                    <div class="form-group">
                        <label class="control-label" for="txtClienteDesdeFormDetalhes">Cliente Desde</label>
                        <asp:TextBox ID="txtClienteDesdeFormDetalhes" runat="server" CssClass="form-control" ReadOnly="True" MaxLength="8"></asp:TextBox>
                    </div>
                </div>
            </div> <%--Linha E-mail e datas--%>
            <div class="row">
                <div class="col-md-6 col-sm-6">
                    <div class="form-group">
                        <label class="control-label" for="txtObservacoesFormDetalhes">Observações</label>
                        <asp:TextBox ID="txtObservacoesFormDetalhes" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" ReadOnly="True" MaxLength="300"></asp:TextBox>
                    </div>
                </div>
            </div> <%--Linha Observações--%>
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <asp:Button ID="btnSairFormDetalhes" runat="server" Text="Cancelar" CssClass="btn btn btn-danger btn-sm" OnClientClick="window.close();"/>
                </div>
            </div> <%--Linha de Botões--%>
        </div>
    </form>
</body>
        <script>
		jQuery(function($){
		    $("#txtTelefoneFormDetalhes").mask("9999-9999");
		    $("#txtTel2FormDetalhes").mask("9999-9999");
		    $("#txtCelularFormDetalhes").mask("99999-9999");
		    $("#txtCel2FormDetalhes").mask("99999-9999");
		});
	</script>
</html>
