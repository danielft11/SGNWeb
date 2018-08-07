<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListaClientes.aspx.cs" Inherits="SGNWeb.ListaClientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="Content/bootstrap.css" rel="stylesheet"/>
    <script src="Scripts/jquery-1.9.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <title>SGN Web - Lista de Clientes</title>
    <script type="text/javascript">
        function sendValues(ID, Nome) {
            window.opener.document.forms.form1.txtIDCliente.value = ID;
            window.opener.document.forms.form1.txtNomeCliente.value = Nome;
            window.close();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row" style="margin-bottom: 10px">
                <div class="col-md-12 col-sm-12" style="background-color: black">
                    <h3 class="text-center" style="color: white">Lista de Clientes</h3>
                </div>
            </div><%--Linha Título--%>
            <div class="row" style="margin-bottom: 10px;">
                <div class="col-md-12 col-sm-12">
                    <div class="input-group"> 
                        <span class="input-group-btn">
                            <asp:LinkButton ID="btnPesquisa" CssClass="btn btn-info" runat="server" ToolTip="Filtrar">
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                            </asp:LinkButton>
                        </span>
                        <asp:TextBox ID="txtCliente" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
            </div><%--Linha de filtro--%> 
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <div class="table-responsive">
                        <asp:GridView ID="GVClientes" runat="server" CssClass="table table-striped" 
                        GridLines="None" AllowPaging="True" PageSize="8" AutoGenerateColumns="False"
                        OnPageIndexChanging="GVClientes_PageIndexChanging" DataKeyNames="IdCliente" OnRowCommand="GVClientes_RowCommand">
                        <Columns>
                            <asp:ButtonField CommandName="Selecionar" HeaderText="Selecionar" Text="Selecionar" ControlStyle-CssClass="btn btn-success"
                                HeaderStyle-BackColor="#666666" HeaderStyle-ForeColor="White"  ButtonType="Button"
                                />
                            <asp:BoundField DataField="IdCliente" HeaderText="ID" ReadOnly="True">
                                <HeaderStyle BackColor="#666666" ForeColor="White" />
                            </asp:BoundField>

                            <asp:BoundField DataField="Nome" HeaderText="Nome - Razão Social" ReadOnly="True" HeaderStyle-Wrap="False" ItemStyle-Wrap="False" HtmlEncode="False">
                                <HeaderStyle Wrap="False" BackColor="#666666" ForeColor="White" />
                                <ItemStyle Wrap="False"></ItemStyle>
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                    </div>
                </div>
            </div><%--Linha do Grid--%>
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-danger btn-sm" OnClientClick="window.close();"/>
                </div>
            </div><%--Linha de Botões--%>
        </div>
    </form>
</body>
</html>
