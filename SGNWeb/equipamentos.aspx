<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="equipamentos.aspx.cs" Inherits="SGNWeb.equipamentos" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
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
    <asp:ScriptManager ID="ScManagerEquipamentos" runat="server" EnableScriptLocalization="True" EnableScriptGlobalization="True"></asp:ScriptManager>
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
                    <asp:GridView ID="GVEquipamentos"
                        OnRowCommand="GVEquipamentos_RowCommand"
                        runat="server"
                        AutoGenerateColumns="false"
                        AllowPaging="True"
                        DataKeyNames="IdEquipamento"
                        CssClass="table table-striped"
                        GridLines="None"
                        PageSize="30"
                        OnPageIndexChanging="GVEquipamentos_PageIndexChanging" >

                        <Columns>
                            <asp:BoundField DataField="IdEquipamento" HeaderText="ID" ReadOnly="True">
                                <HeaderStyle BackColor="#666666" ForeColor="White" />
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

                             <asp:BoundField DataField="Tipo" HeaderText="Tipo" ReadOnly="True" HeaderStyle-Wrap="False" ItemStyle-Wrap="False">
                                <HeaderStyle Wrap="False" BackColor="#666666" ForeColor="White" />
                                <ItemStyle Wrap="False"></ItemStyle>
                            </asp:BoundField>

                            <asp:BoundField DataField="NomeCliente" HeaderText="Cliente" ReadOnly="True" ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" HeaderStyle-Wrap="False" ItemStyle-Wrap="False">
                                <HeaderStyle Wrap="False" CssClass="hidden-xs" BackColor="#666666" ForeColor="White" />
                                <ItemStyle Wrap="False" CssClass="hidden-xs"></ItemStyle>
                            </asp:BoundField>

                            <asp:ButtonField CommandName="detail" ButtonType="Button" Text="Detalhes" HeaderText="Detalhes"
                                ControlStyle-CssClass="btn btn-info btn-xs">
                                <HeaderStyle Wrap="False" BackColor="#666666" ForeColor="White" Width="20px" />
                            </asp:ButtonField>

                            <asp:ButtonField CommandName="editRecord" ButtonType="Button" Text="Editar" HeaderText="Editar"
                                ControlStyle-CssClass="btn btn-warning btn-xs">
                                <HeaderStyle Wrap="False" BackColor="#666666" ForeColor="White" Width="20px" />
                            </asp:ButtonField>

                            <asp:ButtonField CommandName="deleteRecord" ButtonType="Button" Text="Excluir" HeaderText="Excluir"
                                ControlStyle-CssClass="btn btn-danger btn-xs">
                                <HeaderStyle Wrap="False" BackColor="#666666" ForeColor="White" Width="20px" />
                            </asp:ButtonField>

                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div><%--Linha do Grid--%>
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <div class="modal fade" id="ModalDetalhesEquipamentos" tabindex="-1" role="dialog" aria-labelledby="EquiptosModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="EquiptosModalLabel">Detalhes</h4>
                            </div>
                            <div class="modal-body">
                                <asp:UpdatePanel ID="UpdPanelDetalhes" runat="server">
                                    <ContentTemplate>
                                        <asp:DetailsView ID="DtViewEquipamentos" 
                                            runat="server" 
                                            CssClass="table table-bordered table-hover" 
                                            BackColor="White" 
                                            ForeColor="Black" 
                                            FieldHeaderStyle-Wrap="false" 
                                            FieldHeaderStyle-Font-Bold="true" 
                                            FieldHeaderStyle-BackColor="#99ccff" 
                                            FieldHeaderStyle-ForeColor="Black" 
                                            BorderStyle="Groove" 
                                            AutoGenerateRows="false">
                                            <Fields>
                                                <asp:BoundField DataField="IdEquipamento" HeaderText="ID" />
                                                <asp:BoundField DataField="Tipo" HeaderText="Tipo" />
                                                <asp:BoundField DataField="Marca" HeaderText="Marca" />
                                                <asp:BoundField DataField="Modelo" HeaderText="Modelo" />
                                                <asp:BoundField DataField="NumSerie" HeaderText="S/N:" />
                                                <asp:BoundField DataField="NomeCliente" HeaderText="Cliente" />
                                                <asp:BoundField DataField="DataCadastro" HeaderText="Data de Cadastro" DataFormatString="{0:d}"/>
                                                <asp:BoundField DataField="Descricao" HeaderText="Descricao" />
                                            </Fields>
                                        </asp:DetailsView>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="GVEquipamentos" EventName="RowCommand" />
                                        <asp:AsyncPostBackTrigger ControlID="btnNovoEquipto" EventName="Click" />
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
                <div class="modal fade" id="ModalEditEquipamentos" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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
                                                <label class="control-label" for="txtIdEquipamento">ID</label>
                                                <asp:TextBox ID="txtIdEquipamento" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                            </div>
                                            <div class="form-group col-md-3 col-sm-3">
                                                <label class="control-label" for="txtTipo">Tipo</label>
                                                <asp:TextBox ID="txtTipo" runat="server" CssClass="form-control" MaxLength="200" ReadOnly="true"></asp:TextBox>
                                            </div>
                                            <div class="form-group col-md-3 col-sm-3">
                                                <label class="control-label" for="txtMarca">Marca</label>
                                                <asp:TextBox ID="txtMarca" runat="server" CssClass="form-control" MaxLength="200"></asp:TextBox>
                                            </div>
                                            <div class="form-group col-md-4 col-sm-4">
                                                <label class="control-label" for="txtModelo">Modelo</label>
                                                <asp:TextBox ID="txtModelo" runat="server" CssClass="form-control" MaxLength="300"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">                                      
                                            <div class="form-group col-md-4 col-sm-4">
                                                <label class="control-label" for="txtNumSerie">N/S</label>
                                                <asp:TextBox ID="txtNumSerie" runat="server" CssClass="form-control" MaxLength="5"></asp:TextBox>
                                            </div>
                                            <div class="form-group col-md-5 col-sm-5">
                                                <label class="control-label" for="txtNomeCliente">Cliente</label>
                                                <asp:TextBox ID="txtNomeCliente" runat="server" CssClass="form-control" MaxLength="300" ReadOnly="true"></asp:TextBox>
                                            </div>
                                            <div class="form-group col-md-3 col-sm-3">
                                                <label class="control-label" for="txtDataCadastro">Data Cadastro</label>
                                                <asp:TextBox ID="txtDataCadastro" runat="server" CssClass="form-control" MaxLength="5"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-12 col-sm-12">
                                                <label class="control-label" for="txtDescricao">Descrição</label>
                                                <asp:TextBox ID="txtDescricao" runat="server" CssClass="form-control" MaxLength="300" Rows="3" TextMode="MultiLine"></asp:TextBox>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="GVEquipamentos" EventName="RowCommand" />
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
                <div class="modal fade" id="ModalDeleteEquipamentos" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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
