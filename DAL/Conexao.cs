using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace DAL
{
    public class Conexao
    {
        protected SqlConnection Con;
        protected SqlCommand Cmd;
        protected DataTable Dt;
        protected DataSet Ds;
        protected SqlDataAdapter Da;

        public void AbrirConexao()
        {
            try
            {
                Con = new SqlConnection(@"Data Source=DANIEL;Initial Catalog=SGN;Persist Security Info=True;User ID=sa;Password=123");
                Con.Open();
            }
            catch (Exception)
            {
                
            }
        }

        public void FecharConexao()
        {
            try
            {
                Con.Close();
            }
            catch (Exception)
            {
                
            }
        }

    }
}