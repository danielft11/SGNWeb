using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Text;

namespace DAL
{
    public class ClienteDAL : Conexao
    {
        string SQLSelect = "SELECT IdCliente, IdTipo, Nome, NomeFantasia, CPF, Identidade, CNPJ, InscEstadual, Endereco, Bairro, Cidade, Estado, CEP, DDD, TelPrincipal, Tel2, CelPrincipal, Cel2, EmailPrincipal, Email2 , DataNascimento, ClienteDesde, Observacoes FROM        Clientes";
        
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

        public DataTable ListarSimples()
        {
            string SQLSelect = "SELECT IdCliente, Nome FROM Clientes";

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
            }
        }

        public DataTable ListarPorNome()
        {
            string SQLSelect = "SELECT IdCliente, IdTipo, Nome, NomeFantasia, CPF, Identidade, CNPJ, InscEstadual, Endereco, Bairro, Cidade,         Estado, CEP, DDD, TelPrincipal, Tel2, CelPrincipal, Cel2, EmailPrincipal, Email2 , DataNascimento, ClienteDesde, Observacoes FROM Clientes ORDER BY Nome";
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

        public void Inserir(int IdTipo, string Nome, string CPF, string Identidade, string Endereco, string Bairro, string Cidade, string Estado, string CEP, string DDD, string TelPrincipal, string Tel2, string CelPrincipal, string Cel2, string EmailPrincipal, string Email2, DateTime DataNascimento, DateTime ClienteDesde, string Observacoes)
        {
            AbrirConexao();
            Cmd = new SqlCommand("INSERT INTO Clientes(IdTipo, Nome, CPF, Identidade, Endereco, Bairro, Cidade, Estado, CEP, DDD, TelPrincipal, Tel2, CelPrincipal, Cel2, EmailPrincipal, Email2, DataNascimento, ClienteDesde, Observacoes)" +
                "VALUES(@IdTipo, @Nome, @CPF, @Identidade, @Endereco, @Bairro, @Cidade, @Estado, @CEP, @DDD, @TelPrincipal, @Tel2, @CelPrincipal, @Cel2, @EmailPrincipal, @Email2, @DataNascimento, @ClienteDesde, @Observacoes)", Con);

            Cmd.Parameters.AddWithValue("@IdTipo", IdTipo);
            Cmd.Parameters.AddWithValue("@Nome", Nome);
            Cmd.Parameters.AddWithValue("@CPF", CPF);
            Cmd.Parameters.AddWithValue("@Identidade", Identidade);
            Cmd.Parameters.AddWithValue("@Endereco", Endereco);
            Cmd.Parameters.AddWithValue("@Bairro", Bairro);
            Cmd.Parameters.AddWithValue("@Cidade", Cidade);
            Cmd.Parameters.AddWithValue("@Estado", Estado);
            Cmd.Parameters.AddWithValue("@CEP", CEP);
            Cmd.Parameters.AddWithValue("@DDD", DDD);
            Cmd.Parameters.AddWithValue("@TelPrincipal", TelPrincipal);
            Cmd.Parameters.AddWithValue("@Tel2", Tel2);
            Cmd.Parameters.AddWithValue("@CelPrincipal", CelPrincipal);
            Cmd.Parameters.AddWithValue("@Cel2", Cel2);
            Cmd.Parameters.AddWithValue("@EmailPrincipal", EmailPrincipal);
            Cmd.Parameters.AddWithValue("@Email2", Email2);
            Cmd.Parameters.AddWithValue("@DataNascimento", DataNascimento);
            Cmd.Parameters.AddWithValue("@ClienteDesde", ClienteDesde);
            Cmd.Parameters.AddWithValue("@Observacoes", Observacoes);

            Da = new SqlDataAdapter();
            Da.InsertCommand = Cmd;
            Da.InsertCommand.ExecuteNonQuery();

            FecharConexao();
        }

        public void Inserir(int IdTipo, string Nome, string NomeFantasia, string CNPJ, string InscEstadual, string Endereco, string Bairro, string Cidade, string Estado, string CEP, string DDD, string TelPrincipal, string Tel2, string CelPrincipal, string Cel2, string EmailPrincipal, string Email2, DateTime DataNascimento, DateTime ClienteDesde, string Observacoes)
        {
            AbrirConexao();
            Cmd = new SqlCommand("INSERT INTO Clientes(IdTipo, Nome, NomeFantasia, CNPJ, InscEstadual, Endereco, Bairro, Cidade, Estado, CEP, DDD, TelPrincipal, Tel2, CelPrincipal, Cel2, EmailPrincipal, Email2, DataNascimento, ClienteDesde, Observacoes)" +
                "VALUES(@IdTipo, @Nome, @NomeFantasia, @CNPJ, @InscEstadual, @Endereco, @Bairro, @Cidade, @Estado, @CEP, @DDD, @TelPrincipal, @Tel2, @CelPrincipal, @Cel2, @EmailPrincipal, @Email2, @DataNascimento, @ClienteDesde, @Observacoes)", Con);

            Cmd.Parameters.AddWithValue("@IdTipo", IdTipo);
            Cmd.Parameters.AddWithValue("@Nome", Nome);
            Cmd.Parameters.AddWithValue("@NomeFantasia", NomeFantasia);
            Cmd.Parameters.AddWithValue("@CNPJ", CNPJ);
            Cmd.Parameters.AddWithValue("@InscEstadual", InscEstadual);
            Cmd.Parameters.AddWithValue("@Endereco", Endereco);
            Cmd.Parameters.AddWithValue("@Bairro", Bairro);
            Cmd.Parameters.AddWithValue("@Cidade", Cidade);
            Cmd.Parameters.AddWithValue("@Estado", Estado);
            Cmd.Parameters.AddWithValue("@CEP", CEP);
            Cmd.Parameters.AddWithValue("@DDD", DDD);
            Cmd.Parameters.AddWithValue("@TelPrincipal", TelPrincipal);
            Cmd.Parameters.AddWithValue("@Tel2", Tel2);
            Cmd.Parameters.AddWithValue("@CelPrincipal", CelPrincipal);
            Cmd.Parameters.AddWithValue("@Cel2", Cel2);
            Cmd.Parameters.AddWithValue("@EmailPrincipal", EmailPrincipal);
            Cmd.Parameters.AddWithValue("@Email2", Email2);
            Cmd.Parameters.AddWithValue("@DataNascimento", DataNascimento);
            Cmd.Parameters.AddWithValue("@ClienteDesde", ClienteDesde);
            Cmd.Parameters.AddWithValue("@Observacoes", Observacoes);

            Da = new SqlDataAdapter();
            Da.InsertCommand = Cmd;
            Da.InsertCommand.ExecuteNonQuery();

            FecharConexao();
        }

        public void AtualizarCliente(int IdCliente, string Nome, string CPF, string Identidade, string Endereco, string Bairro, string Cidade, string Estado, string CEP, string DDD, string TelPrincipal, string Tel2, string CelPrincipal, string Cel2, string EmailPrincipal, string Email2, DateTime DataNascimento, DateTime ClienteDesde, string Observacoes)
        {
            AbrirConexao();
            Cmd = new SqlCommand("UPDATE Clientes SET Nome = @Nome, CPF= @CPF, Identidade = @Identidade, Endereco = @Endereco, Bairro = @Bairro, Cidade = @Cidade, Estado = @Estado, CEP = @CEP, DDD = @DDD, TelPrincipal = @TelPrincipal, Tel2 = @Tel2, CelPrincipal = @CelPrincipal, Cel2 = @Cel2, EmailPrincipal = @EmailPrincipal, Email2 = @Email2,  DataNascimento = @DataNascimento, ClienteDesde = @ClienteDesde, Observacoes = @Observacoes WHERE IdCliente = @IdCliente", Con);

            Cmd.Parameters.AddWithValue("@Nome", Nome);
            Cmd.Parameters.AddWithValue("@CPF", CPF);
            Cmd.Parameters.AddWithValue("@Identidade", Identidade);
            Cmd.Parameters.AddWithValue("@Endereco", Endereco);
            Cmd.Parameters.AddWithValue("@Bairro", Bairro);
            Cmd.Parameters.AddWithValue("@Cidade", Cidade);
            Cmd.Parameters.AddWithValue("@Estado", Estado);
            Cmd.Parameters.AddWithValue("@CEP", CEP);
            Cmd.Parameters.AddWithValue("@DDD", DDD);
            Cmd.Parameters.AddWithValue("@TelPrincipal", TelPrincipal);
            Cmd.Parameters.AddWithValue("@Tel2", Tel2);
            Cmd.Parameters.AddWithValue("@CelPrincipal", CelPrincipal);
            Cmd.Parameters.AddWithValue("@Cel2", Cel2);
            Cmd.Parameters.AddWithValue("@EmailPrincipal", EmailPrincipal);
            Cmd.Parameters.AddWithValue("@Email2", Email2);
            Cmd.Parameters.AddWithValue("@DataNascimento", DataNascimento);
            Cmd.Parameters.AddWithValue("@ClienteDesde", ClienteDesde);
            Cmd.Parameters.AddWithValue("@Observacoes", Observacoes);
            Cmd.Parameters.AddWithValue("@IdCliente", IdCliente);

            Da = new SqlDataAdapter();
            Da.UpdateCommand = Cmd;
            Da.UpdateCommand.ExecuteNonQuery();
        }

        public void AtualizarCliente(int IdCliente, string Nome, string NomeFantasia, string CNPJ, string InscEstadual, string Endereco, string Bairro, string Cidade, string Estado, string CEP, string DDD, string TelPrincipal, string Tel2, string CelPrincipal, string Cel2, string EmailPrincipal, string Email2, DateTime DataNascimento, DateTime ClienteDesde, string Observacoes)
        {
            AbrirConexao();
            Cmd = new SqlCommand("UPDATE Clientes SET Nome = @Nome, NomeFantasia= @NomeFantasia, CNPJ = @CNPJ, InscEstadual = @InscEstadual, Endereco = @Endereco, Bairro = @Bairro, Cidade = @Cidade, Estado = @Estado, CEP = @CEP, DDD = @DDD, TelPrincipal = @TelPrincipal, Tel2 = @Tel2, CelPrincipal = @CelPrincipal, Cel2 = @Cel2, EmailPrincipal = @EmailPrincipal, Email2 = @Email2,  DataNascimento = @DataNascimento, ClienteDesde = @ClienteDesde, Observacoes = @Observacoes WHERE IdCliente = @IdCliente", Con);

            Cmd.Parameters.AddWithValue("@Nome", Nome);
            Cmd.Parameters.AddWithValue("@NomeFantasia", NomeFantasia);
            Cmd.Parameters.AddWithValue("@CNPJ", CNPJ);
            Cmd.Parameters.AddWithValue("@InscEstadual", InscEstadual);
            Cmd.Parameters.AddWithValue("@Endereco", Endereco);
            Cmd.Parameters.AddWithValue("@Bairro", Bairro);
            Cmd.Parameters.AddWithValue("@Cidade", Cidade);
            Cmd.Parameters.AddWithValue("@Estado", Estado);
            Cmd.Parameters.AddWithValue("@CEP", CEP);
            Cmd.Parameters.AddWithValue("@DDD", DDD);
            Cmd.Parameters.AddWithValue("@TelPrincipal", TelPrincipal);
            Cmd.Parameters.AddWithValue("@Tel2", Tel2);
            Cmd.Parameters.AddWithValue("@CelPrincipal", CelPrincipal);
            Cmd.Parameters.AddWithValue("@Cel2", Cel2);
            Cmd.Parameters.AddWithValue("@EmailPrincipal", EmailPrincipal);
            Cmd.Parameters.AddWithValue("@Email2", Email2);
            Cmd.Parameters.AddWithValue("@DataNascimento", DataNascimento);
            Cmd.Parameters.AddWithValue("@ClienteDesde", ClienteDesde);
            Cmd.Parameters.AddWithValue("@Observacoes", Observacoes);
            Cmd.Parameters.AddWithValue("@IdCliente", IdCliente);

            Da = new SqlDataAdapter();
            Da.UpdateCommand = Cmd;
            Da.UpdateCommand.ExecuteNonQuery();
        }

        public void ExcluirCliente(int IdCliente)
        {
            AbrirConexao();
            Cmd = new SqlCommand("DELETE FROM Clientes WHERE IdCliente = @IdCliente", Con);

            Cmd.Parameters.AddWithValue("@IdCliente", IdCliente);

            Da = new SqlDataAdapter();
            Da.DeleteCommand = Cmd;
            Da.DeleteCommand.ExecuteNonQuery();
        }

        public DataTable Detalhes(int IdCliente)
        {
            SQLSelect = "SELECT IdCliente, IdTipo, Nome, NomeFantasia, CPF, Identidade, CNPJ, InscEstadual, Endereco, Bairro, Cidade, Estado, CEP, DDD, TelPrincipal, Tel2, CelPrincipal, Cel2, EmailPrincipal, Email2 , DataNascimento, ClienteDesde, Observacoes FROM Clientes Where IdCliente = @IdCliente";

            try
            {
                AbrirConexao();
                Cmd = new SqlCommand(SQLSelect, Con);
                Cmd.Parameters.AddWithValue("@IdCliente", IdCliente);
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

        public DataTable Detalhes(string Nome)
        {
            SQLSelect = "SELECT IdCliente, IdTipo, Nome, NomeFantasia, CPF, Identidade, CNPJ, InscEstadual, Endereco, Bairro, Cidade, Estado, CEP, DDD, TelPrincipal, Tel2, CelPrincipal, Cel2, EmailPrincipal, Email2 , DataNascimento, ClienteDesde, Observacoes FROM Clientes WHERE (Nome like '%" + Nome + "%')";

            try
            {
                AbrirConexao();
                Cmd = new SqlCommand(SQLSelect, Con);
                Cmd.Parameters.AddWithValue("@Nome", "%" + Nome + "%");
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