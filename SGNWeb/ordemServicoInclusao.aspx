<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ordemServicoInclusao.aspx.cs" Inherits="SGNWeb.ordemServicoInclusao" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="Content/bootstrap.css" rel="stylesheet"/>
    <link href="Content/padrao.css" rel="stylesheet" />
    <link href="Content/jquery.maxlength.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/jquery.maskedinput-1.3.min.js"></script>
    <script src="Scripts/jquery.plugin.js"></script>
    <script src="Scripts/jquery.maxlength.js"></script>
    <script src="Scripts/jquery.maskMoney.js"></script>
    <title>SGN Web - Inclusão de Ordem de Serviço</title>
    <script>
        jQuery(function ($) {
            $("#txtTelCli").mask("9999-9999");
            $("#txtCelCli").mask("99999-9999");
            $("#txtDDD").mask("999");
        });
    </script>
    <script>
        $(function () {
            $('#txtDefeito').maxlength({max: 500});
        });
        $(function () {
            $('#txtDiagnostico').maxlength({ max: 600 });
        });
        $(function () {
            $('#txtResultado').maxlength({ max: 600 });
        });
    </script>
    <script type="text/javascript">
        $(function () {
            $("#txtValUnit").maskMoney({
                symbol: 'R$ ',
                showSymbol: true, thousands: '', decimal: ',', symbolStay: true
            });
        })
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScManagerOS" runat="server" EnableScriptLocalization="True" EnableScriptGlobalization="True"></asp:ScriptManager>
        <section class="container-fluid">
            <asp:UpdatePanel ID="UpdPanelCampos" runat="server">
                <ContentTemplate>
                    <div class="row" style="margin-bottom: 10px">
                        <div class="col-md-12 col-sm-12" style="background-color: black">
                            <h3 class="text-center" style="color: white">Inclusão de Ordem de Serviço</h3>
                        </div>
                    </div><%--Linha do título--%>                   
                    <div class="row">
                        <fieldset class="col-md-12 col-sm-12">
                            <legend>Dados Gerais</legend>
                        </fieldset>
                    </div><%--Dados gerais--%>                   
                    <div class="row">
                        <div class="col-md-2 col-sm-2">
                            <div class="form-group">
                                <label class="control-label" for="txtNumOS">OS nº</label>
                                <asp:TextBox ID="txtNumOS" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-2 col-sm-2">
                            <div class="form-group">
                                <label class="control-label" for="txtDtInicio">Início</label>
                                <asp:TextBox ID="txtDtInicio" runat="server" CssClass="form-control" MaxLength="8"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="CalExtenderDtInicio" runat="server" TargetControlID="txtDtInicio" Format="dd/MM/yyyy" />
                            </div>
                        </div>
                        <div class="col-md-2 col-sm-2">
                            <div class="form-group">
                                <label class="control-label" for="txtDtConclusao">Conclusão</label>
                                <asp:TextBox ID="txtDtConclusao" runat="server" CssClass="form-control" MaxLength="8"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="CalExtenderDtConclusao" runat="server" TargetControlID="txtDtConclusao" Format="dd/MM/yyyy" />
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-3">
                            <div class="form-group">
                                <label class="control-label" for="txtIDCli">ID do Cliente</label>
                                <div class="input-group">
                                    <span class="input-group-btn">
                                        <asp:LinkButton ID="btnBuscaCli" CssClass="btn btn-default" runat="server" ToolTip="Filtrar" OnClick="btnBuscaCli_Click">
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                        </asp:LinkButton>
                                    </span>
                                    <asp:TextBox ID="txtIDCli" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-3">
                            <div class="form-group">
                                <label class="control-label" for="txtIdEquipto">ID do Equipto</label>
                                <div class="input-group">
                                    <span class="input-group-btn">
                                        <asp:LinkButton ID="btnBuscaEquipto" CssClass="btn btn-default" runat="server" ToolTip="Filtrar" OnClick="btnBuscaEquipto_Click">
                                        <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                        </asp:LinkButton>
                                    </span>
                                    <asp:TextBox ID="txtIdEquipto" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div><%--Linha núm OS, data início e conclusão, ID do cliente e ID do equipamento--%>                   
                    <div class="row">
                        <div class="form-group col-md-3 col-sm-3">
                            <label class="control-label" for="txtNomeCli">Cliente</label>
                            <asp:TextBox ID="txtNomeCli" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-2 col-sm-2">
                            <label class="control-label" for="txtDDDCli">DDD</label>
                            <asp:TextBox ID="txtDDDCli" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-2 col-sm-2">
                            <label class="control-label" for="txtTelCli">Telefone</label>
                            <asp:TextBox ID="txtTelCli" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-2 col-sm-2">
                            <label class="control-label" for="txtCelCli">Celular</label>
                            <asp:TextBox ID="txtCelCli" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-3 col-sm-3">
                            <label class="control-label" for="txtEmailCli">E-mail</label>
                            <asp:TextBox ID="txtEmailCli" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                        </div>
                    </div><%--Linha nome do cliente, DDD, telefone, celular e e-mail--%>                    
                    <div class="row">
                        <div class="form-group col-md-3 col-sm-3">
                            <label class="control-label" for="txtTipoEquipto">Tipo Equipto</label>
                            <asp:TextBox ID="txtTipoEquipto" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-3 col-sm-3">
                            <label class="control-label" for="txtMarcaEquipto">Marca</label>
                            <asp:TextBox ID="txtMarcaEquipto" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-3 col-sm-3">
                            <label class="control-label" for="txtModeloEquipto">Modelo</label>
                            <asp:TextBox ID="txtModeloEquipto" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-3 col-sm-3">
                            <label class="control-label" for="txtNSEquipto">N/S</label>
                            <asp:TextBox ID="txtNSEquipto" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                        </div>
                    </div><%--Linha tipo do equipamento, marca, modelo e N/S--%>                   
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="GVClientesOS" EventName="RowCommand" />
                    <asp:AsyncPostBackTrigger ControlID="GVEquiptosOS" EventName="RowCommand" />
                </Triggers>
            </asp:UpdatePanel>
            <div class="row">
                <fieldset class="col-md-12 col-sm-12">
                    <legend>Dados do Serviço</legend>
                </fieldset>
            </div><%--Linha dados do serviço--%>
            <div class="row">
                <div class="form-group col-md-4 col-sm-4">
                    <label class="control-label" for="txtDefeito">Defeito</label>
                    <asp:TextBox ID="txtDefeito" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group col-md-4 col-sm-4">
                    <label class="control-label" for="txtDiagnostico">Diagnóstico</label>
                    <asp:TextBox ID="txtDiagnostico" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control" MaxLength="600"></asp:TextBox>
                </div>
                 <div class="form-group col-md-4 col-sm-4">
                    <label class="control-label" for="txtResultado">Resultado</label>
                    <asp:TextBox ID="txtResultado" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control" MaxLength="600"></asp:TextBox>
                </div>
            </div><%--Linha dados do defeito, diagnóstico e resultado--%>
            <div class="row">
                <fieldset class="col-md-12 col-sm-12">
                    <legend>Serviços</legend>
                </fieldset>
            </div><%--Linha itens do orçamento--%>          
            <div class="row">
                <asp:UpdatePanel ID="UpdPanelItens" runat="server">
                    <ContentTemplate>
                        <div class="form-group col-md-2 col-sm-2 col-md-offset-1 col-sm-offset-1">
                            <asp:HiddenField ID="HFieldID" runat="server" />
                            <label class="control-label" for="txtCodItem">Código</label>
                            <div class="input-group">
                                <span class="input-group-btn">
                                    <asp:LinkButton ID="btnBuscaServico" CssClass="btn btn-default" runat="server" ToolTip="Filtrar" OnClick="btnBuscaServico_Click">
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                    </asp:LinkButton>
                                </span>
                                <asp:TextBox ID="txtCodItem" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group col-md-5 col-sm-5">
                            <label class="control-label" for="txtTituloItem">Título</label>
                            <asp:TextBox ID="txtTituloItem" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-1 col-sm-1">
                            <label class="control-label" for="txtValUnit">R$ Unitário</label>
                            <asp:TextBox ID="txtValUnit" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-1 col-sm-1">
                            <label class="control-label" for="txtQtdItem">Quantidade</label>
                            <input type="text" runat="server" id="txtQtdItem" class="form-control" onblur="CalcularValorParcial()" />
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="GVServicosOS" EventName="RowCommand" />
                    </Triggers>
                </asp:UpdatePanel>
                <div class="form-group col-md-1 col-sm-1">
                    <label class="control-label" for="txtValParcial">Ações</label>
                    <div class="input-group">
                        <asp:LinkButton ID="lkBtnAdicionar" CssClass="btn btn btn-success" runat="server" ToolTip="Adic" OnClick="lkBtnAdicionar_Click">Adicionar</asp:LinkButton>
                    </div>
                </div>
            </div><%--Linha de itens: HFieldID, Código, Título, valor unitário, quantidade e valor parcial--%>                  
            <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <div class="table-responsive" style="display: block;">
                    <asp:GridView ID="GVItensOrdem" runat="server"
                        CssClass="table table-striped" GridLines="None" AllowPaging="True"
                        PageSize="5" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" DataKeyNames="ID" OnRowDeleting="GVItensOrdem_RowDeleting">
                        <Columns>
                            <asp:BoundField DataField="Item" HeaderText="Código" ReadOnly="True">
                                <HeaderStyle BackColor="#666666" ForeColor="White" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True">
                                <HeaderStyle BackColor="#666666" ForeColor="White" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Descricao" HeaderText="Descrição" ReadOnly="True" HeaderStyle-Wrap="False" ItemStyle-Wrap="False">
                                <HeaderStyle Wrap="False" BackColor="#666666" ForeColor="White" />
                                <ItemStyle Wrap="False"></ItemStyle>
                            </asp:BoundField>                         
                            <asp:BoundField DataField="ValorUnitario" HeaderText="Valor Unitário" ReadOnly="True" ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" HeaderStyle-Wrap="False" ItemStyle-Wrap="False" DataFormatString="{0:F}">
                                <HeaderStyle Wrap="False" CssClass="hidden-xs" BackColor="#666666" ForeColor="White" />
                                <ItemStyle Wrap="False" CssClass="hidden-xs"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="Quantidade" HeaderText="Quantidade" ReadOnly="True" HeaderStyle-Wrap="False" ItemStyle-Wrap="False">
                                <HeaderStyle Wrap="False" BackColor="#666666" ForeColor="White" />
                                <ItemStyle Wrap="False"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="ValorParcial" HeaderText="Valor Parcial" ReadOnly="True" ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" HeaderStyle-Wrap="False" ItemStyle-Wrap="False" DataFormatString="{0:F}">
                                <HeaderStyle Wrap="False" CssClass="hidden-xs" BackColor="#666666" ForeColor="White" />
                                <ItemStyle Wrap="False" CssClass="hidden-xs"></ItemStyle>
                            </asp:BoundField>
                            <asp:CommandField DeleteText="Excluir" HeaderText="Excluir" ShowDeleteButton="True" HeaderStyle-Wrap="False" HeaderStyle-BackColor="#666666" HeaderStyle-ForeColor="White" HeaderStyle-Width="20px" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div><%--Linha do Grid de Itens--%>
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <asp:Button ID="btnSalvarOS" runat="server" Text="Salvar" CssClass="btn btn-success btn-sm" OnClick="btnSalvarOS_Click" />
                </div>
            </div>
            <div class="row">
            <div class="col-md-12 col-sm-12">
                <div class="modal fade" id="ClientesModal" tabindex="-1" role="dialog" aria-labelledby="ClientesModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="ClientesModalLabel">Clientes</h4>
                            </div>
                            <div class="modal-body">
                                <asp:UpdatePanel ID="UpdPanelCli" runat="server">
                                    <ContentTemplate>
                                        <div class="table-responsive">
                                            <asp:GridView ID="GVClientesOS" runat="server" CssClass="table table-striped"
                                                GridLines="None" AllowPaging="True" PageSize="8" AutoGenerateColumns="False"
                                                OnPageIndexChanging="GVClientesOS_PageIndexChanging" DataKeyNames="IdCliente" OnRowCommand="GVClientesOS_RowCommand">

                                                <Columns>
                                                    <asp:ButtonField CommandName="Selecionar" HeaderText="Selecionar" Text="Selecionar" ControlStyle-CssClass="btn btn-success"
                                                        HeaderStyle-BackColor="#666666" HeaderStyle-ForeColor="White" ButtonType="Button" />

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
                                    </ContentTemplate>
                                    <Triggers>
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-dismiss="modal">Fechar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><%--Linha do Modal Clientes--%>
            <div class="row">
            <div class="col-md-12 col-sm-12">
                <div class="modal fade" id="EquiptosModal" tabindex="-1" role="dialog" aria-labelledby="EquiptosModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="EquiptosModalModalLabel">Equipamentos do cliente</h4>
                            </div>
                            <div class="modal-body">
                                <asp:UpdatePanel ID="UpdPanelEquiptos" runat="server">
                                    <ContentTemplate>
                                        <div class="table-responsive">
                                            <asp:GridView ID="GVEquiptosOS" runat="server" CssClass="table table-striped"
                                                GridLines="None" AllowPaging="True" PageSize="8" AutoGenerateColumns="False"
                                                OnPageIndexChanging="GVEquiptosOS_PageIndexChanging" DataKeyNames="IdEquipamento" OnRowCommand="GVEquiptosOS_RowCommand">

                                                <Columns>
                                                    <asp:ButtonField CommandName="Selecionar" HeaderText="Selecionar" Text="Selecionar" ControlStyle-CssClass="btn btn-success"
                                                        HeaderStyle-BackColor="#666666" HeaderStyle-ForeColor="White" ButtonType="Button" />

                                                    <asp:BoundField DataField="IdEquipamento" HeaderText="ID" ReadOnly="True">
                                                        <HeaderStyle BackColor="#666666" ForeColor="White" />
                                                    </asp:BoundField>

                                                    <asp:BoundField DataField="Nome" HeaderText="Tipo" ReadOnly="True" HeaderStyle-Wrap="False" ItemStyle-Wrap="False" HtmlEncode="False">
                                                        <HeaderStyle Wrap="False" BackColor="#666666" ForeColor="White" />
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </asp:BoundField>

                                                    <asp:BoundField DataField="Modelo" HeaderText="Modelo" ReadOnly="True" HeaderStyle-Wrap="False" ItemStyle-Wrap="False" HtmlEncode="False">
                                                        <HeaderStyle Wrap="False" BackColor="#666666" ForeColor="White" />
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </asp:BoundField>

                                                    <asp:BoundField DataField="NumSerie" HeaderText="Número de Série" ReadOnly="True" HeaderStyle-Wrap="False" ItemStyle-Wrap="False" HtmlEncode="False">
                                                        <HeaderStyle Wrap="False" BackColor="#666666" ForeColor="White" />
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </asp:BoundField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-dismiss="modal">Fechar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><%--Linha do Modal Equipamentos--%>
            <div class="row">
            <div class="col-md-12 col-sm-12">
                <div class="modal fade" id="ServicosModal" tabindex="-1" role="dialog" aria-labelledby="ServicosModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="ServicosModalLabel">Serviços</h4>
                            </div>
                            <div class="modal-body">
                                <asp:UpdatePanel ID="UpdPanelServicos" runat="server">
                                    <ContentTemplate>
                                        <div class="table-responsive">
                                            <asp:GridView ID="GVServicosOS" runat="server" CssClass="table table-striped"
                                                GridLines="None" AllowPaging="True" PageSize="8" AutoGenerateColumns="False"
                                                OnPageIndexChanging="GVServicosOS_PageIndexChanging" DataKeyNames="IdServico" OnRowCommand="GVServicosOS_RowCommand">

                                                <Columns>
                                                    <asp:ButtonField CommandName="Selecionar" HeaderText="Selecionar" Text="Selecionar" ControlStyle-CssClass="btn btn-success"
                                                        HeaderStyle-BackColor="#666666" HeaderStyle-ForeColor="White" ButtonType="Button" />

                                                    <asp:BoundField DataField="IdServico" HeaderText="ID" ReadOnly="True">
                                                        <HeaderStyle BackColor="#666666" ForeColor="White" />
                                                    </asp:BoundField>

                                                    <asp:BoundField DataField="Codigo" HeaderText="Código" ReadOnly="True" HeaderStyle-Wrap="False" ItemStyle-Wrap="False" HtmlEncode="False">
                                                        <HeaderStyle Wrap="False" BackColor="#666666" ForeColor="White" />
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </asp:BoundField>

                                                    <asp:BoundField DataField="Titulo" HeaderText="Título" ReadOnly="True" HeaderStyle-Wrap="False" ItemStyle-Wrap="False" HtmlEncode="False">
                                                        <HeaderStyle Wrap="False" BackColor="#666666" ForeColor="White" />
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </asp:BoundField>

                                                    <asp:BoundField DataField="Preco" HeaderText="Preço" ReadOnly="True" HeaderStyle-Wrap="False" ItemStyle-Wrap="False" HtmlEncode="False" DataFormatString="{0:C}">
                                                        <HeaderStyle Wrap="False" BackColor="#666666" ForeColor="White" />
                                                        <ItemStyle Wrap="False"></ItemStyle>
                                                    </asp:BoundField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-dismiss="modal">Fechar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><%--Linha do Modal Serviços--%>
            <div class="row"> 
                <div class="col-md-12 col-sm-12">           
                    <div class="modal fade" id="AlertaModal" tabindex="-1" role="dialog" aria-labelledby="AlertaModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="AlertaModalLabel">Atenção!</h4>
                                </div>
                                <div class="modal-body">
                                    <asp:UpdatePanel ID="UpdPanelAvisos" runat="server">
                                        <ContentTemplate>
                                            <p>Antes de pesquisar o equipamento é necessário preencher o campo ID do Cliente. Tente novamente.</p>
                                        </ContentTemplate>
                                        <Triggers>
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary" data-dismiss="modal">Fechar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div><%--Linha do Modal Alerta--%>
        </section>
    </form>
</body>
</html>
