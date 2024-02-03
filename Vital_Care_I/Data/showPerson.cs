using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Oracle.DataAccess.Client;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;

namespace Data
{
    public class showPerson
    {
        #region variables
        private Persistence db;
        #endregion


        /// <summary>
        /// Es la instancia del objeto de la clase Persistence
        /// </summary>
        # region get-set
        public showPerson()
        {
            db = new Persistence("Vital_Care_1");
        }
        #endregion

        /// <summary>
        /// Metodo para listar personas
        /// </summary>
        /// <returns></returns>
        public DataTable ListarPersona()
        {
            try
            {
                DataTable ds = new DataTable();
                db.AbrirConexion();

                OracleCommand cmd = new OracleCommand("PQ_PERSONA_PACKAGE.SP_LIST_PERSONA", db.Conexion);
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
        /// Metodo para insertar personas
        /// </summary>
        /// <param name="NitCedula">identificación parametro</param>
        /// <param name="NombreRazonSocial">Nombre o razon social parametro</param>
        /// <param name="Apellido">Apellido parametro</param>
        /// <param name="Direccion">Dirección parametro</param>
        /// <param name="Telefono">Telefono parametro</param>
        /// <param name="Email">Correo electronico parametro</param>
        /// <param name="TipoDocumento">Tipo de documento: C.C ó C.E ó T.I </param>
        /// <returns></returns>
        public DataTable InsertarPersona(int NitCedula, string NombreRazonSocial, string Apellido, string Direccion, string Telefono, string Email, string TipoDocumento)
        {
            try
            {
                DataTable ds = new DataTable();
                db.AbrirConexion();

                OracleCommand cmd = new OracleCommand("PQ_PERSONA_PACKAGE.SP_INSERT_PERSONA", db.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                OracleParameter p_Cursor = new OracleParameter("p_Cursor", OracleDbType.RefCursor);
                p_Cursor.Direction = ParameterDirection.Output;

                OracleParameter p_NitCedula = new OracleParameter("p_NitCedula", OracleDbType.Int32);
                p_NitCedula.Direction = ParameterDirection.Input;
                p_NitCedula.Value = NitCedula;

                OracleParameter p_NombreRazonSocial = new OracleParameter("p_NombreRazonSocial", OracleDbType.Varchar2);
                p_NombreRazonSocial.Direction = ParameterDirection.Input;
                p_NombreRazonSocial.Value = NombreRazonSocial;

                OracleParameter p_Apellido = new OracleParameter("p_Apellido", OracleDbType.Varchar2);
                p_Apellido.Direction = ParameterDirection.Input;
                p_Apellido.Value = Apellido;

                OracleParameter p_Direccion = new OracleParameter("p_Direccion", OracleDbType.Varchar2);
                p_Direccion.Direction = ParameterDirection.Input;
                p_Direccion.Value = Direccion;

                OracleParameter p_Telefono = new OracleParameter("p_Telefono", OracleDbType.Varchar2);
                p_Telefono.Direction = ParameterDirection.Input;
                p_Telefono.Value = Telefono;

                OracleParameter p_Email = new OracleParameter("p_Email", OracleDbType.Varchar2);
                p_Email.Direction = ParameterDirection.Input;
                p_Email.Value = Email;

                OracleParameter p_TipoDocumento = new OracleParameter("p_TipoDocumento", OracleDbType.Varchar2);
                p_TipoDocumento.Direction = ParameterDirection.Input;
                p_TipoDocumento.Value = TipoDocumento;
                
                cmd.Parameters.Add(p_Cursor);
                cmd.Parameters.Add(p_NitCedula);
                cmd.Parameters.Add(p_NombreRazonSocial);
                cmd.Parameters.Add(p_Apellido);
                cmd.Parameters.Add(p_Direccion);
                cmd.Parameters.Add(p_Telefono);
                cmd.Parameters.Add(p_Email);
                cmd.Parameters.Add(p_TipoDocumento);

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
        /// Metodo para actualizar una persona
        /// </summary>
        /// <param name="ID"></param>
        /// <param name="NitCedula">identificación parametro</param>
        /// <param name="NombreRazonSocial">Nombre o razon social parametro</param>
        /// <param name="Apellido">Apellido parametro</param>
        /// <param name="Direccion">Dirección parametro</param>
        /// <param name="Telefono">Telefono parametro</param>
        /// <param name="Email">Correo electronico parametro</param>
        /// <param name="TipoDocumento">Tipo de documento: C.C ó C.E ó T.I </param>
        /// <returns></returns>
        public DataTable ActualizarPersona(int ID, int NitCedula, string NombreRazonSocial, string Apellido, string Direccion, string Telefono, string Email, string TipoDocumento)
        {
            try
            {
                DataTable ds = new DataTable();
                db.AbrirConexion();

                OracleCommand cmd = new OracleCommand("PQ_PERSONA_PACKAGE.SP_UPDATE_PERSONA", db.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                OracleParameter p_Cursor = new OracleParameter("p_Cursor", OracleDbType.RefCursor);
                p_Cursor.Direction = ParameterDirection.Output;

                OracleParameter p_ID = new OracleParameter("p_ID", OracleDbType.Int32);
                p_ID.Direction = ParameterDirection.Input;
                p_ID.Value = ID;

                OracleParameter p_NitCedula = new OracleParameter("p_NitCedula", OracleDbType.Int32);
                p_NitCedula.Direction = ParameterDirection.Input;
                p_NitCedula.Value = NitCedula;

                OracleParameter p_NombreRazonSocial = new OracleParameter("p_NombreRazonSocial", OracleDbType.Varchar2);
                p_NombreRazonSocial.Direction = ParameterDirection.Input;
                p_NombreRazonSocial.Value = NombreRazonSocial;

                OracleParameter p_Apellido = new OracleParameter("p_Apellido", OracleDbType.Varchar2);
                p_Apellido.Direction = ParameterDirection.Input;
                p_Apellido.Value = Apellido;

                OracleParameter p_Direccion = new OracleParameter("p_Direccion", OracleDbType.Varchar2);
                p_Direccion.Direction = ParameterDirection.Input;
                p_Direccion.Value = Direccion;

                OracleParameter p_Telefono = new OracleParameter("p_Telefono", OracleDbType.Varchar2);
                p_Telefono.Direction = ParameterDirection.Input;
                p_Telefono.Value = Telefono;

                OracleParameter p_Email = new OracleParameter("p_Email", OracleDbType.Varchar2);
                p_Email.Direction = ParameterDirection.Input;
                p_Email.Value = Email;

                OracleParameter p_TipoDocumento = new OracleParameter("p_TipoDocumento", OracleDbType.Varchar2);
                p_TipoDocumento.Direction = ParameterDirection.Input;
                p_TipoDocumento.Value = TipoDocumento;

                cmd.Parameters.Add(p_Cursor);
                cmd.Parameters.Add(p_ID);
                cmd.Parameters.Add(p_NitCedula);
                cmd.Parameters.Add(p_NombreRazonSocial);
                cmd.Parameters.Add(p_Apellido);
                cmd.Parameters.Add(p_Direccion);
                cmd.Parameters.Add(p_Telefono);
                cmd.Parameters.Add(p_Email);
                cmd.Parameters.Add(p_TipoDocumento);

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

        public DataTable EliminarPersona(int ID)
        {
            try
            {
                DataTable ds = new DataTable();
                db.AbrirConexion();

                OracleCommand cmd = new OracleCommand("PQ_PERSONA_PACKAGE.SP_DELETE_PERSONA", db.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                OracleParameter p_Cursor = new OracleParameter("p_Cursor", OracleDbType.RefCursor);
                p_Cursor.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(p_Cursor);

                cmd.Parameters.Add("p_ID", OracleDbType.Int32).Value=ID;

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