using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BLL
{
    public class Cliente
    {
        public int Tipo { get; set; }
        public string Nome { get; set; }
        public string NomeFantasia { get; set; }
        public string CPF { get; set; }
        public string Identidade { get; set; }
        public string CNPJ { get; set; }
        public string InscEstaudla { get; set; }
        public string Endereco { get; set; }
        public string Bairro { get; set; }
        public string Cidade { get; set; }
        public string Estado { get; set; }
        public string CEP { get; set; }
        public string DDD { get; set; }
        public string TelPrincipal { get; set; }
        public string Tel2 { get; set; }
        public string CelPrincipal { get; set; }
        public string Cel2 { get; set; }
        public string EmailPrincipal { get; set; }
        public string Email2 { get; set; }
        public string DataNascimento { get; set; }
        public string ClienteDesde { get; set; }
        public string Observacoes { get; set; }
    }
}