<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="alteracaoEquipamentos.aspx.cs" Inherits="SGNWeb.alteracaoEquipamentos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="Content/bootstrap.css" rel="stylesheet"/>
    <script src="Scripts/jquery-1.9.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/jquery.maskedinput-1.3.min.js"></script>
    <title>SGN Web - Atualização do Equipamento</title>
    <script type="text/javascript">
        function ShowModal(titulo, detalhes) {
            $("#myModal").modal('show');
            $('.modal-title').text(titulo);
            $('.modal-body').text(detalhes);
        }
    </script>
    <script>
        jQuery(function ($) {
            $("#txtDataCadastro").mask("99/99/9999");
        });
    </script>
</head>
    <body>
        <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row" style="margin-bottom:10px">
                <div class="col-md-12 col-sm-12" style="background-color:black">
                    <h3 class="text-center" style="color: white">Edição do Equipamento</h3>
                </div>
            </div> <%--Linha Título--%>
            <div class="row">
                <div class="form-group col-md-3 col-sm-3">
                    <label class="control-label" for="txtTipoFrmAltEq">Tipo do Equipamento</label>
                    <asp:TextBox ID="txtTipoFrmAltEq" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                </div>
                <div class="form-group col-md-2 col-sm-2">
                    <label class="control-label" for="txtIDClienteFrmAltEq">ID Cliente:</label>
                    <asp:TextBox ID="txtIDClienteFrmAltEq" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                </div>
                <div class="form-group col-md-7 col-sm-7">
                    <label class="control-label" for="txtNomeClienteFrmAltEq">Nome do Cliente:</label>
                    <asp:TextBox ID="txtNomeClienteFrmAltEq" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                </div>
            </div> <%--Linha Tipo do Equipamento e Cliente--%>
            <div class="row">
                <div class="form-group col-md-3 col-sm-3">
                    <label class="control-label" for="txtMarcaFrmAltEq">Marca</label>
                        <asp:TextBox ID="txtMarcaFrmAltEq" runat="server" CssClass="form-control" MaxLength="20" ReadOnly="True"></asp:TextBox>
                </div>
                <div class="form-group col-md-3 col-sm-3">
                    <label class="control-label" for="txtModeloFrmAltEq">Modelo</label>
                        <asp:TextBox ID="txtModeloFrmAltEq" runat="server" CssClass="form-control" MaxLength="30" ReadOnly="True"></asp:TextBox>
                </div>
                <div class="form-group col-md-3 col-sm-3">
                    <label class="control-label" for="txtNumSerieFrmAltEq">Número de Série</label>
                        <asp:TextBox ID="txtNumSerieFrmAltEq" runat="server" CssClass="form-control" MaxLength="20" ReadOnly="True"></asp:TextBox>
                </div>
                <div class="form-group col-md-3 col-sm-3">
                    <label class="control-label" for="txtDataCadastroFrmAltEq">Data de Cadastro</label>
                        <asp:TextBox ID="txtDataCadastroFrmAltEq" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                </div>
            </div> <%--Linha Marca, Modelo, Número de Série e Data de cadastro--%>
            <div class="row">
                <div class="form-group col-md-12 col-sm-12">
                    <label class="control-label" for="txtDescricaoFrmAltEq">Descrição</label>
                    <asp:TextBox ID="txtDescricaoFrmAltEq" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" MaxLength="300"></asp:TextBox>
                </div>
            </div> <%--Linha Descrição--%>
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <asp:Button ID="btnSalvarEquiptoFrmAltEq" runat="server" Text="Salvar" CssClass="btn btn-success btn-sm" OnClick="btnSalvarEquiptoFrmAltEq_Click"/>
                    <asp:Button ID="btnSairEquiptoFrmAltEq" runat="server" Text="Cancelar" CssClass="btn btn btn-danger btn-sm" OnClientClick="window.close();" />
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
