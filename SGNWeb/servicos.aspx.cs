using System;
using System.Data;
using System.Web.UI.WebControls;
using DAL;
using System.Web.UI;
using System.Text;

namespace SGNWeb
{
    public partial class servicos : System.Web.UI.Page
    {

        ServicosDAL SrvDAL = new ServicosDAL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GridServicos.DataSource = SrvDAL.Listar();
                GridServicos.DataBind();
            }
        }

        protected void btnFiltroServico_Click(object sender, EventArgs e)
        {
            String sOpcao = DDLServicos.SelectedValue;

            switch (sOpcao)
            {
                case "1":
                    if (!string.IsNullOrEmpty(txtPesquisaServico.Text))
                    {
                        string Cod = txtPesquisaServico.Text;
                        GridServicos.DataSource = SrvDAL.Detalhes(Cod);
                        GridServicos.DataBind();

                        if (GridServicos.Rows.Count == 0)
                        {
                            ClientScript.RegisterStartupScript(GetType(), "alert", "ShowModal('Consulta sem resultado.','Sua pesquisa não retornou nenhum resultado. Tente novamente.')", true);
                        }
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(GetType(), "alert", "ShowModal('Campo em branco','Por favor, preencha um valor no Textbox para pesquisa.')", true);
                    }
                break;

                case "2":
                    if (!string.IsNullOrEmpty(txtPesquisaServico.Text))
                    {
                        string Titulo = txtPesquisaServico.Text;
                        GridServicos.DataSource = SrvDAL.DetalhesTitulo(Titulo);
                        GridServicos.DataBind();

                        if (GridServicos.Rows.Count == 0)
                        {
                            ClientScript.RegisterStartupScript(GetType(), "alert", "ShowModal('Consulta sem resultado.','Sua pesquisa não retornou nenhum resultado. Tente novamente.')", true);
                        }
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(GetType(), "alert", "ShowModal('Campo em branco','Por favor, preencha um valor no Textbox para pesquisa.')", true);
                    }
                break;
            }
        }

        protected void btnRecarregarPagina_Click(object sender, EventArgs e)
        {
            GridServicos.DataSource = SrvDAL.Listar();
            GridServicos.DataBind();
        }

        protected void GridServicos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridServicos.PageIndex = e.NewPageIndex;
            GridServicos.DataSource = SrvDAL.Listar();
            GridServicos.DataBind();
        }

        protected void GridServicos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            DataTable DtServicos = new DataTable();

            if (e.CommandName.Equals("detail"))
            {
                int code = int.Parse(GridServicos.DataKeys[index].Value.ToString());
                DtServicos = SrvDAL.Detalhes(code);

                DtViewServicos.DataSource = DtServicos;
                DtViewServicos.DataBind();

                StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#detailModal').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "DetailModalScript", sb.ToString(), false);
            }
            else if (e.CommandName.Equals("editRecord"))
            {
                int code = int.Parse(GridServicos.DataKeys[index].Value.ToString());
                DtServicos = SrvDAL.Detalhes(code);

                txtIdSrv.Text = DtServicos.Rows[0]["IdServico"].ToString();
                txtCod.Text = DtServicos.Rows[0]["Codigo"].ToString();
                txtTitulo.Text = DtServicos.Rows[0]["Titulo"].ToString();
                txtDescServico.Text = DtServicos.Rows[0]["Descricao"].ToString();
                txtPreco.Text = DtServicos.Rows[0]["Preco"].ToString();

                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#editModal').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditModalScript", sb.ToString(), false);
            }
            else if (e.CommandName.Equals("deleteRecord"))
            {
                int code = int.Parse(GridServicos.DataKeys[index].Value.ToString());
                HfCode.Value = code.ToString();

                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#deleteModal').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "DeleteModalScript", sb.ToString(), false);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int IdSrv = int.Parse(txtIdSrv.Text);
            string Titulo = txtTitulo.Text;
            string Descricao = txtDescServico.Text;
            decimal Preco = decimal.Parse(txtPreco.Text);

            try
            {
                SrvDAL.AtualizarServico(IdSrv, Titulo, Descricao, Preco);

                GridServicos.DataSource = SrvDAL.Listar();
                GridServicos.DataBind();

                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("alert('Registro do serviço alterado com sucesso!');");
                sb.Append("$('#editModal').modal('hide');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AddHideModalScript", sb.ToString(), false);
            }
            catch (Exception ex)
            {
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("alert('Ao tentar alterar o registro ocorreu o seguinte erro: '+'"+ex.Message+ "'+' Contate o administrador do sistema.');");
                sb.Append("$('#editModal').modal('hide');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AddHideModalScript", sb.ToString(), false);
            }

            
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int iCode = int.Parse(HfCode.Value);

            try
            {
                SrvDAL.ExcluirServico(iCode);

                GridServicos.DataSource = SrvDAL.Listar();
                GridServicos.DataBind();

                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("alert('Registro do serviço excluído com sucesso.');");
                sb.Append("$('#deleteModal').modal('hide');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "delHideModalScript", sb.ToString(), false);
            }
            catch (Exception ex)
            {
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("alert('Ao tentar excluir o registro ocorreu o seguinte erro: '+'" + ex.Message + "'+' Contate o administrador do sistema.');");
                sb.Append("$('#deleteModal').modal('hide');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AddHideModalScript", sb.ToString(), false);
            }

        }
    }
}