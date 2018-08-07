<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cadastroServicos.aspx.cs" Inherits="SGNWeb.cadastroServicos"%>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="Content/bootstrap.css" rel="stylesheet"/>
    <script src="Scripts/jquery-1.9.1.js"></script>
    <script src="Scripts/jquery.maskMoney.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <title>SGN Web - Cadastro de Serviços</title>
    <script type="text/javascript">
        $(function () {
            $("#txtPrecoSrv").maskMoney({
                symbol: 'R$ ',
                showSymbol: true, thousands: '.', decimal: ',', symbolStay: true
            });
        })
    </script>
    <script type="text/javascript">
        function ShowModal(titulo, detalhes) {
            $("#AvisoModal").modal('show');
            $('.modal-title').text(titulo);
            $('.modal-body').text(detalhes);
        }
    </script>
    
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row" style="margin-bottom: 10px">
                <div class="col-md-12 col-sm-12" style="background-color: black">
                    <h3 class="text-center" style="color: white">Cadastro de Serviços</h3>
                </div>
            </div><%--Linha Título--%>
            <div class="row">
                <div class="form-group col-md-3 col-sm-3">
                    <label class="control-label" for="txtCodSrv">Código:</label>
                    <asp:TextBox ID="txtCodSrv" runat="server" CssClass="form-control" MaxLength="6"></asp:TextBox>
                </div>
                <div class="form-group col-md-9 col-sm-9">
                    <label class="control-label" for="txTituloSrv">Título:</label>
                    <asp:TextBox ID="txTituloSrv" runat="server" CssClass="form-control" MaxLength="200"></asp:TextBox>
                </div>
            </div><%--Linha Código e Título--%>
            <div class="row">
                <div class="form-group col-md-9 col-sm-9">
                    <label class="control-label" for="txtDescSrv">Descrição:</label>
                    <asp:TextBox ID="txtDescSrv" runat="server" CssClass="form-control" MaxLength="300" TextMode="MultiLine" Rows="3"></asp:TextBox>
                </div>
                <div class="form-group col-md-3 col-sm-3">
                    <label class="control-label" for="txtPrecoSrv">Preço:</label>
                    <asp:TextBox ID="txtPrecoSrv" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div><%--Linha Descrição e Preço--%>
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <asp:Button ID="btnSalvarServico" runat="server" Text="Salvar" CssClass="btn btn-success btn-sm" OnClick="btnSalvarServico_Click" />
                    <asp:Button ID="btnSairServico" runat="server" Text="Cancelar" CssClass="btn btn btn-danger btn-sm" OnClientClick="window.close();" />
                </div>
            </div><%--Linha de Botões--%>
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <div class="modal fade" id="AvisoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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
