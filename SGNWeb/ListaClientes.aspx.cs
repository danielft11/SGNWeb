using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

namespace SGNWeb
{
    public partial class ListaClientes : System.Web.UI.Page
    {

        ClienteDAL CliDal = new ClienteDAL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GVClientes.DataSource = CliDal.ListarSimples();
                GVClientes.DataBind();
            }
        }

        protected void GVClientes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVClientes.PageIndex = e.NewPageIndex;
            GVClientes.DataSource = CliDal.ListarSimples();
            GVClientes.DataBind();
        }

        protected void GVClientes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Selecionar"))
            {
                //Recuperando linha do Grid, ID e Nome do cliente na linha do Grid.
                int Index = Convert.ToInt32(e.CommandArgument);
                int ID = Convert.ToInt32(GVClientes.DataKeys[Index].Value.ToString());
                string Nome = GVClientes.Rows[Index].Cells[2].Text;

                //Criando a instância da função javascript através da string "s" e chamando a mesma através do ClientScript.
                string s = "sendValues('" + ID + "','" + Nome + "');";
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", s, true);
            }
        }
    }
}