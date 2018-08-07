using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGNWeb
{
    public partial class teste : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDecimal_Click(object sender, EventArgs e)
        {
            decimal valor;
            if (textBoxValorDecimal.Text.Contains("."))
            {
                //Se existe armazeno a cultura que está sendo usada
                CultureInfo ciAtual = Thread.CurrentThread.CurrentCulture;
                
                //Altero a cultura corrente para "en-US"
                Thread.CurrentThread.CurrentCulture = new CultureInfo("en-US");
                
                //Mando converter a string do TextBox e armazeno na variável "valor"
                valor = Convert.ToDecimal(textBoxValorDecimal.Text);
                
                //Exibo na tela o valor com a cultura que você estava usando
                Label1.Text = valor.ToString(ciAtual);
                
                //e por fim altero a cultura para a anterior
                Thread.CurrentThread.CurrentCulture = ciAtual;
            }
            else
            {
                //se na string não existe "." então coverto para decimal o valor e armazeno na variável;
                valor = Convert.ToDecimal(textBoxValorDecimal.Text);
           

                //e por fim exibo o valor na tela
                Label1.Text = valor.ToString();
            }
        }
    }
}

//Fonte: https://social.msdn.microsoft.com/Forums/pt-BR/fbbadf4b-4fde-45af-8958-a212956b3bc3/como-fazer-uma-variavel-decimal-ou-floatdouble-aceitar-como-entrada-de-separao-decimal-tanto-o?forum=vscsharppt