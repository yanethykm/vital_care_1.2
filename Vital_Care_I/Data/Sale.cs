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
    public class Sale
    {
        #region variables
        private Persistence db;
        #endregion


        /// <summary>
        /// Es la instancia del objeto de la clase Persistence
        /// </summary>
        # region get-set
        public Sale()
        {
            db = new Persistence("Vital_Care_1");
        }
        #endregion


        public DataTable ListarVenta()
        {
            try
            {
                DataTable ds = new DataTable();
                db.AbrirConexion();

                OracleCommand cmd = new OracleCommand("PQ_VENTA_PACKAGE.SP_LIST_VENTA_DDL", db.Conexion);
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

        public DataTable InsertarVenta(int IdCliente, int IdVendedor, int IdProducto, int CantidadVendida)
        {
            try
            {
                DataTable ds = new DataTable();
                db.AbrirConexion();

                OracleCommand cmd = new OracleCommand("PQ_VENTA_PACKAGE.SP_INSERT_VENTA_TOTAL", db.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                OracleParameter p_Cursor = new OracleParameter("p_Cursor", OracleDbType.RefCursor);
                p_Cursor.Direction = ParameterDirection.Output;

                OracleParameter p_IdCliente = new OracleParameter("p_IdCliente", OracleDbType.Int32);
                p_IdCliente.Direction = ParameterDirection.Input;
                p_IdCliente.Value = IdCliente;

                OracleParameter p_IdVendedor = new OracleParameter("p_IdVendedor", OracleDbType.Int32);
                p_IdVendedor.Direction = ParameterDirection.Input;
                p_IdVendedor.Value = IdVendedor;

                OracleParameter p_IdProducto = new OracleParameter("p_IdProducto", OracleDbType.Int32);
                p_IdProducto.Direction = ParameterDirection.Input;
                p_IdProducto.Value = IdProducto;

                OracleParameter p_CantidadVendida = new OracleParameter("p_CantidadVendida", OracleDbType.Int32);
                p_CantidadVendida.Direction = ParameterDirection.Input;
                p_CantidadVendida.Value = CantidadVendida;

                cmd.Parameters.Add(p_Cursor);
                cmd.Parameters.Add(p_IdCliente);
                cmd.Parameters.Add(p_IdVendedor);
                cmd.Parameters.Add(p_IdProducto);
                cmd.Parameters.Add(p_CantidadVendida);

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

        public DataTable EliminarVenta(int _IdVenta)
        {
            try
            {
                DataTable ds = new DataTable();
                db.AbrirConexion();

                OracleCommand cmd = new OracleCommand("PQ_VENTA_PACKAGE.SP_DELETE_VENTA", db.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                OracleParameter p_Cursor = new OracleParameter("p_Cursor", OracleDbType.RefCursor);
                p_Cursor.Direction = ParameterDirection.Output;

                OracleParameter p_IdVenta = new OracleParameter("p_IdVenta", OracleDbType.Int32);
                p_IdVenta.Direction = ParameterDirection.Input;
                p_IdVenta.Value = _IdVenta;

                cmd.Parameters.Add(p_Cursor);
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