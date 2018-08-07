using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

namespace SGNWeb
{
    public partial class clientes : System.Web.UI.Page
    {
        ClienteDAL CliDal = new ClienteDAL();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GridView1.DataSource = CliDal.Listar();
                GridView1.DataBind();
            }    
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataSource = CliDal.Listar();
            GridView1.DataBind();
        }

        protected void btnDetalhes_Click(object sender, EventArgs e)
        {
            Button btnDetalhes = (Button)sender; //Resgata o próprio objeto e converte para ele mesmo.
            TableCell cell = new TableCell(); //Cria um objeto do tipo TableCell.
            cell = (TableCell)btnDetalhes.Parent; //Resgata a célula da tabela do gridview onde esta localizado o controle Button.
            GridViewRow row = (GridViewRow)cell.Parent; //Resgata a linha do gridview onde esta localizado o controle Button.
            int Linha = row.RowIndex; //Resgata o indice da linha selecionada.
            string valor = GridView1.Rows[Linha].Cells[0].Text;
            int IdCliente = int.Parse(valor);

            Session["IdentificadoId"] = IdCliente;

            string script = "window.open('detalhesClientes.aspx', 'Detalhes do Cliente', 'toolbar=no, width=1170, height=760, top=20, left=120', '_parent')";
            ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);

            //Documentação:
            //http://fernandosanchesarce.blogspot.com.br/2011/03/resgatando-indice-da-linha-seleciona.html
            //http://andretoniate.blogspot.com.br/2011/12/pegando-o-valor-de-uma-celula-em-uma.html
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            Button btnEditar = (Button)sender; //Resgata o próprio objeto e converte para ele mesmo.
            TableCell cell = new TableCell(); //Cria um objeto do tipo TableCell.
            cell = (TableCell)btnEditar.Parent; //Resgata a célula da tabela do gridview onde esta localizado o controle Button.
            GridViewRow row = (GridViewRow)cell.Parent; //Resgata a linha do gridview onde esta localizado o controle Button.
            int Linha = row.RowIndex; //Resgata o indice da linha selecionada.
            string valor = GridView1.Rows[Linha].Cells[0].Text;
            int IdCliente = int.Parse(valor);

            Session["IdentificadoId"] = IdCliente;
            //Response.Redirect("alteracaoClientes.aspx");

            string script = "window.open('alteracaoClientes.aspx', 'Alteração do Cliente', 'toolbar=no, width=1170, height=760, top=20, left=120', '_parent')";
            ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);

        }

        protected void btnExcluir_Click(object sender, EventArgs e)
        {
            Button btnExcluir = (Button)sender; //Resgata o próprio objeto e converte para ele mesmo.
            TableCell cell = new TableCell(); //Cria um objeto do tipo TableCell.
            cell = (TableCell)btnExcluir.Parent; //Resgata a célula da tabela do gridview onde esta localizado o controle Button.
            GridViewRow row = (GridViewRow)cell.Parent; //Resgata a linha do gridview onde esta localizado o controle Button.
            int Linha = row.RowIndex; //Resgata o indice da linha selecionada.
            string valor = GridView1.Rows[Linha].Cells[0].Text;
            int IdCliente = int.Parse(valor);

            CliDal.ExcluirCliente(IdCliente); 
        }

        protected void btnFiltro_Click(object sender, EventArgs e)
        {
            string sOpcao = DDLCliente.SelectedValue;

            switch (sOpcao)
            {
                case "1":
                    if (!string.IsNullOrEmpty(txtPesquisa.Text))
                    {
                        try
                        {
                            int Id = int.Parse(txtPesquisa.Text);
                            GridView1.DataSource = CliDal.Detalhes(Id);
                            GridView1.DataBind();
                        }
                        catch (Exception ex)
                        {
                            string strTitulo = "Ocorreu erro ao tentar filtrar os dados. Certifique-se que você tenha informado numeral caso a busca seja por ID. Detalhes:";
                            ClientScript.RegisterStartupScript(GetType(), "alert", "ShowModal('" + strTitulo + "','" + ex.Message + "')", true);
                        }
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(GetType(), "alert", "ShowModal('Campo em branco','Por favor, preencha um valor no Textbox para pesquisa.')", true);
                    }
                    break;
                case "2":
                    if (!string.IsNullOrEmpty(txtPesquisa.Text))
                    {
                        string strNome = txtPesquisa.Text;
                        GridView1.DataSource = CliDal.Detalhes(strNome);
                        GridView1.DataBind();
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(GetType(), "alert", "ShowModal('Campo em branco','Por favor, preencha um valor no Textbox para pesquisa.')", true);
                    }
                    break;
            }
        }

        protected void btnAtualizar_Click(object sender, EventArgs e)
        {
            GridView1.DataSource = CliDal.Listar();
            GridView1.DataBind();
        }

        protected void btnOrdernarNomeAZ_Click(object sender, EventArgs e)
        {
            GridView1.DataSource = CliDal.ListarPorNome();
            GridView1.DataBind();
        }
    }
}