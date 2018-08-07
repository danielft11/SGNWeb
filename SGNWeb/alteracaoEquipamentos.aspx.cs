using System;
using DAL;
using System.Data;

namespace SGNWeb
{
    public partial class alteracaoEquipamentos : System.Web.UI.Page
    {

        EquipamentoDAL EqDal = new EquipamentoDAL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                int IDEquipamento = Convert.ToInt32(Session["SessionIDEquipto"]);
                DataTable DtEquipamentos = EqDal.Detalhes(IDEquipamento);

                txtTipoFrmAltEq.Text = DtEquipamentos.Rows[0]["Tipo"].ToString();
                txtIDClienteFrmAltEq.Text = DtEquipamentos.Rows[0]["CodCliente"].ToString();
                txtNomeClienteFrmAltEq.Text = DtEquipamentos.Rows[0]["NomeCliente"].ToString();
                txtMarcaFrmAltEq.Text = DtEquipamentos.Rows[0]["Marca"].ToString();
                txtModeloFrmAltEq.Text = DtEquipamentos.Rows[0]["Modelo"].ToString();
                txtNumSerieFrmAltEq.Text = DtEquipamentos.Rows[0]["NumSerie"].ToString();
                txtDataCadastroFrmAltEq.Text = DtEquipamentos.Rows[0]["DataCadastro"].ToString().Substring(0, 10);
                txtDescricaoFrmAltEq.Text = DtEquipamentos.Rows[0]["Descricao"].ToString();
            }
        }

        protected void btnSalvarEquiptoFrmAltEq_Click(object sender, EventArgs e)
        {
            try
            {
                int IDEquipto = Convert.ToInt32(Session["SessionIDEquipto"]);
                string sDescricao = txtDescricaoFrmAltEq.Text;
                EqDal.AtualizarEquipto(IDEquipto, sDescricao);
                string strTitulo = "O equipamento abaixo foi atualizado com sucesso!";
                string strTexto = "Marca: " + txtMarcaFrmAltEq.Text + ", Modelo: " + txtModeloFrmAltEq.Text + ".";
                ClientScript.RegisterStartupScript(GetType(), "alert", "ShowModal('" + strTitulo + "','" + strTexto + "')", true);
            }
            catch (Exception ex)
            {
                string strTitulo = "Erro durante tentativa de atualização. Verifique os detalhes abaixo e contate o administrador do sistema:";
                string strTexto = ex.Message;
                ClientScript.RegisterStartupScript(GetType(), "alert", "ShowModal('" + strTitulo + "','" + strTexto + "')", true);
            }
        }
    }
}