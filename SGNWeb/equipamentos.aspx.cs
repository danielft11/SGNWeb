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
        }

        //protected void btnDetalhesEquipamentos_Click(object sender, EventArgs e)
        //{
        //    Button btnDetalhes = (Button)sender;
        //    TableCell cell = new TableCell();
        //    cell = (TableCell)btnDetalhes.Parent; 
        //    GridViewRow row = (GridViewRow)cell.Parent; 
        //    int Linha = row.RowIndex;
        //    string valor = GVEquipamentos.Rows[Linha].Cells[0].Text;
        //    int IdEquipamento = int.Parse(valor);

        //    Session["SessionIDEquipto"] = IdEquipamento;

        //    string script = "window.open('detalhesEquipamentos.aspx', 'detalhes do Equipamento', 'toolbar=no, width=900, height=420, top=200, left=250', '_parent')";
        //    ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);
        //}

        //protected void btnEditarEquipamentos_Click(object sender, EventArgs e)
        //{
        //    Button btnDetalhes = (Button)sender;
        //    TableCell cell = new TableCell();
        //    cell = (TableCell)btnDetalhes.Parent;
        //    GridViewRow row = (GridViewRow)cell.Parent;
        //    int Linha = row.RowIndex;
        //    string valor = GVEquipamentos.Rows[Linha].Cells[0].Text;
        //    int IdEquipamento = int.Parse(valor);

        //    Session["SessionIDEquipto"] = IdEquipamento;

        //    string script = "window.open('alteracaoEquipamentos.aspx', 'detalhes do Equipamento', 'toolbar=no, width=900, height=420, top=200, left=250', '_parent')";
        //    ClientScript.RegisterStartupScript(GetType(), "Alert", script, true);
        //}

        //protected void btnExcluirEquipamentos_Click(object sender, EventArgs e)
        //{
        //    Button btnExcluir = (Button)sender; 
        //    TableCell cell = new TableCell(); 
        //    cell = (TableCell)btnExcluir.Parent; 
        //    GridViewRow row = (GridViewRow)cell.Parent;
        //    int Linha = row.RowIndex;
        //    string valor = GVEquipamentos.Rows[Linha].Cells[0].Text;
        //    int IdEquipto = int.Parse(valor);

        //    EqDal.ExcluirEquipto(IdEquipto);
        //}

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