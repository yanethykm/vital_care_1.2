using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using Oracle.DataAccess.Client;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;

namespace Data
{
    public class Category
    {
        #region variables
        private Persistence db;
        #endregion


        /// <summary>
        /// Es la instancia del objeto de la clase Persistence
        /// </summary>
        # region get-set
        public Category()
        {
            db = new Persistence("Vital_Care_1");
        }
        #endregion

        public DataTable ListarCategoria()
        {
            try
            {
                DataTable ds = new DataTable();
                db.AbrirConexion();

                OracleCommand cmd = new OracleCommand("PQ_CATEGORIA_PACKAGE.SP_LIST_CATEGORIA", db.Conexion);
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

        public DataTable InsertarCategoria(string Categoria)
        {
            try
            {
                DataTable ds = new DataTable();
                db.AbrirConexion();

                OracleCommand cmd = new OracleCommand("PQ_CATEGORIA_PACKAGE.SP_INSERT_CATEGORIA", db.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                OracleParameter p_Cursor = new OracleParameter("p_Cursor", OracleDbType.RefCursor);
                p_Cursor.Direction = ParameterDirection.Output;

                OracleParameter p_Categoria = new OracleParameter("p_Categoria", OracleDbType.Varchar2);
                p_Categoria.Direction = ParameterDirection.Input;
                p_Categoria.Value = Categoria;


                cmd.Parameters.Add(p_Cursor);
                cmd.Parameters.Add(p_Categoria);


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

        public DataTable ActualizarCategoria(int IDCategoria, string Categoria)
        {
            try
            {
                DataTable ds = new DataTable();
                db.AbrirConexion();

                OracleCommand cmd = new OracleCommand("PQ_CATEGORIA_PACKAGE.SP_UPDATE_CATEGORIA", db.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                OracleParameter p_Cursor = new OracleParameter("p_Cursor", OracleDbType.RefCursor);
                p_Cursor.Direction = ParameterDirection.Output;

                OracleParameter p_IDCategoria = new OracleParameter("p_IDCategoria", OracleDbType.Int32);
                p_IDCategoria.Direction = ParameterDirection.Input;
                p_IDCategoria.Value = IDCategoria;

                OracleParameter p_Categoria = new OracleParameter("p_Categoria", OracleDbType.Varchar2);
                p_Categoria.Direction = ParameterDirection.Input;
                p_Categoria.Value = Categoria;

                cmd.Parameters.Add(p_Cursor);
                cmd.Parameters.Add(p_IDCategoria);
                cmd.Parameters.Add(p_Categoria);


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

        public DataTable EliminarCategoria(int IDCategoria)
        {
            try
            {
                DataTable ds = new DataTable();
                db.AbrirConexion();

                OracleCommand cmd = new OracleCommand("PQ_CATEGORIA_PACKAGE.SP_DELETE_CATEGORIA", db.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                OracleParameter p_Cursor = new OracleParameter("p_Cursor", OracleDbType.RefCursor);
                p_Cursor.Direction = ParameterDirection.Output;

                OracleParameter p_IDCategoria = new OracleParameter("p_IDCategoria", OracleDbType.Int32);
                p_IDCategoria.Direction = ParameterDirection.Input;
                p_IDCategoria.Value = IDCategoria;

                cmd.Parameters.Add(p_Cursor);
                cmd.Parameters.Add(p_IDCategoria);

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