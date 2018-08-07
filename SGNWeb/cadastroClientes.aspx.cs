using System;
using System.Web.UI;
using DAL;

namespace SGNWeb
{
    public partial class cadastroClientes : System.Web.UI.Page
    {
        ClienteDAL CliDal = new ClienteDAL();

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void rbTipoCliente_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbTipoCliente.SelectedValue == "F")
            {
                txtNomeFantasia.Enabled = false;
                txtCPF.Enabled = true;
                txtIdentidade.Enabled = true;
                txtCNPJ.Enabled = false;
                txtInscEstadual.Enabled = false;
                RFValidatorCPF.Enabled = true;
                RFValidatorCNPJ.Enabled = false;
            }

            if (rbTipoCliente.SelectedValue == "J")
            {
                txtNomeFantasia.Enabled = true;
                txtCPF.Enabled = false;
                txtIdentidade.Enabled = false;
                txtCNPJ.Enabled = true;
                txtInscEstadual.Enabled = true;
                RFValidatorCPF.Enabled = false;
                RFValidatorCNPJ.Enabled = true;
            }
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            string strNome = txtNome.Text;
            string strNomeFantasia = txtNomeFantasia.Text;
            string strInscEstadual = txtInscEstadual.Text;
            string strIdentidade = txtIdentidade.Text;
            string strEndereco = txtEndereco.Text;
            string strBairro = txtBairro.Text;
            string strCidade = txtCidade.Text;
            string strEstado = txtEstado.Text;
            string strCEP = txtCEP.Text.Replace("-", string.Empty);
            string strDDD = txtDDD.Text;
            string strTelefone = txtTelefone.Text.Replace("-", string.Empty);
            string strTel2 = txtTel2.Text.Replace("-", string.Empty);
            string strCelular = txtCelular.Text; /*.Replace("-", string.Empty);*/
            string strCel2 = txtCel2.Text; /*.Replace("-", string.Empty);*/
            string strEmail = txtEmail.Text;
            string strEmail2 = txtEmail2.Text;
            string strDataNascimento = txtDataNascimento.Text;
            string strClienteDesde = txtClienteDesde.Text;
            DateTime dtDataNascimento;
            DateTime dtClienteDesde;
            string strObservacoes = txtObservacoes.Text;
            
            if (strDataNascimento == "") { dtDataNascimento = DateTime.Now; }
            else
            {
                strDataNascimento += " 00:00:00";
                dtDataNascimento = Convert.ToDateTime(strDataNascimento);
            }

            if (strClienteDesde == "") { dtClienteDesde = DateTime.Now; }
            else
            {
                strClienteDesde += " 00:00:00";
                dtClienteDesde = Convert.ToDateTime(strClienteDesde);
            }

            if (Page.IsPostBack && Page.IsValid)
            {
                if (rbTipoCliente.SelectedValue == "F")
                {
                    string strCPF = txtCPF.Text.Replace(".", string.Empty).Replace("-", string.Empty);
                    try
                    {
                        CliDal.Inserir(0, strNome, strCPF, strIdentidade, strEndereco, strBairro, strCidade, strEstado, strCEP, strDDD, strTelefone, strTel2, strCelular, strCel2, strEmail, strEmail2, dtDataNascimento, dtClienteDesde, strObservacoes);
                        string strTitulo = "O cliente abaixo foi cadastrado com sucesso!";
                        ClientScript.RegisterStartupScript(GetType(), "alert", "ShowModal('" + strTitulo + "','" + strNome + "')", true);
                    }
                    catch (Exception ex)
                    {
                        string strTitulo = "Erro durante tentativa de cadastro. Verifique os detalhes abaixo e contate o administrador do sistema:";
                        ClientScript.RegisterStartupScript(GetType(), "alert", "ShowModal('" + strTitulo + "','" + ex.Message + "')", true);
                    }
                }

                if (rbTipoCliente.SelectedValue == "J")
                {
                    string strCNPJ = txtCNPJ.Text.Replace(".", string.Empty).Replace("/", string.Empty).Replace("-", string.Empty);
                    try
                    {
                        CliDal.Inserir(1,strNome, strNomeFantasia, strCNPJ, strInscEstadual, strEndereco, strBairro, strCidade, strEstado, strCEP, strDDD, strTelefone, strTel2, strCelular, strCel2, strEmail, strEmail2, dtDataNascimento, dtClienteDesde, strObservacoes);
                        string strTitulo = "O cliente abaixo foi cadastrado com sucesso!";
                        ClientScript.RegisterStartupScript(GetType(), "alert", "ShowModal('" + strTitulo + "','" + strNome + "')", true);

                    }
                    catch (Exception ex)
                    {
                        string strTitulo = "Erro durante tentativa de cadastro. Verifique os detalhes abaixo e contate o administrador do sistema:";
                        ClientScript.RegisterStartupScript(GetType(), "alert", "ShowModal('" + strTitulo + "','" + ex.Message + "')", true);
                    }
                }
            }  
        }
    }
}