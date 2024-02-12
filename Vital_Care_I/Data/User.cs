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
    public class User
    {
        #region variables
        private Persistence db;
        #endregion


        /// <summary>
        /// Es la instancia del objeto de la clase Persistence
        /// </summary>
        # region get-set
        public User()
        {
            db = new Persistence("Vital_Care_1");
        }
        #endregion

        /// <summary>
        /// Metodo para listar Usuarios
        /// </summary>
        /// <returns></returns>
        public DataTable ListarUsuario()
        {
            try
            {
                DataTable ds = new DataTable();
                db.AbrirConexion();

                OracleCommand cmd = new OracleCommand("PQ_USUARIO_PACKAGE.SP_LIST_USUARIO_DDL", db.Conexion);
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

        public DataTable InsertarUsuario(string Usuario, string Clave, string Estado,int IdPersona)
        {
            try
            {
                DataTable ds = new DataTable();
                db.AbrirConexion();

                OracleCommand cmd = new OracleCommand("PQ_USUARIO_PACKAGE.SP_INSERT_USUARIO", db.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                OracleParameter p_Cursor = new OracleParameter("p_Cursor", OracleDbType.RefCursor);
                p_Cursor.Direction = ParameterDirection.Output;

                OracleParameter p_Usuario = new OracleParameter("p_Usuario", OracleDbType.Varchar2);
                p_Usuario.Direction = ParameterDirection.Input;
                p_Usuario.Value = Usuario;

                OracleParameter p_Clave = new OracleParameter("p_Clave", OracleDbType.Varchar2);
                p_Clave.Direction = ParameterDirection.Input;
                p_Clave.Value = Clave;

                OracleParameter p_Estado = new OracleParameter("p_Estado", OracleDbType.Varchar2);
                p_Estado.Direction = ParameterDirection.Input;
                p_Estado.Value = Estado;

                OracleParameter p_IdPersona = new OracleParameter("p_IdPersona", OracleDbType.Int32);
                p_IdPersona.Direction = ParameterDirection.Input;
                p_IdPersona.Value = IdPersona;

                cmd.Parameters.Add(p_Cursor);
                cmd.Parameters.Add(p_Usuario);
                cmd.Parameters.Add(p_Clave);
                cmd.Parameters.Add(p_Estado);
                cmd.Parameters.Add(p_IdPersona);

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

        public DataTable ActualizarUsuario(int IdUsuario, string Usuario, string Clave, string Estado, int IdPersona)
        {
            try
            {
                DataTable ds = new DataTable();
                db.AbrirConexion();

                OracleCommand cmd = new OracleCommand("PQ_USUARIO_PACKAGE.SP_UPDATE_USUARIO", db.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                OracleParameter p_Cursor = new OracleParameter("p_Cursor", OracleDbType.RefCursor);
                p_Cursor.Direction = ParameterDirection.Output;

                OracleParameter p_IdUsuario = new OracleParameter("p_IdUsuario", OracleDbType.Int32);
                p_IdUsuario.Direction = ParameterDirection.Input;
                p_IdUsuario.Value = IdUsuario;

                OracleParameter p_Usuario = new OracleParameter("p_Usuario", OracleDbType.Varchar2);
                p_Usuario.Direction = ParameterDirection.Input;
                p_Usuario.Value = Usuario;

                OracleParameter p_Clave = new OracleParameter("p_Clave", OracleDbType.Varchar2);
                p_Clave.Direction = ParameterDirection.Input;
                p_Clave.Value = Clave;

                OracleParameter p_Estado = new OracleParameter("p_Estado", OracleDbType.Varchar2);
                p_Estado.Direction = ParameterDirection.Input;
                p_Estado.Value = Estado;

                OracleParameter p_IdPersona = new OracleParameter("p_IdPersona", OracleDbType.Int32);
                p_IdPersona.Direction = ParameterDirection.Input;
                p_IdPersona.Value = IdPersona;

                cmd.Parameters.Add(p_Cursor);
                cmd.Parameters.Add(p_IdUsuario);
                cmd.Parameters.Add(p_Usuario);
                cmd.Parameters.Add(p_Clave);
                cmd.Parameters.Add(p_Estado);
                cmd.Parameters.Add(p_IdPersona);


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

        public DataTable EliminarUsuario(int IdUsuario)
        {
            try
            {
                DataTable ds = new DataTable();
                db.AbrirConexion();

                OracleCommand cmd = new OracleCommand("PQ_USUARIO_PACKAGE.SP_DELETE_USUARIO", db.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                OracleParameter p_Cursor = new OracleParameter("p_Cursor", OracleDbType.RefCursor);
                p_Cursor.Direction = ParameterDirection.Output;

                OracleParameter p_IdUsuario = new OracleParameter("p_IdUsuario", OracleDbType.Int32);
                p_IdUsuario.Direction = ParameterDirection.Input;
                p_IdUsuario.Value = IdUsuario;

                cmd.Parameters.Add(p_Cursor);
                cmd.Parameters.Add(p_IdUsuario);

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

        public DataTable ListarPersona()
        {
            try
            {
                DataTable ds = new DataTable();
                db.AbrirConexion();

                OracleCommand cmd = new OracleCommand("PQ_USUARIO_PACKAGE.SP_LIST_PERSONA", db.Conexion);
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
    }
}