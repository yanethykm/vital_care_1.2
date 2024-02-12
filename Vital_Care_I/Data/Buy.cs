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
    public class Buy
    {
        #region variables
        private Persistence db;
        #endregion


        /// <summary>
        /// Es la instancia del objeto de la clase Persistence
        /// </summary>
        # region get-set
        public Buy()
        {
            db = new Persistence("Vital_Care_1");
        }
        #endregion

        public DataTable ListarCompra()
        {
            try
            {
                DataTable ds = new DataTable();
                db.AbrirConexion();

                OracleCommand cmd = new OracleCommand("PQ_COMPRA_PACKAGE.SP_LIST_COMPRA_DDL", db.Conexion);
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
        public DataTable InsertarCompra(string NumeroFactura, DateTime FechaCompra, int CantidadComprada, int PrecioUnitario, int IdProducto, int IdProveedor)
        {
            try
            {
                DataTable ds = new DataTable();
                db.AbrirConexion();

                OracleCommand cmd = new OracleCommand("PQ_COMPRA_PACKAGE.SP_INSERT_COMPRA", db.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                OracleParameter p_Cursor = new OracleParameter("p_Cursor", OracleDbType.RefCursor);
                p_Cursor.Direction = ParameterDirection.Output;

                OracleParameter p_NumeroFactura = new OracleParameter("p_NumeroFactura", OracleDbType.Varchar2);
                p_NumeroFactura.Direction = ParameterDirection.Input;
                p_NumeroFactura.Value = NumeroFactura;

                OracleParameter p_FechaCompra = new OracleParameter("p_FechaCompra", OracleDbType.Date);
                p_FechaCompra.Direction = ParameterDirection.Input;
                p_FechaCompra.Value = FechaCompra;

                OracleParameter p_CantidadComprada = new OracleParameter("p_CantidadComprada", OracleDbType.Int32);
                p_CantidadComprada.Direction = ParameterDirection.Input;
                p_CantidadComprada.Value = CantidadComprada;

                OracleParameter p_PrecioUnitario = new OracleParameter("p_PrecioUnitario", OracleDbType.Int32);
                p_PrecioUnitario.Direction = ParameterDirection.Input;
                p_PrecioUnitario.Value = PrecioUnitario;

                OracleParameter p_IdProducto = new OracleParameter("p_IdProducto", OracleDbType.Int32);
                p_IdProducto.Direction = ParameterDirection.Input;
                p_IdProducto.Value = IdProducto;

                OracleParameter p_IdProveedor = new OracleParameter("p_IdProveedor", OracleDbType.Int32);
                p_IdProveedor.Direction = ParameterDirection.Input;
                p_IdProveedor.Value = IdProveedor;

                OracleParameter p_MontoTotal = new OracleParameter("p_MontoTotal", OracleDbType.Int32);
                p_MontoTotal.Direction = ParameterDirection.Output;

                cmd.Parameters.Add(p_Cursor);
                cmd.Parameters.Add(p_NumeroFactura);
                cmd.Parameters.Add(p_FechaCompra);
                cmd.Parameters.Add(p_CantidadComprada);
                cmd.Parameters.Add(p_PrecioUnitario);
                cmd.Parameters.Add(p_IdProducto);
                cmd.Parameters.Add(p_IdProveedor);
                cmd.Parameters.Add(p_MontoTotal);



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

        public DataTable EliminarCompra(int IdCompra)
        {
            try
            {
                DataTable ds = new DataTable();
                db.AbrirConexion();

                OracleCommand cmd = new OracleCommand("PQ_COMPRA_PACKAGE.SP_DELETE_COMPRA", db.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                OracleParameter p_Cursor = new OracleParameter("p_Cursor", OracleDbType.RefCursor);
                p_Cursor.Direction = ParameterDirection.Output;

                OracleParameter p_IdCompra = new OracleParameter("p_IdCompra", OracleDbType.Int32);
                p_IdCompra.Direction = ParameterDirection.Input;
                p_IdCompra.Value = IdCompra;

                cmd.Parameters.Add(p_Cursor);
                cmd.Parameters.Add(p_IdCompra);

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