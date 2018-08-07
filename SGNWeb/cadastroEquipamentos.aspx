<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cadastroEquipamentos.aspx.cs" Inherits="SGNWeb.cadastroEquipamentos" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="Content/bootstrap.css" rel="stylesheet"/>
    <script src="Scripts/jquery-1.9.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/jquery.maskedinput-1.3.min.js"></script>
    <title>SGN Web - Cadastro de Equipamentos</title>
    <script type="text/javascript">
        function ShowModal(titulo, detalhes) {
            $("#myModal").modal('show');
            $('.modal-title').text(titulo);
            $('.modal-body').text(detalhes);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptLocalization="True" EnableScriptGlobalization="True"></asp:ScriptManager>
        <div class="container-fluid">
            <div class="row" style="margin-bottom:10px">
                <div class="col-md-12 col-sm-12" style="background-color:black">
                    <h3 class="text-center" style="color: white">Cadastro de Equipamentos</h3>
                </div>
            </div> <%--Linha Título--%>
            <div class="row">
                <div class="form-group col-md-3 col-sm-3">
                    <label class="control-label" for="DDLTipoEquipto">Tipo do Equipamento</label>
                    <asp:DropDownList ID="DDLTipoEquipto" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                </div>
                <div class="form-group col-md-2 col-sm-2">
                    <label class="control-label" for="txtIDCliente">ID Cliente:</label>
                    <div class="input-group">
                        <span class="input-group-btn">
                            <asp:LinkButton ID="btnPesquisaCliente" CssClass="btn btn-info" runat="server" ToolTip="Filtrar" OnClientClick="window.open('ListaClientes.aspx', 'width=600', '_parent')">
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                            </asp:LinkButton>
                        </span>
                        <asp:TextBox ID="txtIDCliente" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group col-md-7 col-sm-7">
                    <label class="control-label" for="txtNomeCliente">Nome do Cliente:</label>
                    <asp:TextBox ID="txtNomeCliente" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                </div>
            </div> <%--Linha Tipo do Equipamento e Cliente--%>
            <div class="row">
                <div class="form-group col-md-3 col-sm-3">
                    <label class="control-label" for="txtMarca">Marca</label>
                        <asp:TextBox ID="txtMarca" runat="server" CssClass="form-control" MaxLength="20"></asp:TextBox>
                </div>
                <div class="form-group col-md-3 col-sm-3">
                    <label class="control-label" for="txtModelo">Modelo</label>
                        <asp:TextBox ID="txtModelo" runat="server" CssClass="form-control" MaxLength="30"></asp:TextBox>
                </div>
                <div class="form-group col-md-3 col-sm-3">
                    <label class="control-label" for="txtNumSerie">Número de Série</label>
                        <asp:TextBox ID="txtNumSerie" runat="server" CssClass="form-control" MaxLength="20"></asp:TextBox>
                </div>
                <div class="form-group col-md-3 col-sm-3">
                    <label class="control-label" for="txtDataCadastro">Data de Cadastro</label>
                        <asp:TextBox ID="txtDataCadastro" runat="server" CssClass="form-control"></asp:TextBox>
                        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDataCadastro" Format="dd/MM/yyyy"/>
                </div>
            </div> <%--Linha Marca, Modelo, Número de Série e Data de cadastro--%>
            <div class="row">
                <div class="form-group col-md-12 col-sm-12">
                    <label class="control-label" for="txtDescricao">Descrição</label>
                    <asp:TextBox ID="txtDescricao" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" MaxLength="300"></asp:TextBox>
                </div>
            </div> <%--Linha Descrição--%>
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <asp:Button ID="btnSalvarEquipto" runat="server" Text="Salvar" CssClass="btn btn-success btn-sm" OnClick="btnSalvarEquipto_Click"/>
                    <asp:Button ID="btnSairEquipto" runat="server" Text="Cancelar" CssClass="btn btn btn-danger btn-sm" OnClientClick="window.close();" />
                </div>
            </div> <%--Linha de Botões--%>
            <div class="row">
            <div class="col-md-12 col-sm-12">
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel"></h4>
                            </div>
                            <div class="modal-body">
                                <p></p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
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
