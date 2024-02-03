using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using Oracle.DataAccess.Client;
using System.Linq;
using System.Web;

namespace Data
{
    public class Persistence
    {
        private OracleConnection conexion;

        public OracleConnection Conexion
        {
            get { return conexion; }
        }

        public Persistence(string conexionString)
        {
            conexion = new OracleConnection(ConfigurationManager.ConnectionStrings[conexionString].ConnectionString);
        }

        public void AbrirConexion()
        {
            if (conexion.State != ConnectionState.Open)
                conexion.Open();
        }

        public void CerrarConexion()
        {
            if (conexion.State == ConnectionState.Open)
                conexion.Close();
        }

    }
}