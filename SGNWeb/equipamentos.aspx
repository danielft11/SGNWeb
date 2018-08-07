<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="equipamentos.aspx.cs" Inherits="SGNWeb.equipamentos" %>
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
                <h2 id="titulo">Equipamentos</h2>
            </div>
        </div><%--Linha de título--%>
        <div class="row" style="margin-bottom: 10px;">
                <div class="col-md-6 col-sm-6">
                    <div class="form-inline">
                        <div class="form-group">
                            <asp:DropDownList ID="DDLEquipamento" runat="server" CssClass="form-control">
                                <asp:ListItem Text="ID" Value="1" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="N/S" Value="2"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:TextBox ID="txtPesquisaEquipto" runat="server" CssClass="form-control" ToolTip="Digite um valor para pesquisa"></asp:TextBox>
                            <asp:LinkButton ID="btnFiltroEquipto" CssClass="btn btn-info" runat="server" ToolTip="Filtrar" OnClick="btnFiltroEquipto_Click">
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnNovoEquipto" CssClass="btn btn-success" runat="server" ToolTip="Novo equipamento" OnClientClick="window.open('cadastroEquipamentos.aspx','Cadastro de Equipamento', 'toolbar=no, width=900, height=420, top=200, left=250', '_parent')">
                            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnAtualizarEquipto" CssClass="btn btn-warning" runat="server" ToolTip="Recarregar página" OnClick="btnAtualizarEquipto_Click">
                            <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div><%--Linha de filtro e botões principais --%>
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <div class="table-responsive" style="display: block;">
                    <asp:GridView ID="GVEquipamentos" runat="server" CssClass="table table-striped" 
                        GridLines="None" 
                        AllowPaging="True" 
                        PageSize="20" 
                        AutoGenerateColumns="false"
                        OnPageIndexChanging="GVEquipamentos_PageIndexChanging" DataKeyNames="IdEquipamento">
                        <Columns>
                            <asp:BoundField DataField="IdEquipamento" HeaderText="ID" ReadOnly="True">
                                <HeaderStyle BackColor="#666666" ForeColor="White" />
                            </asp:BoundField>

                            <asp:BoundField DataField="Tipo" HeaderText="Tipo" ReadOnly="True" HeaderStyle-Wrap="False" ItemStyle-Wrap="False">
                                <HeaderStyle Wrap="False" BackColor="#666666" ForeColor="White" />
                                <ItemStyle Wrap="False"></ItemStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="Marca" HeaderText="Marca" ReadOnly="True" HeaderStyle-Wrap="False" ItemStyle-Wrap="False">
                                <HeaderStyle Wrap="False" BackColor="#666666" ForeColor="White" />
                                <ItemStyle Wrap="False"></ItemStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="Modelo" HeaderText="Modelo" ReadOnly="True" ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" HeaderStyle-Wrap="False" ItemStyle-Wrap="False">
                                <HeaderStyle Wrap="False" CssClass="hidden-xs" BackColor="#666666" ForeColor="White" />
                                <ItemStyle Wrap="False" CssClass="hidden-xs"></ItemStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="NumSerie" HeaderText="N/S" ReadOnly="True" ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" HeaderStyle-Wrap="False" ItemStyle-Wrap="False">
                                <HeaderStyle Wrap="False" CssClass="hidden-xs" BackColor="#666666" ForeColor="White" />
                                <ItemStyle Wrap="False" CssClass="hidden-xs"></ItemStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="NomeCliente" HeaderText="Cliente" ReadOnly="True" ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" HeaderStyle-Wrap="False" ItemStyle-Wrap="False">
                                <HeaderStyle Wrap="False" CssClass="hidden-xs" BackColor="#666666" ForeColor="White" />
                                <ItemStyle Wrap="False" CssClass="hidden-xs"></ItemStyle>
                            </asp:BoundField>

                            <asp:TemplateField HeaderText="Ações">
                                <ItemTemplate>
                                    <asp:Button ID="btnDetalhesEquipamentos" runat="server" Text="Detalhes" CssClass="btn btn-info btn-xs" OnClick="btnDetalhesEquipamentos_Click"/>
                                    <asp:Button ID="btnEditarEquipamentos" runat="server" Text="Editar" CssClass="btn btn-warning btn-xs" OnClick="btnEditarEquipamentos_Click"/>
                                    <asp:Button ID="btnExcluirEquipamentos" runat="server" Text="Excluir" CssClass="btn btn-danger btn-xs" OnClientClick="javascript:return confirm('Tem certeza que deseja excluir o equipamento?');" OnClick="btnExcluirEquipamentos_Click" />
                                </ItemTemplate>
                                <HeaderStyle BackColor="#666666" ForeColor="White" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div><%--Linha do Grid--%>
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
