using System;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class EquipamentoDAL : Conexao
    {
        string SQLSelect = "SELECT Equipamentos.IdEquipamento, Equipamentos.Marca, Equipamentos.Modelo, Equipamentos.NumSerie, Equipamentos.IdTipo, TipoEquipto.Nome AS Tipo, Equipamentos.Cliente AS CodCliente, Clientes.Nome AS NomeCliente FROM Equipamentos  INNER JOIN Clientes ON Equipamentos.Cliente = Clientes.IdCliente INNER JOIN TipoEquipto ON Equipamentos.IdTipo = TipoEquipto.IdTipoEquipto";

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

        public DataTable ListarTipo()
        {
            SQLSelect = "SELECT IdTipoEquipto, Nome, Descricao FROM TipoEquipto";

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

        public void Inserir(string Marca, string Modelo, string NumSerie, string Descricao, int IdTipo, int Cliente, DateTime DataCadastro)
        {
            AbrirConexao();
            Cmd = new SqlCommand("INSERT INTO Equipamentos (Marca, Modelo, NumSerie, Descricao, IdTipo, Cliente, DataCadastro)" +
            "Values (@Marca, @Modelo, @NumSerie, @Descricao, @IdTipo, @Cliente, @DataCadastro)", Con);

            Cmd.Parameters.AddWithValue("@Marca", Marca);
            Cmd.Parameters.AddWithValue("@Modelo", Modelo);
            Cmd.Parameters.AddWithValue("@NumSerie", NumSerie);
            Cmd.Parameters.AddWithValue("@Descricao", Descricao);
            Cmd.Parameters.AddWithValue("@IdTipo", IdTipo);
            Cmd.Parameters.AddWithValue("@Cliente", Cliente);
            Cmd.Parameters.AddWithValue("@DataCadastro", DataCadastro);

            Da = new SqlDataAdapter();
            Da.InsertCommand = Cmd;
            Da.InsertCommand.ExecuteNonQuery();
            FecharConexao();
        }

        public void AtualizarEquipto(int IdEquipamento, string Marca, string Modelo, string NumSerie, DateTime DataCadastro, string Descricao)
        {
            AbrirConexao();
            Cmd = new SqlCommand("UPDATE Equipamentos SET Marca = @Marca, Modelo = @Modelo, NumSerie = @NumSerie, DataCadastro = @DataCadastro, Descricao = @Descricao WHERE IdEquipamento = @IdEquipamento", Con);

            Cmd.Parameters.AddWithValue("@Marca", Marca);
            Cmd.Parameters.AddWithValue("@Modelo", Modelo);
            Cmd.Parameters.AddWithValue("@NumSerie", NumSerie);
            Cmd.Parameters.AddWithValue("@DataCadastro", DataCadastro);
            Cmd.Parameters.AddWithValue("@Descricao", Descricao);
            Cmd.Parameters.AddWithValue("@IdEquipamento", IdEquipamento);

            Da = new SqlDataAdapter();
            Da.UpdateCommand = Cmd;
            Da.UpdateCommand.ExecuteNonQuery();
        }

        public void ExcluirEquipto(int IdEquipamento)
        {
            AbrirConexao();
            Cmd = new SqlCommand("DELETE FROM Equipamentos WHERE IdEquipamento = @IdEquipamento", Con);

            Cmd.Parameters.AddWithValue("@IdEquipamento", IdEquipamento);

            Da = new SqlDataAdapter();
            Da.DeleteCommand = Cmd;
            Da.DeleteCommand.ExecuteNonQuery();
        }

        public DataTable Detalhes(int IdEquipamento)
        {
            SQLSelect = "SELECT Equipamentos.IdEquipamento AS IdEquipamento, TipoEquipto.Nome AS Tipo, Equipamentos.Marca AS Marca," + 
                        "Equipamentos.Modelo AS Modelo, Equipamentos.NumSerie AS NumSerie, Clientes.Nome AS NomeCliente, DataCadastro, Equipamentos.Descricao AS Descricao " +
                        "FROM Equipamentos  INNER JOIN Clientes ON Equipamentos.Cliente = Clientes.IdCliente "+
                        "INNER JOIN TipoEquipto ON Equipamentos.IdTipo = TipoEquipto.IdTipoEquipto AND IdEquipamento = @IdEquipamento";

            try
            {
                AbrirConexao();
                Cmd = new SqlCommand(SQLSelect, Con);
                Cmd.Parameters.AddWithValue("@IdEquipamento", IdEquipamento);
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

        public DataTable Detalhes(string NumSerie)
        {
            SQLSelect = "SELECT Equipamentos.IdEquipamento, Equipamentos.Marca, Equipamentos.Modelo, Equipamentos.NumSerie, Equipamentos.IdTipo, TipoEquipto.Nome AS Tipo, Equipamentos.Cliente AS CodCliente, Clientes.Nome AS NomeCliente FROM Equipamentos  INNER JOIN Clientes ON Equipamentos.Cliente = Clientes.IdCliente INNER JOIN TipoEquipto ON Equipamentos.IdTipo = TipoEquipto.IdTipoEquipto AND NumSerie like '%" + NumSerie + "%'";

            try
            {
                AbrirConexao();
                Cmd = new SqlCommand(SQLSelect, Con);
                Cmd.Parameters.AddWithValue("@NumSerie", "%" + NumSerie + "%");
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

        public DataTable BuscaEquipto(int Cliente)
        {
            SQLSelect = "SELECT IdEquipamento, TipoEquipto.Nome, Marca, Modelo, NumSerie FROM Equipamentos INNER JOIN TipoEquipto ON Equipamentos.IdTipo = TipoEquipto.IdTipoEquipto WHERE Cliente = @Cliente";

            try
            {
                AbrirConexao();
                Cmd = new SqlCommand(SQLSelect, Con);
                Cmd.Parameters.AddWithValue("@Cliente", Cliente);
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
    }
}