using System;
using DAL;
using System.Data;

namespace SGNWeb
{
    public partial class detalhesEquipamentos : System.Web.UI.Page
    {

        EquipamentoDAL EqDal = new EquipamentoDAL();

        protected void Page_Load(object sender, EventArgs e)
        {
            int IDEquipamento = Convert.ToInt32(Session["SessionIDEquipto"]);
            DataTable DtEquipamentos = EqDal.Detalhes(IDEquipamento);

            txtTipoFrmDetalhesEquipto.Text = DtEquipamentos.Rows[0]["Tipo"].ToString();
            txtIDClienteFrmDetalhesEquipto.Text = DtEquipamentos.Rows[0]["CodCliente"].ToString();
            txtNomeClienteFrmDetalhesEquipto.Text = DtEquipamentos.Rows[0]["NomeCliente"].ToString();
            txtMarcaFrmDetalhesEquipto.Text = DtEquipamentos.Rows[0]["Marca"].ToString();
            txtModeloFrmDetalhesEquipto.Text = DtEquipamentos.Rows[0]["Modelo"].ToString();
            txtNumSerieFrmDetalhesEquipto.Text = DtEquipamentos.Rows[0]["NumSerie"].ToString();
            txtDataCadastroFrmDetalhesEquipto.Text = DtEquipamentos.Rows[0]["DataCadastro"].ToString().Substring(0, 10);
            txtDescricaoFrmDetalhesEquipto.Text = DtEquipamentos.Rows[0]["Descricao"].ToString();
        }
    }
}