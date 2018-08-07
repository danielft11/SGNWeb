using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

namespace SGNWeb
{
    public partial class ordemServicoInclusao : Page
    {
        ClienteDAL CliOSDal = new ClienteDAL();
        EquipamentoDAL EquiptoDal = new EquipamentoDAL();
        ServicosDAL ServDal = new ServicosDAL();
        OS_DAL OrdemServico = new OS_DAL();

        DataTable DtClientes = new DataTable();
        DataTable DtEquiptos = new DataTable();
        DataTable DtServicos = new DataTable();
        DataTable dtItens = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                dtItens = CriaDataTable();

                Session["myDatatable"] = dtItens;

                GVItensOrdem.DataSource = ((DataTable)Session["myDatatable"]).DefaultView;
                GVItensOrdem.DataBind();
            }
        }

        private DataTable CriaDataTable()
        {
            DataTable mDataTable = new DataTable();
            DataColumn mDataColumn;

            mDataColumn = new DataColumn();
            mDataColumn.DataType = Type.GetType("System.Int32");
            mDataColumn.ColumnName = "ID";
            mDataTable.Columns.Add(mDataColumn);

            mDataColumn = new DataColumn();
            mDataColumn.DataType = Type.GetType("System.String");
            mDataColumn.ColumnName = "Item";
            mDataTable.Columns.Add(mDataColumn);

            mDataColumn = new DataColumn();
            mDataColumn.DataType = Type.GetType("System.String");
            mDataColumn.ColumnName = "Descricao";
            mDataTable.Columns.Add(mDataColumn);

            mDataColumn = new DataColumn();
            mDataColumn.DataType = Type.GetType("System.Int32");
            mDataColumn.ColumnName = "Quantidade";
            mDataTable.Columns.Add(mDataColumn);

            mDataColumn = new DataColumn();
            mDataColumn.DataType = Type.GetType("System.Decimal");
            mDataColumn.ColumnName = "ValorUnitario";
            mDataTable.Columns.Add(mDataColumn);

            mDataColumn = new DataColumn();
            mDataColumn.DataType = Type.GetType("System.Decimal");
            mDataColumn.ColumnName = "ValorParcial";
            mDataTable.Columns.Add(mDataColumn);

            return mDataTable;
        }

        protected void lkBtnAdicionar_Click(object sender, EventArgs e)
        {
            int IdSrv = int.Parse(HFieldID.Value);
            int Quantidade = int.Parse(txtQtdItem.Value);
            string sValUnitario = txtValUnit.Text.Replace("R$", string.Empty);
            decimal dValUnitario = Convert.ToDecimal(sValUnitario);
            decimal ValParcial = Quantidade * dValUnitario;
            
            IncluirNoDataTable(IdSrv, txtCodItem.Text, txtTituloItem.Text, Quantidade, dValUnitario, ValParcial, (DataTable)Session["myDatatable"]);
            GVItensOrdem.DataSource = ((DataTable)Session["myDatatable"]).DefaultView;
            GVItensOrdem.DataBind();
        }

        private void IncluirNoDataTable(int IdSrv, string Item, string Descricao, int Quantidade, decimal valorUnitario, decimal valorParcial, DataTable mTable)
        {
            DataRow linha;

            linha = mTable.NewRow();

            linha["ID"]             = IdSrv;
            linha["Item"]           = Item;
            linha["Descricao"]      = Descricao;
            linha["Quantidade"]     = Quantidade;
            linha["ValorUnitario"]  = valorUnitario;
            linha["ValorParcial"]   = valorParcial;

            mTable.Rows.Add(linha);
        }

        protected void btnBuscaCli_Click(object sender, EventArgs e)
        {
            DtClientes = CliOSDal.Listar();
            GVClientesOS.DataSource = DtClientes;
            GVClientesOS.DataBind();

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#ClientesModal').modal('show');");
            sb.Append(@"</script>");

            ScriptManager.RegisterStartupScript(this, GetType(), "ClientesScript", sb.ToString(), false);
        }

        protected void GVClientesOS_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVClientesOS.PageIndex = e.NewPageIndex;
            GVClientesOS.DataSource = CliOSDal.Listar();
            GVClientesOS.DataBind();
        }

        protected void GVClientesOS_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Selecionar"))
            {
                int linhaGrid = Convert.ToInt32(e.CommandArgument);
                int idCliente = Convert.ToInt32(GVClientesOS.DataKeys[linhaGrid].Value.ToString());

                DtClientes = CliOSDal.Detalhes(idCliente);

                txtIDCli.Text    = idCliente.ToString();
                txtNomeCli.Text  = DtClientes.Rows[0]["Nome"].ToString();
                txtDDDCli.Text   = DtClientes.Rows[0]["DDD"].ToString();
                txtTelCli.Text   = DtClientes.Rows[0]["TelPrincipal"].ToString();
                txtCelCli.Text   = DtClientes.Rows[0]["CelPrincipal"].ToString();
                txtEmailCli.Text = DtClientes.Rows[0]["EmailPrincipal"].ToString();
            }
        }

        protected void btnBuscaEquipto_Click(object sender, EventArgs e)
        {
            try
            {
                DtEquiptos = EquiptoDal.BuscaEquipto(Convert.ToInt32(txtIDCli.Text));
                GVEquiptosOS.DataSource = DtEquiptos;
                GVEquiptosOS.DataBind();

                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#EquiptosModal').modal('show');");
                sb.Append(@"</script>");

                ScriptManager.RegisterStartupScript(this, GetType(), "EquiptosScript", sb.ToString(), false);
            }
            catch (Exception)
            {
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#AlertaModal').modal('show');");
                sb.Append(@"</script>");

                ScriptManager.RegisterStartupScript(this, GetType(), "AlertasScript", sb.ToString(), false);
            }
        }

        protected void GVEquiptosOS_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVEquiptosOS.PageIndex = e.NewPageIndex;
            GVEquiptosOS.DataSource = EquiptoDal.Listar();
            GVEquiptosOS.DataBind();
        }

        protected void GVEquiptosOS_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Selecionar"))
            {
                int linhaGrid = Convert.ToInt32(e.CommandArgument);
                int idEquipamento = Convert.ToInt32(GVEquiptosOS.DataKeys[linhaGrid].Value.ToString());

                DtEquiptos = EquiptoDal.Detalhes(idEquipamento);

                txtIdEquipto.Text     = idEquipamento.ToString();
                txtTipoEquipto.Text   = DtEquiptos.Rows[0]["Tipo"].ToString();
                txtMarcaEquipto.Text  = DtEquiptos.Rows[0]["Marca"].ToString();
                txtModeloEquipto.Text = DtEquiptos.Rows[0]["Modelo"].ToString();
                txtNSEquipto.Text     = DtEquiptos.Rows[0]["NumSerie"].ToString();
            }
        }

        protected void btnBuscaServico_Click(object sender, EventArgs e)
        {
            DtServicos = ServDal.Listar();
            GVServicosOS.DataSource = DtServicos;
            GVServicosOS.DataBind();

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$('#ServicosModal').modal('show');");
            sb.Append(@"</script>");

            ScriptManager.RegisterStartupScript(this, GetType(), "ServicosScript", sb.ToString(), false);
        }

        protected void GVServicosOS_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVServicosOS.PageIndex = e.NewPageIndex;
            GVServicosOS.DataSource = ServDal.Listar();
            GVServicosOS.DataBind();
        }

        protected void GVServicosOS_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Selecionar"))
            {
                int linhaGVServicosOS = Convert.ToInt32(e.CommandArgument);
                int idServico = Convert.ToInt32(GVServicosOS.DataKeys[linhaGVServicosOS].Value.ToString());

                DtServicos = ServDal.Detalhes(idServico);

                txtCodItem.Text     = DtServicos.Rows[0]["Codigo"].ToString();
                txtTituloItem.Text  = DtServicos.Rows[0]["Titulo"].ToString();
                txtValUnit.Text     = DtServicos.Rows[0]["Preco"].ToString();
                HFieldID.Value      = DtServicos.Rows[0]["IdServico"].ToString(); 
            }
        }

        protected void btnSalvarOS_Click(object sender, EventArgs e)
        {
            int Equipamento = Convert.ToInt32(txtIdEquipto.Text);
            int IdCliente = Convert.ToInt32(txtIDCli.Text);
            string sDataInicio = txtDtInicio.Text + " 00:00:00";
            DateTime DataInicio = Convert.ToDateTime(sDataInicio);
            string sDataTermino = txtDtConclusao.Text + " 00:00:00";
            DateTime DataTermino = Convert.ToDateTime(sDataTermino);
            string Defeito = txtDefeito.Text;
            string Diagnostico = txtDiagnostico.Text;
            string Resultado = txtResultado.Text;

            OrdemServico.Inserir(Equipamento, IdCliente, DataInicio, DataTermino, Defeito, Diagnostico, Resultado, GVItensOrdem);

            txtNumOS.Text = OrdemServico.getIdRetorno().ToString();
        }

        protected void GVItensOrdem_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dtExclusao = ((DataTable)Session["myDatatable"]);
            dtExclusao.Rows.RemoveAt(e.RowIndex);
            GVItensOrdem.DataSource = ((DataTable)Session["myDatatable"]).DefaultView;
            GVItensOrdem.DataBind();
        }
    }
}