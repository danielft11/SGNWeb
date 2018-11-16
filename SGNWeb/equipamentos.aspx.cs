using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using System.Data;
using System.Text;

namespace SGNWeb
{
    public partial class equipamentos : System.Web.UI.Page
    {

        EquipamentoDAL EqDal = new EquipamentoDAL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GVEquipamentos.DataSource = EqDal.Listar();
                GVEquipamentos.DataBind();
            }
        }

        protected void GVEquipamentos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVEquipamentos.PageIndex = e.NewPageIndex;
            GVEquipamentos.DataSource = EqDal.Listar();
            GVEquipamentos.DataBind();
        }

        protected void GVEquipamentos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            DataTable DtEquipamentos = new DataTable();

            if (e.CommandName.Equals("detail"))
            {
                int code = int.Parse(GVEquipamentos.DataKeys[index].Value.ToString());
                DtEquipamentos = EqDal.Detalhes(code);

                DtViewEquipamentos.DataSource = DtEquipamentos;
                DtViewEquipamentos.DataBind();

                StringBuilder eq = new StringBuilder();
                eq.Append(@"<script type='text/javascript'>");
                eq.Append("$('#ModalDetalhesEquipamentos').modal('show');");
                eq.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "ModalDetalhesEquipamentosScript", eq.ToString(), false);
            }
            else if (e.CommandName.Equals("editRecord"))
            {
                int code = int.Parse(GVEquipamentos.DataKeys[index].Value.ToString());
                DtEquipamentos = EqDal.Detalhes(code);

                //txtIdSrv.Text = DtServicos.Rows[0]["IdServico"].ToString();
                txtIdEquipamento.Text = DtEquipamentos.Rows[0]["IdEquipamento"].ToString();
                txtTipo.Text = DtEquipamentos.Rows[0]["Tipo"].ToString();
                txtMarca.Text = DtEquipamentos.Rows[0]["Marca"].ToString();
                txtModelo.Text = DtEquipamentos.Rows[0]["Modelo"].ToString(); ;
                txtNumSerie.Text = DtEquipamentos.Rows[0]["NumSerie"].ToString();
                txtNomeCliente.Text = DtEquipamentos.Rows[0]["NomeCliente"].ToString();
                txtDataCadastro.Text = DtEquipamentos.Rows[0]["DataCadastro"].ToString().Substring(0, 10);
                txtDescricao.Text = DtEquipamentos.Rows[0]["Descricao"].ToString();

                StringBuilder sb = new StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#ModalEditEquipamentos').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditModalScript", sb.ToString(), false);
            }
            else if (e.CommandName.Equals("deleteRecord"))
            {
                int code = int.Parse(GVEquipamentos.DataKeys[index].Value.ToString());
                HfCode.Value = code.ToString();

                StringBuilder sb = new StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#ModalDeleteEquipamentos').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "DeleteModalScript", sb.ToString(), false);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int IdEquipamento = int.Parse(txtIdEquipamento.Text);
            string Marca = txtMarca.Text;
            string Modelo = txtModelo.Text;
            string NumSerie = txtNumSerie.Text;
            string sDataCadastro = txtDataCadastro.Text;
            DateTime DataCadastro;
            string Descricao = txtDescricao.Text;

            if (sDataCadastro == ""){
                DataCadastro = DateTime.Now;
            } else {
                sDataCadastro += " 00:00:00";
                DataCadastro = Convert.ToDateTime(sDataCadastro);
            }

            try
            {
                EqDal.AtualizarEquipto(IdEquipamento, Marca, Modelo, NumSerie, DataCadastro, Descricao);

                GVEquipamentos.DataSource = EqDal.Listar();
                GVEquipamentos.DataBind();

                StringBuilder sb = new StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("alert('Equipamento alterado com sucesso!');");
                sb.Append("$('#ModalEditEquipamentos').modal('hide');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AddHideModalScript", sb.ToString(), false);
            }
            catch (Exception ex)
            {
                StringBuilder sb = new StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("alert('Ao tentar alterar o registro ocorreu o seguinte erro:'" + ex.Message + "'. Contate o administrador do sistema.');");
                sb.Append("$('#ModalEditEquipamentos').modal('hide');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AddHideModalScript", sb.ToString(), false);
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int iCode = int.Parse(HfCode.Value);

            try
            {
                EqDal.ExcluirEquipto(iCode);

                GVEquipamentos.DataSource = EqDal.Listar();
                GVEquipamentos.DataBind();

                StringBuilder sb = new StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("alert('Registro do serviço excluído com sucesso.');");
                sb.Append("$('#ModalDeleteEquipamentos').modal('hide');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "delHideModalScript", sb.ToString(), false);
            }
            catch (Exception ex)
            {
                StringBuilder sb = new StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("alert('Ao tentar excluir o registro ocorreu o seguinte erro: '" + ex.Message + "'. Contate o administrador do sistema.');");
                sb.Append("$('#ModalDeleteEquipamentos').modal('hide');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, GetType(), "AddHideModalScript", sb.ToString(), false);
            }

        }

        protected void btnFiltroEquipto_Click(object sender, EventArgs e)
        {
            String sOpcao = DDLEquipamento.SelectedValue;

            switch (sOpcao)
            {
                case "1":
                    if (!string.IsNullOrEmpty(txtPesquisaEquipto.Text))
                    {
                        try
                        {
                            int Id = int.Parse(txtPesquisaEquipto.Text);
                            GVEquipamentos.DataSource = EqDal.Detalhes(Id);
                            GVEquipamentos.DataBind();
                        }
                        catch (Exception ex)
                        {
                            string strTitulo = "Erro ao tentar filtrar os dados. Certifique-se que você tenha informado numeral caso a busca seja por ID. Detalhes:";
                            ClientScript.RegisterStartupScript(GetType(), "alert", "ShowModal('" + strTitulo + "','" + ex.Message + "')", true);
                        }
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(GetType(), "alert", "ShowModal('Campo em branco','Por favor, preencha um valor no Textbox para pesquisa.')", true);
                    }
                break;

                case "2":
                    if (!string.IsNullOrEmpty(txtPesquisaEquipto.Text))
                    {
                        string strNumSerie = txtPesquisaEquipto.Text;
                        GVEquipamentos.DataSource = EqDal.Detalhes(strNumSerie);
                        GVEquipamentos.DataBind();
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(GetType(), "alert", "ShowModal('Campo em branco','Por favor, preencha um valor no Textbox para pesquisa.')", true);
                    }
                break;
            }
        }

        protected void btnAtualizarEquipto_Click(object sender, EventArgs e)
        {
            GVEquipamentos.DataSource = EqDal.Listar();
            GVEquipamentos.DataBind();
        }
    }
}