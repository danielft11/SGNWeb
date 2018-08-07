using System;
using DAL;
using System.Data;

namespace SGNWeb
{
    public partial class alteracaoClientes : System.Web.UI.Page
    {
        ClienteDAL CliDal = new ClienteDAL();
        DataTable DtClientes;
        int tipo;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                int Identificador = Convert.ToInt32(Session["IdentificadoId"]);
                DtClientes = CliDal.Detalhes(Identificador);
                tipo = Convert.ToInt32(DtClientes.Rows[0]["IdTipo"]);

                if (tipo == 0)
                {
                    txtNomeFantasiaFormAlteracao.ReadOnly = true;
                    txtCNPJFormAlteracao.ReadOnly = true;
                    txtInscEstadualFormAlteracao.ReadOnly = true;

                    if (DtClientes.Rows[0]["CPF"].ToString() == "           ") { txtCPFFormAlteracao.Text = string.Empty; }
                    else { txtCPFFormAlteracao.Text = string.Format(@"{0:000\.000\.000\-00}", long.Parse(DtClientes.Rows[0]["CPF"].ToString())); }
                    if (DtClientes.Rows[0]["CEP"].ToString() == "        ") { txtCEPFormAlteracao.Text = string.Empty; }
                    else { txtCEPFormAlteracao.Text = string.Format(@"{0:00\.000\-000}", long.Parse(DtClientes.Rows[0]["CEP"].ToString())); }

                    txtDataNascimentoFormAlteracao.Text = DtClientes.Rows[0]["DataNascimento"].ToString().Substring(0, 10);
                    txtClienteDesdeFormAlteracao.Text = DtClientes.Rows[0]["ClienteDesde"].ToString().Substring(0, 10);
                    txtIdClienteFormAlteracao.Text = DtClientes.Rows[0]["IdCliente"].ToString();
                    txtNomeFormAlteracao.Text = DtClientes.Rows[0]["Nome"].ToString();
                    txtIdentidadeFormAlteracao.Text = DtClientes.Rows[0]["Identidade"].ToString();
                    txtEnderecoFormAlteracao.Text = DtClientes.Rows[0]["Endereco"].ToString();
                    txtBairroFormAlteracao.Text = DtClientes.Rows[0]["Bairro"].ToString();
                    txtCidadeFormAlteracao.Text = DtClientes.Rows[0]["Cidade"].ToString();
                    txtEstadoFormAlteracao.Text = DtClientes.Rows[0]["Estado"].ToString();
                    txtDDDFormAlteracao.Text = DtClientes.Rows[0]["DDD"].ToString();
                    txtTelefoneFormAlteracao.Text = DtClientes.Rows[0]["TelPrincipal"].ToString();
                    txtTel2FormAlteracao.Text = DtClientes.Rows[0]["Tel2"].ToString();
                    txtCelularFormAlteracao.Text = DtClientes.Rows[0]["CelPrincipal"].ToString();
                    txtCel2FormAlteracao.Text = DtClientes.Rows[0]["Cel2"].ToString();
                    txtEmailFormAlteracao.Text = DtClientes.Rows[0]["EmailPrincipal"].ToString();
                    txtEmail2FormAlteracao.Text = DtClientes.Rows[0]["Email2"].ToString();
                    txtObservacoesFormAlteracao.Text = DtClientes.Rows[0]["Observacoes"].ToString();
                }

                if (tipo == 1)
                {
                    txtCPFFormAlteracao.ReadOnly = true;
                    txtIdentidadeFormAlteracao.ReadOnly = true;

                    if (DtClientes.Rows[0]["CNPJ"].ToString() == "              ") { txtCNPJFormAlteracao.Text = string.Empty; }
                    else { txtCNPJFormAlteracao.Text = string.Format(@"{0:00\.000\.000\/0000\-00}", long.Parse(DtClientes.Rows[0]["CNPJ"].ToString())); }
                    if (DtClientes.Rows[0]["CEP"].ToString() == "        ") { txtCEPFormAlteracao.Text = string.Empty; }
                    else { txtCEPFormAlteracao.Text = string.Format(@"{0:00\.000\-000}", long.Parse(DtClientes.Rows[0]["CEP"].ToString())); }

                    txtDataNascimentoFormAlteracao.Text = DtClientes.Rows[0]["DataNascimento"].ToString().Substring(0, 10);
                    txtClienteDesdeFormAlteracao.Text = DtClientes.Rows[0]["ClienteDesde"].ToString().Substring(0, 10);
                    txtIdClienteFormAlteracao.Text = DtClientes.Rows[0]["IdCliente"].ToString();
                    txtNomeFormAlteracao.Text = DtClientes.Rows[0]["Nome"].ToString();
                    txtNomeFantasiaFormAlteracao.Text = DtClientes.Rows[0]["NomeFantasia"].ToString();
                    txtInscEstadualFormAlteracao.Text = DtClientes.Rows[0]["InscEstadual"].ToString();
                    txtEnderecoFormAlteracao.Text = DtClientes.Rows[0]["Endereco"].ToString();
                    txtBairroFormAlteracao.Text = DtClientes.Rows[0]["Bairro"].ToString();
                    txtCidadeFormAlteracao.Text = DtClientes.Rows[0]["Cidade"].ToString();
                    txtEstadoFormAlteracao.Text = DtClientes.Rows[0]["Estado"].ToString();
                    txtDDDFormAlteracao.Text = DtClientes.Rows[0]["DDD"].ToString();
                    txtTelefoneFormAlteracao.Text = DtClientes.Rows[0]["TelPrincipal"].ToString();
                    txtTel2FormAlteracao.Text = DtClientes.Rows[0]["Tel2"].ToString();
                    txtCelularFormAlteracao.Text = DtClientes.Rows[0]["CelPrincipal"].ToString();
                    txtCel2FormAlteracao.Text = DtClientes.Rows[0]["Cel2"].ToString();
                    txtEmailFormAlteracao.Text = DtClientes.Rows[0]["EmailPrincipal"].ToString();
                    txtEmail2FormAlteracao.Text = DtClientes.Rows[0]["Email2"].ToString();
                    txtObservacoesFormAlteracao.Text = DtClientes.Rows[0]["Observacoes"].ToString();
                }
            }
        }

        protected void btnSalvarFormAlteracao_Click(object sender, EventArgs e)
        {
            int Id = int.Parse(txtIdClienteFormAlteracao.Text);
            DtClientes = CliDal.Detalhes(Id);
            tipo = Convert.ToInt32(DtClientes.Rows[0]["IdTipo"]);
            string strNome = txtNomeFormAlteracao.Text;
            string strNomeFantasia = txtNomeFantasiaFormAlteracao.Text;
            string strInscEstadual = txtInscEstadualFormAlteracao.Text;
            string strIdentidade = txtIdentidadeFormAlteracao.Text;
            string strEndereco = txtEnderecoFormAlteracao.Text;
            string strBairro = txtBairroFormAlteracao.Text;
            string strCidade = txtCidadeFormAlteracao.Text;
            string strEstado = txtEstadoFormAlteracao.Text;
            string strCEP = txtCEPFormAlteracao.Text.Replace("-", string.Empty);
            string strDDD = txtDDDFormAlteracao.Text;
            string strTelefone = txtTelefoneFormAlteracao.Text.Replace("-", string.Empty);
            string strTel2 = txtTel2FormAlteracao.Text.Replace("-", string.Empty);
            string strCelular = txtCelularFormAlteracao.Text.Replace("-", string.Empty);
            string strCel2 = txtCel2FormAlteracao.Text.Replace("-", string.Empty);
            string strEmail = txtEmailFormAlteracao.Text;
            string strEmail2 = txtEmail2FormAlteracao.Text;
            string strDataNascimento = txtDataNascimentoFormAlteracao.Text;
            string strClienteDesde = txtClienteDesdeFormAlteracao.Text;
            DateTime dtDataNascimento;
            DateTime dtClienteDesde;
            string strObservacoes = txtObservacoesFormAlteracao.Text;

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

            if (tipo == 0)
            {
                string strCPF = txtCPFFormAlteracao.Text.Replace(".", string.Empty).Replace("-", string.Empty);
                CliDal.AtualizarCliente(Id, strNome, strCPF, strIdentidade, strEndereco, strBairro, strCidade, strEstado, strCEP, strDDD, strTelefone, strTel2, strCelular, strCel2, strEmail, strEmail2, dtDataNascimento, dtClienteDesde, strObservacoes);
            }

            if (tipo == 1)
            {
               string strCNPJ = txtCNPJFormAlteracao.Text.Replace(".", string.Empty).Replace("/", string.Empty).Replace("-", string.Empty);
                CliDal.AtualizarCliente(Id, strNome, strNomeFantasia, strCNPJ, strInscEstadual, strEndereco ,strBairro, strCidade, strEstado, strCEP, strDDD, strTelefone, strTel2, strCelular, strCel2, strEmail, strEmail2, dtDataNascimento, dtClienteDesde, strObservacoes);
            }
        }
    }
}