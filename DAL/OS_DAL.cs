using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace DAL
{
    public class OS_DAL : Conexao
    {
        public int idRetorno;

        public int getIdRetorno()
        {
            return idRetorno;
        }

        public void Inserir(int Equipamento, int IdCliente, DateTime DtInicio, DateTime DtTermino, string Defeito, string Diagnostico, string Resultado, GridView GvItens)
        {
            AbrirConexao();

            Cmd = new SqlCommand("INSERT INTO OrdemServico (Equipamento, IdCliente, DtInicio, DtTermino, Defeito, Diagnostico, Resultado)" +
            "Values (@Equipamento, @IdCliente, @DtInicio, @DtTermino, @Defeito, @Diagnostico, @Resultado) SELECT SCOPE_IDENTITY()", Con);
            
            Cmd.Parameters.AddWithValue("@Equipamento", Equipamento);
            Cmd.Parameters.AddWithValue("@IdCliente", IdCliente);
            Cmd.Parameters.AddWithValue("@DtInicio", DtInicio);
            Cmd.Parameters.AddWithValue("@DtTermino", DtTermino);
            Cmd.Parameters.AddWithValue("@Defeito", Defeito);
            Cmd.Parameters.AddWithValue("@Diagnostico", Diagnostico);
            Cmd.Parameters.AddWithValue("@Resultado", Resultado);

            Da = new SqlDataAdapter();
            Da.InsertCommand = Cmd;
            idRetorno = Convert.ToInt32(Cmd.ExecuteScalar());

            //Percorrer GridView e enquanto houver linhas (itens), gravá-las no banco.
            foreach (GridViewRow linha in GvItens.Rows)
            {
                Cmd = new SqlCommand("INSERT INTO ItensOrdem(Quantidade, PrecoUnitario, ValorParcial, OrdemServico, IdSrv) VALUES(@Quantidade, @PrecoUnitario, @ValorParcial, @OrdemServico, @IdSrv)", Con);

                int Quantidade        = int.Parse(linha.Cells[4].Text);
                decimal PrecoUnitario = Convert.ToDecimal(linha.Cells[3].Text);
                decimal ValorParcial  = Convert.ToDecimal(linha.Cells[5].Text);
                int OrdemServico      = idRetorno;
                int IdSrv             = int.Parse(linha.Cells[1].Text);

                Cmd.Parameters.AddWithValue("@Quantidade", Quantidade);
                Cmd.Parameters.AddWithValue("@PrecoUnitario", PrecoUnitario);
                Cmd.Parameters.AddWithValue("@ValorParcial", ValorParcial);
                Cmd.Parameters.AddWithValue("@OrdemServico", OrdemServico);
                Cmd.Parameters.AddWithValue("@IdSrv", IdSrv);

                Da = new SqlDataAdapter();
                Da.InsertCommand = Cmd;
                Da.InsertCommand.ExecuteNonQuery();
            }
            FecharConexao();
        }
    }
}