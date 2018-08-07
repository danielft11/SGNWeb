using System;
using DAL;
using System.Data;

namespace SGNWeb
{
    public partial class detalhesClientes : System.Web.UI.Page
    {
        ClienteDAL CliDal = new ClienteDAL();

        protected void Page_Load(object sender, EventArgs e)
        {
            int Identificador = Convert.ToInt32(Session["IdentificadoId"]);
            DataTable DtClientes = CliDal.Detalhes(Identificador);
            int tipo = Convert.ToInt32(DtClientes.Rows[0]["IdTipo"]);

            if (tipo == 0)
            {
                if (DtClientes.Rows[0]["CPF"].ToString() == "           ") { txtCPFFormDetalhes.Text = string.Empty; }
                else { txtCPFFormDetalhes.Text = string.Format(@"{0:000\.000\.000\-00}", long.Parse(DtClientes.Rows[0]["CPF"].ToString())); }
                if (DtClientes.Rows[0]["CEP"].ToString() == "        ") { txtCEP.Text = string.Empty; }
                else { txtCEP.Text = string.Format(@"{0:00\.000\-000}", long.Parse(DtClientes.Rows[0]["CEP"].ToString())); }

                txtDataNascimentoFormDetalhes.Text = DtClientes.Rows[0]["DataNascimento"].ToString().Substring(0, 10);
                txtClienteDesdeFormDetalhes.Text = DtClientes.Rows[0]["ClienteDesde"].ToString().Substring(0, 10);
                txtIdClienteFormDetalhes.Text = DtClientes.Rows[0]["IdCliente"].ToString();
                txtNomeFormDetalhes.Text = DtClientes.Rows[0]["Nome"].ToString();
                txtIdentidadeFormDetalhes.Text = DtClientes.Rows[0]["Identidade"].ToString();
                txtEnderecoFormDetalhes.Text = DtClientes.Rows[0]["Endereco"].ToString();
                txtBairroFormDetalhes.Text = DtClientes.Rows[0]["Bairro"].ToString();
                txtCidadeFormDetalhes.Text = DtClientes.Rows[0]["Cidade"].ToString();
                txtEstadoFormDetalhes.Text = DtClientes.Rows[0]["Estado"].ToString();
                txtDDDFormDetalhes.Text = DtClientes.Rows[0]["DDD"].ToString();
                txtTelefoneFormDetalhes.Text = DtClientes.Rows[0]["TelPrincipal"].ToString();
                txtTel2FormDetalhes.Text = DtClientes.Rows[0]["Tel2"].ToString();
                txtCelularFormDetalhes.Text = DtClientes.Rows[0]["CelPrincipal"].ToString();
                txtCel2FormDetalhes.Text = DtClientes.Rows[0]["Cel2"].ToString();
                txtEmailFormDetalhes.Text = DtClientes.Rows[0]["EmailPrincipal"].ToString();
                txtEmail2FormDetalhes.Text = DtClientes.Rows[0]["Email2"].ToString();
                txtObservacoesFormDetalhes.Text = DtClientes.Rows[0]["Observacoes"].ToString();

            }

            if (tipo == 1)
            {
                if (DtClientes.Rows[0]["CNPJ"].ToString() == "              ") { txtCNPJFormDetalhes.Text = string.Empty; }
                else { txtCNPJFormDetalhes.Text = string.Format(@"{0:00\.000\.000\/0000\-00}", long.Parse(DtClientes.Rows[0]["CNPJ"].ToString())); }
                if (DtClientes.Rows[0]["CEP"].ToString() == "        ") { txtCEP.Text = string.Empty; }
                else { txtCEP.Text = string.Format(@"{0:00\.000\-000}", long.Parse(DtClientes.Rows[0]["CEP"].ToString())); }

                txtDataNascimentoFormDetalhes.Text = DtClientes.Rows[0]["DataNascimento"].ToString().Substring(0, 10);
                txtClienteDesdeFormDetalhes.Text = DtClientes.Rows[0]["ClienteDesde"].ToString().Substring(0, 10);
                txtIdClienteFormDetalhes.Text = DtClientes.Rows[0]["IdCliente"].ToString();
                txtNomeFormDetalhes.Text = DtClientes.Rows[0]["Nome"].ToString();
                txtNomeFantasiaFormDetalhes.Text = DtClientes.Rows[0]["NomeFantasia"].ToString();
                txtInscEstadualFormDetalhes.Text = DtClientes.Rows[0]["InscEstadual"].ToString();
                txtEnderecoFormDetalhes.Text = DtClientes.Rows[0]["Endereco"].ToString();
                txtBairroFormDetalhes.Text = DtClientes.Rows[0]["Bairro"].ToString();
                txtCidadeFormDetalhes.Text = DtClientes.Rows[0]["Cidade"].ToString();
                txtEstadoFormDetalhes.Text = DtClientes.Rows[0]["Estado"].ToString();
                txtDDDFormDetalhes.Text = DtClientes.Rows[0]["DDD"].ToString();
                txtTelefoneFormDetalhes.Text = DtClientes.Rows[0]["TelPrincipal"].ToString();
                txtTel2FormDetalhes.Text = DtClientes.Rows[0]["Tel2"].ToString();
                txtCelularFormDetalhes.Text = DtClientes.Rows[0]["CelPrincipal"].ToString();
                txtCel2FormDetalhes.Text = DtClientes.Rows[0]["Cel2"].ToString();
                txtEmailFormDetalhes.Text = DtClientes.Rows[0]["EmailPrincipal"].ToString();
                txtEmail2FormDetalhes.Text = DtClientes.Rows[0]["Email2"].ToString();
                txtObservacoesFormDetalhes.Text = DtClientes.Rows[0]["Observacoes"].ToString();
            }
        }
    }
}