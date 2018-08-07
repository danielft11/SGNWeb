using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using System.Web;
using System.Text.RegularExpressions;

namespace SGNWeb
{
    public partial class ListaClientesOS : System.Web.UI.Page
    {

        ClienteDAL CliDal = new ClienteDAL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GVClientesLCliOS.DataSource = CliDal.ListarPorNome();
                GVClientesLCliOS.DataBind();
            }
        }

        protected void GVClientesLCliOS_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVClientesLCliOS.PageIndex = e.NewPageIndex;
            GVClientesLCliOS.DataSource = CliDal.ListarPorNome();
            GVClientesLCliOS.DataBind();
        }

        protected void GVClientesLCliOS_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Selecionar"))
            {
                //Recuperando linha do Grid, ID e Nome do cliente na linha do Grid.
                int Index       = Convert.ToInt32(e.CommandArgument);
                int ID          = Convert.ToInt32(GVClientesLCliOS.DataKeys[Index].Value.ToString());
                string Nome     = GVClientesLCliOS.Rows[Index].Cells[2].Text;
                string DDD      = GVClientesLCliOS.Rows[Index].Cells[3].Text;
                string Telefone = Regex.Replace(GVClientesLCliOS.Rows[Index].Cells[4].Text, @"<[^>]+>|&nbsp;", "").Trim();
                string Celular  = Regex.Replace(GVClientesLCliOS.Rows[Index].Cells[5].Text, @"<[^>]+>|&nbsp;", "").Trim(); 
                string Email    = Regex.Replace(GVClientesLCliOS.Rows[Index].Cells[6].Text, @"<[^>]+>|&nbsp;", "").Trim(); 

                //Criando a instância da função javascript através da string "s" e chamando a mesma através do ClientScript.
                string s = "sendValues('" + ID + "','" + Nome + "','" + DDD + "','" + Telefone + "','" + Celular + "','" + Email + "');";
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", s, true);
            }
        }
    }
}