<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="detalhesEquipamentos.aspx.cs" Inherits="SGNWeb.detalhesEquipamentos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <title>SGN Web - Detalhes do Equipamento</title>
    <script>
        jQuery(function ($) {
            $("#txtDataCadastroFrmDetalhesEquipto").mask("99/99/9999");
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row" style="margin-bottom:10px">
                <div class="col-md-12 col-sm-12" style="background-color:black">
                    <h3 class="text-center" style="color: white">Detalhes do Equipamento</h3>
                </div>
            </div> <%--Linha Título--%>
            <div class="row">
                <div class="form-group col-md-3 col-sm-3">
                    <label class="control-label" for="txtTipoFrmDetalhesEquipto">Tipo do Equipamento</label>
                    <asp:TextBox ID="txtTipoFrmDetalhesEquipto" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                </div>
                <div class="form-group col-md-2 col-sm-2">
                    <label class="control-label" for="txtIDClienteFrmDetalhesEquipto">ID Cliente:</label>
                    <asp:TextBox ID="txtIDClienteFrmDetalhesEquipto" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                </div>
                <div class="form-group col-md-7 col-sm-7">
                    <label class="control-label" for="txtNomeClienteFrmDetalhesEquipto">Nome do Cliente:</label>
                    <asp:TextBox ID="txtNomeClienteFrmDetalhesEquipto" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                </div>
            </div> <%--Linha Tipo do Equipamento e Cliente--%>
            <div class="row">
                <div class="form-group col-md-3 col-sm-3">
                    <label class="control-label" for="txtMarcaFrmDetalhesEquipto">Marca</label>
                        <asp:TextBox ID="txtMarcaFrmDetalhesEquipto" runat="server" CssClass="form-control" MaxLength="20" ReadOnly="True"></asp:TextBox>
                </div>
                <div class="form-group col-md-3 col-sm-3">
                    <label class="control-label" for="txtModeloFrmDetalhesEquipto">Modelo</label>
                        <asp:TextBox ID="txtModeloFrmDetalhesEquipto" runat="server" CssClass="form-control" MaxLength="30" ReadOnly="True"></asp:TextBox>
                </div>
                <div class="form-group col-md-3 col-sm-3">
                    <label class="control-label" for="txtNumSerieFrmDetalhesEquipto">Número de Série</label>
                        <asp:TextBox ID="txtNumSerieFrmDetalhesEquipto" runat="server" CssClass="form-control" MaxLength="20" ReadOnly="True"></asp:TextBox>
                </div>
                <div class="form-group col-md-3 col-sm-3">
                    <label class="control-label" for="txtDataCadastroFrmDetalhesEquipto">Data de Cadastro</label>
                        <asp:TextBox ID="txtDataCadastroFrmDetalhesEquipto" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                </div>
            </div> <%--Linha Marca, Modelo, Número de Série e Data de cadastro--%>
            <div class="row">
                <div class="form-group col-md-12 col-sm-12">
                    <label class="control-label" for="txtDescricaoFrmDetalhesEquipto">Descrição</label>
                    <asp:TextBox ID="txtDescricaoFrmDetalhesEquipto" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" MaxLength="300" ReadOnly="True"></asp:TextBox>
                </div>
            </div> <%--Linha Descrição--%>
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <asp:Button ID="btnSairEquiptoFrmDetalhesEquipto" runat="server" Text="Cancelar" CssClass="btn btn btn-danger btn-sm" OnClientClick="window.close();" />
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
