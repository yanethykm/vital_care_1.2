using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using Oracle.DataAccess.Client;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;

namespace Data
{
    public class Product
    {

        #region variables
        private Persistence db;
        #endregion

        /// <summary>
        /// Es la instancia del objeto de la clase Persistence
        /// </summary>
        # region get-set
        public Product()
        {
            db = new Persistence("Vital_Care_1");
        }
        #endregion

        /// <summary>
        /// Metodo para listar los productos existentes en la base de datos
        /// </summary>
        /// <returns></returns>
        public DataTable ListarProducto()
        {
            try
            {
                DataTable ds = new DataTable();
                db.AbrirConexion();

                OracleCommand cmd = new OracleCommand("PQ_PRODUCTO_PACKAGE.SP_LIST_PRODUCTO_DDL", db.Conexion);
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

        /// <summary>
        /// Metodo para insertar un producto
        /// </summary>
        /// <param name="ID">codigo de producto</param>
        /// <param name="Producto">nombre producto</param>
        /// <param name="Descripcion">presentacion del producto</param>
        /// <param name="PrecioVenta">precio venta unitario</param>
        /// <param name="CantidadMinima">cantidad minima en stock</param>
        /// <param name="Cantidad">cantidad ingresada</param>
        /// <param name="IdCategoria"></param>
        /// <param name="IdProveedor"></param>
        /// <returns></returns>
        public DataTable InsertarProducto(int ID, string Producto, string Descripcion, int PrecioVenta, int CantidadMinima, int Cantidad, int IdCategoria, int IdProveedor)
        {
            try
            {
                DataTable ds = new DataTable();
                db.AbrirConexion();

                OracleCommand cmd = new OracleCommand("PQ_PRODUCTO_PACKAGE.SP_INSERT_PRODUCTO", db.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                OracleParameter p_Cursor = new OracleParameter("p_Cursor", OracleDbType.RefCursor);
                p_Cursor.Direction = ParameterDirection.Output;

                OracleParameter p_ID = new OracleParameter("p_IdProducto", OracleDbType.Int32);
                p_ID.Direction = ParameterDirection.Input;
                p_ID.Value = ID;

                OracleParameter p_Producto = new OracleParameter("p_Producto", OracleDbType.Varchar2);
                p_Producto.Direction = ParameterDirection.Input;
                p_Producto.Value = Producto;

                OracleParameter p_Descripcion = new OracleParameter("p_Descripcion", OracleDbType.Varchar2);
                p_Descripcion.Direction = ParameterDirection.Input;
                p_Descripcion.Value = Descripcion;

                OracleParameter p_PrecioVenta = new OracleParameter("p_PrecioVenta", OracleDbType.Int32);
                p_PrecioVenta.Direction = ParameterDirection.Input;
                p_PrecioVenta.Value = PrecioVenta;

                OracleParameter p_CantidadMinima = new OracleParameter("p_CantidadMinima", OracleDbType.Int32);
                p_CantidadMinima.Direction = ParameterDirection.Input;
                p_CantidadMinima.Value = CantidadMinima;

                OracleParameter p_Cantidad = new OracleParameter("p_Cantidad", OracleDbType.Int32);
                p_Cantidad.Direction = ParameterDirection.Input;
                p_Cantidad.Value = Cantidad;

                OracleParameter p_IdCategoria = new OracleParameter("p_IdCategoria", OracleDbType.Int32);
                p_IdCategoria.Direction = ParameterDirection.Input;
                p_IdCategoria.Value = IdCategoria;

                OracleParameter p_IdProveedor = new OracleParameter("p_IdProveedor", OracleDbType.Int32);
                p_IdProveedor.Direction = ParameterDirection.Input;
                p_IdProveedor.Value = IdProveedor;

                cmd.Parameters.Add(p_Cursor);
                cmd.Parameters.Add(p_ID);
                cmd.Parameters.Add(p_Producto);
                cmd.Parameters.Add(p_Descripcion);
                cmd.Parameters.Add(p_PrecioVenta);
                cmd.Parameters.Add(p_CantidadMinima);
                cmd.Parameters.Add(p_Cantidad);
                cmd.Parameters.Add(p_IdCategoria);
                cmd.Parameters.Add(p_IdProveedor);

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

        /// <summary>
        /// Metodo para actualizar un producto
        /// </summary>
        /// <param name="IDOld">ID ANTERIOR</param>
        /// <param name="IDNew">ID NUEVO</param>
        /// <param name="Producto">nombre producto</param>
        /// <param name="Descripcion">presentacion del producto</param>
        /// <param name="PrecioVenta">precio venta unitario</param>
        /// <param name="CantidadMinima">cantidad minima en stock</param>
        /// <param name="Cantidad">cantidad ingresada</param>
        /// <param name="IdCategoria"></param>
        /// <param name="IdProveedor"></param>
        /// <returns></returns>
        public DataTable ActualizarProducto(int IDOld, int IDNew, string Producto, string Descripcion, int PrecioVenta, int CantidadMinima, int Cantidad, int IdCategoria, int IdProveedor)
        {
            try
            {
                DataTable ds = new DataTable();
                db.AbrirConexion();

                OracleCommand cmd = new OracleCommand("PQ_PRODUCTO_PACKAGE.SP_UPDATE_PRODUCTO", db.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                OracleParameter p_Cursor = new OracleParameter("p_Cursor", OracleDbType.RefCursor);
                p_Cursor.Direction = ParameterDirection.Output;

                OracleParameter p_IDOld = new OracleParameter("p_OldIdProducto", OracleDbType.Int32);
                p_IDOld.Direction = ParameterDirection.Input;
                p_IDOld.Value = IDOld;

                OracleParameter p_IDNew = new OracleParameter("p_NewIdProducto", OracleDbType.Int32);
                p_IDNew.Direction = ParameterDirection.Input;
                p_IDNew.Value = IDNew;

                OracleParameter p_Producto = new OracleParameter("p_Producto", OracleDbType.Varchar2);
                p_Producto.Direction = ParameterDirection.Input;
                p_Producto.Value = Producto;

                OracleParameter p_Descripcion = new OracleParameter("p_Descripcion", OracleDbType.Varchar2);
                p_Descripcion.Direction = ParameterDirection.Input;
                p_Descripcion.Value = Descripcion;

                OracleParameter p_PrecioVenta = new OracleParameter("p_PrecioVenta", OracleDbType.Int32);
                p_PrecioVenta.Direction = ParameterDirection.Input;
                p_PrecioVenta.Value = PrecioVenta;

                OracleParameter p_CantidadMinima = new OracleParameter("p_CantidadMinima", OracleDbType.Int32);
                p_CantidadMinima.Direction = ParameterDirection.Input;
                p_CantidadMinima.Value = CantidadMinima;

                OracleParameter p_Cantidad = new OracleParameter("p_Cantidad", OracleDbType.Int32);
                p_Cantidad.Direction = ParameterDirection.Input;
                p_Cantidad.Value = Cantidad;

                OracleParameter p_IdCategoria = new OracleParameter("p_IdCategoria", OracleDbType.Int32);
                p_IdCategoria.Direction = ParameterDirection.Input;
                p_IdCategoria.Value = IdCategoria;

                OracleParameter p_IdProveedor = new OracleParameter("p_IdProveedor", OracleDbType.Int32);
                p_IdProveedor.Direction = ParameterDirection.Input;
                p_IdProveedor.Value = IdProveedor;

                cmd.Parameters.Add(p_Cursor);
                cmd.Parameters.Add(p_IDOld);
                cmd.Parameters.Add(p_IDNew);
                cmd.Parameters.Add(p_Producto);
                cmd.Parameters.Add(p_Descripcion);
                cmd.Parameters.Add(p_PrecioVenta);
                cmd.Parameters.Add(p_CantidadMinima);
                cmd.Parameters.Add(p_Cantidad);
                cmd.Parameters.Add(p_IdCategoria);
                cmd.Parameters.Add(p_IdProveedor);

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

        /// <summary>
        /// Metodo para eliminar un producto
        /// </summary>
        /// <param name="IDOld"></param>
        /// <returns></returns>
        public DataTable EliminarProducto(int IDOld)
        {
            try
            {
                DataTable ds = new DataTable();
                db.AbrirConexion();

                OracleCommand cmd = new OracleCommand("PQ_PRODUCTO_PACKAGE.SP_DELETE_PRODUCTO", db.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                OracleParameter p_Cursor = new OracleParameter("p_Cursor", OracleDbType.RefCursor);
                p_Cursor.Direction = ParameterDirection.Output;

                OracleParameter p_IDOld = new OracleParameter("p_IdProducto", OracleDbType.Int32);
                p_IDOld.Direction = ParameterDirection.Input;
                p_IDOld.Value = IDOld;

                cmd.Parameters.Add(p_Cursor);
                cmd.Parameters.Add(p_IDOld);

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