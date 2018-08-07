<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="clientes.aspx.cs" Inherits="SGNWeb.clientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function ShowModal(titulo, detalhes) {
            $("#myModal").modal('show');
            $('.modal-title').text(titulo);
            $('.modal-body').text(detalhes);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPlaceHolderPrincipal" runat="server">
    <section class="container-fluid">
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <h2 id="titulo">Clientes</h2>
            </div>
        </div> <%--Linha de título--%>
        <div class="row" style="margin-bottom: 10px;">
            <div class="col-md-6 col-sm-6">
                <div class="form-inline">
                    <div class="form-group">
                        <asp:DropDownList ID="DDLCliente" runat="server" CssClass="form-control">
                            <asp:ListItem Text="ID" Value="1" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="Nome" Value="2"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:TextBox ID="txtPesquisa" runat="server" CssClass="form-control" ToolTip="Digite um valor para pesquisa"></asp:TextBox>
                        <asp:LinkButton ID="btnFiltro" CssClass="btn btn-info" runat="server" ToolTip="Filtrar" OnClick="btnFiltro_Click">
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnNovo" CssClass="btn btn-success" runat="server" ToolTip="Novo cliente" OnClientClick="window.open('cadastroClientes.aspx', 'Cadastro de Cliente', 'toolbar=no, width=1170, height=760, top=20, left=120', '_parent')">
                            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnAtualizar" CssClass="btn btn-warning" runat="server" ToolTip="Recarregar página" OnClick="btnAtualizar_Click">
                            <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnOrdernarNomeAZ" CssClass="btn btn-default" runat="server" ToolTip="Ordenar por nome" OnClick="btnOrdernarNomeAZ_Click">
                            <span class="glyphicon glyphicon-sort-by-alphabet" aria-hidden="true"></span>
                        </asp:LinkButton>
                    </div>  
                </div>
            </div>
        </div> <%--Linha de filtro e botões principais --%>  
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <div class="table-responsive" style="display: block;">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped" 
                        GridLines="None" AllowPaging="True" PageSize="20" AutoGenerateColumns="false"
                        OnPageIndexChanging="GridView1_PageIndexChanging" DataKeyNames="IdCliente">
                        <Columns>
                            <asp:BoundField DataField="IdCliente" HeaderText="ID" ReadOnly="True">
                                <HeaderStyle BackColor="#666666" ForeColor="White" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Nome" HeaderText="Nome - Razão Social" ReadOnly="True" HeaderStyle-Wrap="False" ItemStyle-Wrap="False">
                                <HeaderStyle Wrap="False" BackColor="#666666" ForeColor="White" />
                                <ItemStyle Wrap="False"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="Endereco" HeaderText="Endereço" ReadOnly="True" ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" HeaderStyle-Wrap="False" ItemStyle-Wrap="False">
                                <HeaderStyle Wrap="False" CssClass="hidden-xs" BackColor="#666666" ForeColor="White" />
                                <ItemStyle Wrap="False" CssClass="hidden-xs"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="Bairro" HeaderText="Bairro" ReadOnly="True" ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" HeaderStyle-Wrap="False" ItemStyle-Wrap="False">
                                <HeaderStyle Wrap="False" CssClass="hidden-xs" BackColor="#666666" ForeColor="White" />
                                <ItemStyle Wrap="False" CssClass="hidden-xs"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="Cidade" HeaderText="Cidade" ReadOnly="True" ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" HeaderStyle-Wrap="False" ItemStyle-Wrap="False">
                                <HeaderStyle Wrap="False" CssClass="hidden-xs" BackColor="#666666" ForeColor="White" />
                                <ItemStyle Wrap="False" CssClass="hidden-xs"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="Estado" HeaderText="Estado" ReadOnly="True" ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" HeaderStyle-Wrap="False" ItemStyle-Wrap="False">
                                <HeaderStyle Wrap="False" CssClass="hidden-xs" BackColor="#666666" ForeColor="White" />
                                <ItemStyle Wrap="False" CssClass="hidden-xs"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="EmailPrincipal" HeaderText="E-Mail" ReadOnly="True" ItemStyle-CssClass="hidden-xs" HeaderStyle-Wrap="False" ItemStyle-Wrap="False">
                                <HeaderStyle Wrap="False" CssClass="hidden-xs" BackColor="#666666" ForeColor="White" />
                                <ItemStyle CssClass="hidden-xs" Wrap="False"></ItemStyle>
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Ações">
                                <ItemTemplate>
                                    <asp:Button ID="btnDetalhes" runat="server" Text="Detalhes" CssClass="btn btn-info btn-xs" OnClick="btnDetalhes_Click"/>
                                    <asp:Button ID="btnEditar" runat="server" Text="Editar" CssClass="btn btn-warning btn-xs" OnClick="btnEditar_Click"/>
                                    <asp:Button ID="btnExcluir" runat="server" Text="Excluir" CssClass="btn btn-danger btn-xs" OnClientClick="javascript:return confirm('Tem certeza que deseja excluir o cliente?');" OnClick="btnExcluir_Click"/>
                                </ItemTemplate>
                                <HeaderStyle BackColor="#666666" ForeColor="White" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div> <%--Linha do Grid--%>
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <!-- Modal -->
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
    </section>
</asp:Content>

