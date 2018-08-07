using System;
using DAL;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGNWeb
{
    public partial class cadastroServicos : System.Web.UI.Page
    {

        ServicosDAL SrvDAL = new ServicosDAL();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSalvarServico_Click(object sender, EventArgs e)
        {
            string Codigo = txtCodSrv.Text;
            string Titulo = txTituloSrv.Text;
            string Descricao = txtDescSrv.Text;
            string sPreco = txtPrecoSrv.Text.Replace("R$",string.Empty);
            decimal Preco = Convert.ToDecimal(sPreco);

            try
            {
                SrvDAL.Inserir(Codigo, Titulo, Descricao, Preco);

                string strTitulo = "O serviço abaixo foi cadastrado com sucesso!";
                ClientScript.RegisterStartupScript(GetType(), "alert", "ShowModal('" + strTitulo + "','" + Titulo + "')", true);

                LimparFormulario(this);
            }
            catch (Exception ex)
            {
                string strTitulo = "Erro durante tentativa de cadastro. Verifique os detalhes abaixo e contate o administrador do sistema:";
                ClientScript.RegisterStartupScript(GetType(), "alert", "ShowModal('" + strTitulo + "','" + ex.Message + "')", true);
            }
        }

        public void LimparFormulario(Control controle)
        {
            foreach (Control ctle in controle.Controls)
            {
                if (ctle is TextBox)
                {
                    ((TextBox)ctle).Text = string.Empty;
                }
                else if (ctle.Controls.Count > 0)
                {
                    LimparFormulario(ctle);
                }

            }
        }
    }
}