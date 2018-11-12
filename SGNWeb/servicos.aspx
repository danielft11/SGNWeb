<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="servicos.aspx.cs" Inherits="SGNWeb.servicos" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function ShowModal(titulo, detalhes) {
            $("#AvisosModal").modal('show');
            $('.modal-title').text(titulo);
            $('.modal-body').text(detalhes);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPlaceHolderPrincipal" runat="server">
    <asp:ScriptManager ID="ScManagerServicos" runat="server" EnableScriptLocalization="True" EnableScriptGlobalization="True"></asp:ScriptManager>
    <section class="container-fluid">
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <h2 id="titulo">Serviços</h2>
            </div>
        </div><%--Linha de título--%>
        <div class="row" style="margin-bottom: 10px;">
            <div class="col-md-6 col-sm-6">
                <div class="form-inline">
                    <div class="form-group">
                        <asp:DropDownList ID="DDLServicos" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Código" Value="1" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="Título" Value="2"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:TextBox ID="txtPesquisaServico" runat="server" CssClass="form-control" ToolTip="Digite um valor para pesquisa."></asp:TextBox>
                        <asp:LinkButton ID="btnFiltroServico" CssClass="btn btn-info" runat="server" ToolTip="Filtrar" OnClick="btnFiltroServico_Click">
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnNovoServico" CssClass="btn btn-success" runat="server" ToolTip="Novo Servico" OnClientClick="window.open('cadastroServicos.aspx','Cadastro de Serviço', 'toolbar=no, width=815, height=320, top=200, left=250', '_parent')">
                            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnRecarregarPagina" CssClass="btn btn-warning" runat="server" ToolTip="Recarregar página" OnClick="btnRecarregarPagina_Click">
                            <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
        </div><%--Linha de filtro e botões principais --%>
        <div class="row">
            <div class="col-md-12 col-sm-12 table-responsive" style="display:block;">
                <asp:UpdatePanel ID="UpdPanelServicos" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="GridServicos" 
                            runat="server" 
                            OnRowCommand="GridServicos_RowCommand"
                            AutoGenerateColumns="false" 
                            AllowPaging="true" 
                            DataKeyNames="IdServico" 
                            CssClass="table table-striped" 
                            GridLines="None" 
                            PageSize="12" 
                            OnPageIndexChanging="GridServicos_PageIndexChanging">

                            <Columns>
                                <asp:BoundField DataField="IdServico" HeaderText="ID" ReadOnly="True" HeaderStyle-Wrap="False" ItemStyle-Wrap="False">
                                    <HeaderStyle Wrap="False" BackColor="#666666" ForeColor="White" />
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundField>

                                <asp:BoundField DataField="Codigo" HeaderText="Código" ReadOnly="True" HeaderStyle-Wrap="False" ItemStyle-Wrap="False">
                                    <HeaderStyle Wrap="False" BackColor="#666666" ForeColor="White" />
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundField>

                                <asp:BoundField DataField="Titulo" HeaderText="Título" ReadOnly="True" HeaderStyle-Wrap="False" ItemStyle-Wrap="False">
                                    <HeaderStyle Wrap="False" BackColor="#666666" ForeColor="White" />
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundField>

                                <asp:BoundField DataField="Preco" HeaderText="Preço" ReadOnly="True" HeaderStyle-Wrap="False" ItemStyle-Wrap="False" DataFormatString="{0:C}">
                                    <HeaderStyle Wrap="False" BackColor="#666666" ForeColor="White" />
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:BoundField>

                                <asp:ButtonField CommandName="detail" ButtonType="Button" Text="Detalhes" HeaderText="Detalhes" 
                                    ControlStyle-CssClass="btn btn-info btn-xs">
                                    <HeaderStyle Wrap="False" BackColor="#666666" ForeColor="White" Width="20px"/>
                                </asp:ButtonField>

                                <asp:ButtonField CommandName="editRecord" ButtonType="Button" Text="Editar" HeaderText="Editar"
                                    ControlStyle-CssClass="btn btn-warning btn-xs">
                                    <HeaderStyle Wrap="False" BackColor="#666666" ForeColor="White" Width="20px"/>
                                </asp:ButtonField>

                                <asp:ButtonField CommandName="deleteRecord" ButtonType="Button" Text="Excluir" HeaderText="Excluir"
                                    ControlStyle-CssClass="btn btn-danger btn-xs">
                                    <HeaderStyle Wrap="False" BackColor="#666666" ForeColor="White" Width="20px"/>
                                </asp:ButtonField>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div><%--Linha do Grid--%>
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">Detalhes</h4>
                            </div>
                            <div class="modal-body">
                                <asp:UpdatePanel ID="UpdPanelDetalhes" runat="server">
                                    <ContentTemplate>
                                        <asp:DetailsView ID="DtViewServicos" 
                                            runat="server" 
                                            CssClass="table table-bordered table-hover" 
                                            BackColor="White" 
                                            ForeColor="Black" 
                                            FieldHeaderStyle-Wrap="false" 
                                            FieldHeaderStyle-Font-Bold="true" 
                                            FieldHeaderStyle-BackColor="#99ccff" 
                                            FieldHeaderStyle-ForeColor="Black" 
                                            BorderStyle="Groove" 
                                            AutoGenerateRows="False">
                                            <Fields>
                                                <asp:BoundField DataField="IdServico" HeaderText="ID" />
                                                <asp:BoundField DataField="Codigo" HeaderText="Código" />
                                                <asp:BoundField DataField="Titulo" HeaderText="Título" />
                                                <asp:BoundField DataField="Descricao" HeaderText="Descrição" />
                                                <asp:BoundField DataField="Preco" HeaderText="Preço" DataFormatString="{0:C}" />
                                            </Fields>
                                        </asp:DetailsView>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="GridServicos" EventName="RowCommand" />
                                        <asp:AsyncPostBackTrigger ControlID="btnNovoServico" EventName="Click" />
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
        </div><%--Linha do Modal Detalhes--%>
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="editModalLabel">Atualização</h4>
                            </div>
                            <div class="modal-body">
                                <asp:UpdatePanel ID="UpdPanelEdicao" runat="server">
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="form-group col-md-2 col-sm-2">
                                                <label class="control-label" for="txtIdSrv">ID</label>
                                                <asp:TextBox ID="txtIdSrv" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                            </div>
                                            <div class="form-group col-md-3 col-sm-3">
                                                <label class="control-label" for="txtCod">Codigo</label>
                                                <asp:TextBox ID="txtCod" runat="server" CssClass="form-control" MaxLength="200" ReadOnly="true"></asp:TextBox>
                                            </div>
                                            <div class="form-group col-md-7 col-sm-7">
                                                <label class="control-label" for="txtTitulo">Título</label>
                                                <asp:TextBox ID="txtTitulo" runat="server" CssClass="form-control" MaxLength="200"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-9 col-sm-9">
                                                <label class="control-label" for="txtDescServico">Descrição</label>
                                                <asp:TextBox ID="txtDescServico" runat="server" CssClass="form-control" MaxLength="300" Rows="4" TextMode="MultiLine"></asp:TextBox>
                                            </div>
                                            <div class="form-group col-md-3 col-sm-3">
                                                <label class="control-label" for="txtPreco">Preço</label>
                                                <asp:TextBox ID="txtPreco" runat="server" CssClass="form-control" MaxLength="5"></asp:TextBox>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="GridServicos" EventName="RowCommand" />
                                        <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="btnSave" runat="server" Text="Atualizar" CssClass="btn btn-success" OnClick="btnSave_Click" />
                                <button type="button" class="btn btn-primary" data-dismiss="modal">Fechar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><%--Linha do Modal Editar--%>
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="delModalLabel">Deletar Registro</h4>
                            </div>
                            <div class="modal-body">
                                <asp:UpdatePanel ID="UpdPanelExclusao" runat="server">
                                    <ContentTemplate>
                                        Tem certeza que deseja excluir este registro?
                                        <asp:HiddenField ID="HfCode" runat="server" />
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnDelete" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="btnDelete" runat="server" Text="Deletar" CssClass="btn btn-danger" OnClick="btnDelete_Click" />
                                <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
        </div><%--Linha do Modal Exluir--%>
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <div class="modal fade" id="AvisosModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="AvisosModalLabel"></h4>
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
        </div><%--Linha do Modal Avisos--%>
    </section>
</asp:Content>
