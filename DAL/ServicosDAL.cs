using System;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class ServicosDAL : Conexao
    {
        String SQLSelect = "SELECT IdServico, Codigo, Titulo, Descricao, Preco FROM Servicos";

        public DataTable Listar()
        {
            try
            {
                AbrirConexao();
                Da = new SqlDataAdapter(SQLSelect, Con);
                Dt = new DataTable();
                Da.Fill(Dt);
                return Dt;
            }
            catch (Exception)
            {
                return null;
            }
            finally
            {
                FecharConexao();
            }
        }

        public void Inserir(string Codigo, string Titulo, string Descricao, decimal Preco)
        {
            AbrirConexao();

            Cmd = new SqlCommand("INSERT INTO Servicos (Codigo, Titulo, Descricao, Preco)" +
            "Values (@Codigo, @Titulo, @Descricao, @Preco)", Con);

            Cmd.Parameters.AddWithValue("@Codigo", Codigo);
            Cmd.Parameters.AddWithValue("@Titulo", Titulo);
            Cmd.Parameters.AddWithValue("@Descricao", Descricao);
            Cmd.Parameters.AddWithValue("@Preco", Preco);

            Da = new SqlDataAdapter();
            Da.InsertCommand = Cmd;
            Da.InsertCommand.ExecuteNonQuery();
            FecharConexao();
        }

        public DataTable Detalhes(int IdServico)
        {
            SQLSelect = "SELECT IdServico, Codigo, Titulo, Descricao, Preco FROM Servicos WHERE IdServico = @IdServico";

            try
            {
                AbrirConexao();
                Cmd = new SqlCommand(SQLSelect, Con);
                Cmd.Parameters.AddWithValue("@IdServico", IdServico);
                Dt = new DataTable();
                Da = new SqlDataAdapter();
                Da.SelectCommand = Cmd;
                Da.Fill(Dt);
                return Dt;
            }
            catch (Exception)
            {
                return null;
            }
            finally
            {
                FecharConexao();
            }
        }

        public DataTable Detalhes(string Codigo)
        {
            SQLSelect = "SELECT IdServico, Codigo, Titulo, Descricao, Preco FROM Servicos WHERE Codigo LIKE  '%" + Codigo + "%'";

            try
            {
                AbrirConexao();
                Cmd = new SqlCommand(SQLSelect, Con);
                Cmd.Parameters.AddWithValue("@Codigo", "%" + Codigo + "%");
                Dt = new DataTable();
                Da = new SqlDataAdapter();
                Da.SelectCommand = Cmd;
                Da.Fill(Dt);
                return Dt;
            }
            catch (Exception)
            {
                return null;
            }
            finally
            {
                FecharConexao();
            }
        }

        public DataTable DetalhesTitulo(string Titulo)
        {
            SQLSelect = "SELECT IdServico, Codigo, Titulo, Descricao, Preco FROM Servicos WHERE Titulo LIKE  '%" + Titulo + "%'";

            try
            {
                AbrirConexao();
                Cmd = new SqlCommand(SQLSelect, Con);
                Cmd.Parameters.AddWithValue("@Titulo", "%" + Titulo + "%");
                Dt = new DataTable();
                Da = new SqlDataAdapter();
                Da.SelectCommand = Cmd;
                Da.Fill(Dt);
                return Dt;
            }
            catch (Exception)
            {
                return null;
            }
            finally
            {
                FecharConexao();
            }
        }

        public void AtualizarServico(int IdServico, string Titulo, string Descricao, decimal Preco)
        {
            AbrirConexao();
            Cmd = new SqlCommand("UPDATE Servicos SET Titulo = @Titulo, Descricao = @Descricao, Preco = @Preco WHERE IdServico = @IdServico", Con);

            Cmd.Parameters.AddWithValue("@Titulo", Titulo);
            Cmd.Parameters.AddWithValue("@Descricao", Descricao);
            Cmd.Parameters.AddWithValue("@Preco", Preco);
            Cmd.Parameters.AddWithValue("@IdServico", IdServico);

            Da = new SqlDataAdapter();
            Da.UpdateCommand = Cmd;
            Da.UpdateCommand.ExecuteNonQuery();
        }

        public void ExcluirServico(int IdServico)
        {
            AbrirConexao();
            Cmd = new SqlCommand("DELETE FROM Servicos WHERE IdServico = @IdServico", Con);

            Cmd.Parameters.AddWithValue("@IdServico", IdServico);

            Da = new SqlDataAdapter();
            Da.DeleteCommand = Cmd;
            Da.DeleteCommand.ExecuteNonQuery();
        }
    }
}