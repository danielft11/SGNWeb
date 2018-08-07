using System;
using System.Web.UI;
using DAL;

namespace SGNWeb
{
    public partial class cadastroEquipamentos : System.Web.UI.Page
    {

        EquipamentoDAL EqDal = new EquipamentoDAL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DDLTipoEquipto.DataSource = EqDal.ListarTipo();
                DDLTipoEquipto.DataTextField = "Nome";
                DDLTipoEquipto.DataValueField = "IdTipoEquipto";
                DDLTipoEquipto.DataBind();
            }
        }

        protected void btnSalvarEquipto_Click(object sender, EventArgs e)
        {
            int Tipo = Convert.ToInt32(DDLTipoEquipto.SelectedValue);
            int IDCliente = int.Parse(Request.Form["txtIDCLiente"]);
            string sMarca = txtMarca.Text;
            string sModelo = txtModelo.Text;
            string sNumSerie = txtNumSerie.Text;
            string sDataCadastro = txtDataCadastro.Text;
            DateTime DataCadastro;
            string sDescricao = txtDescricao.Text;

            if (sDataCadastro == "") { DataCadastro = DateTime.Now; }
            else
            {
                sDataCadastro += " 00:00:00";
                DataCadastro = Convert.ToDateTime(sDataCadastro);
            }
            try
            {
                EqDal.Inserir(sMarca, sModelo, sNumSerie, sDescricao, Tipo, IDCliente, DataCadastro);
                string strTitulo = "O equipamento abaixo foi cadastrado com sucesso!";
                string strTexto = "Marca: " + sMarca + ", Modelo: " + sModelo + ".";
                ClientScript.RegisterStartupScript(GetType(), "alert", "ShowModal('" + strTitulo + "','" + strTexto + "')", true);
            }
            catch (Exception ex)
            {
                string strTitulo = "Erro durante tentativa de cadastro. Verifique os detalhes abaixo e contate o administrador do sistema:";
                string strTexto = ex.Message;
                ClientScript.RegisterStartupScript(GetType(), "alert", "ShowModal('" + strTitulo + "','" + strTexto + "')", true);
            }
        }
    }
}