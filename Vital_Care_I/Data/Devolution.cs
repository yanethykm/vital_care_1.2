using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Oracle.DataAccess.Client;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;

namespace Data
{
    public class Devolution
    {
        #region variables
        private Persistence db;
        #endregion


        /// <summary>
        /// Es la instancia del objeto de la clase Persistence
        /// </summary>
        # region get-set
        public Devolution()
        {
            db = new Persistence("Vital_Care_1");
        }
        #endregion


        public DataTable ListarDevolucion()
        {
            try
            {
                DataTable ds = new DataTable();
                db.AbrirConexion();

                OracleCommand cmd = new OracleCommand("PQ_DEVOLUCION_PACKAGE.SP_LIST_DEVOLUCION_DDL", db.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                OracleParameter p_Cursor = new OracleParameter("p_Cursor", OracleDbType.RefCursor);
                p_Cursor.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(p_Cursor);

                OracleDataAdapter da = new OracleDataAdapter(cmd);
                da.Fill(ds);

                db.CerrarConexion();

                return ds;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public DataTable InsertarDevolucion(DateTime FechaDevolucion, int CantidadDevuelta, string RazonDevolucion, int IdVenta)
        {
            try
            {
                DataTable ds = new DataTable();
                db.AbrirConexion();

                OracleCommand cmd = new OracleCommand("PQ_DEVOLUCION_PACKAGE.SP_INSERT_DEVOLUCION", db.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                OracleParameter p_Cursor = new OracleParameter("p_Cursor", OracleDbType.RefCursor);
                p_Cursor.Direction = ParameterDirection.Output;

                OracleParameter p_FechaDevolucion = new OracleParameter("p_FechaDevolucion", OracleDbType.Date);
                p_FechaDevolucion.Direction = ParameterDirection.Input;
                p_FechaDevolucion.Value = FechaDevolucion;

                OracleParameter p_CantidadDevuelta = new OracleParameter("p_CantidadDevuelta", OracleDbType.Int32);
                p_CantidadDevuelta.Direction = ParameterDirection.Input;
                p_CantidadDevuelta.Value = CantidadDevuelta;

                OracleParameter p_RazonDevolucion = new OracleParameter("p_RazonDevolucion", OracleDbType.Varchar2);
                p_RazonDevolucion.Direction = ParameterDirection.Input;
                p_RazonDevolucion.Value = RazonDevolucion;

                OracleParameter p_IdVenta = new OracleParameter("p_IdVenta", OracleDbType.Int32);
                p_IdVenta.Direction = ParameterDirection.Input;
                p_IdVenta.Value = IdVenta;

                cmd.Parameters.Add(p_Cursor);
                cmd.Parameters.Add(p_FechaDevolucion);
                cmd.Parameters.Add(p_CantidadDevuelta);
                cmd.Parameters.Add(p_RazonDevolucion);
                cmd.Parameters.Add(p_IdVenta);

                OracleDataAdapter da = new OracleDataAdapter(cmd);
                da.Fill(ds);

                db.CerrarConexion();

                return ds;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}