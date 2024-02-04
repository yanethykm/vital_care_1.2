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
    public class Provider
    {
        #region variables
        private Persistence db;
        #endregion


        /// <summary>
        /// Es la instancia del objeto de la clase Persistence
        /// </summary>
        # region get-set
        public Provider()
        {
            db = new Persistence("Vital_Care_1");
        }
        #endregion
        public DataTable ListarProveedor()
        {
            try
            {
                DataTable ds = new DataTable();
                db.AbrirConexion();

                OracleCommand cmd = new OracleCommand("PQ_PROVEEDOR_PACKAGE.SP_LIST_PROVEEDOR_DDL", db.Conexion);
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

        public DataTable InsertarProveedor(int IDPersona)
        {
            try
            {
                DataTable ds = new DataTable();
                db.AbrirConexion();

                OracleCommand cmd = new OracleCommand("PQ_PROVEEDOR_PACKAGE.SP_INSERT_PROVEEDOR", db.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                OracleParameter p_Cursor = new OracleParameter("p_Cursor", OracleDbType.RefCursor);
                p_Cursor.Direction = ParameterDirection.Output;

                OracleParameter p_IDPersona = new OracleParameter("p_IDPersona", OracleDbType.Int32);
                p_IDPersona.Direction = ParameterDirection.Input;
                p_IDPersona.Value = IDPersona;

                

                cmd.Parameters.Add(p_Cursor);
                cmd.Parameters.Add(p_IDPersona);

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
        /// METODO PARA LISTAR PERSONAS PERO NOMBRE Y ID
        /// </summary>
        /// <returns></returns>
        public DataTable Listar_Persona_Proveedor()
        {
            try
            {
                DataTable ds = new DataTable();
                db.AbrirConexion();

                OracleCommand cmd = new OracleCommand("PQ_PROVEEDOR_PACKAGE.SP_LIST_PERSONA_PROVEEDOR", db.Conexion);
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
        /// METODO PARA OBTENER LOS DATOS DE UNA PERSONA TENIENDO EN CUENTA Y RECIBIENDO SU ID
        /// </summary>
        /// <param name="idPersona">RECIBE EL ID DE LA PERSONA PARA MOSTRARLO</param>
        /// <returns></returns>
        public DataTable ObtenerDatosPersona(int idPersona)
        {
            try
            {
                DataTable ds = new DataTable();
                db.AbrirConexion();

                OracleCommand cmd = new OracleCommand("PQ_PROVEEDOR_PACKAGE.SP_OBTENER_DATOS_PERSONA", db.Conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                OracleParameter p_Cursor = new OracleParameter("p_Cursor", OracleDbType.RefCursor);
                p_Cursor.Direction = ParameterDirection.Output;

                OracleParameter p_IDPersona = new OracleParameter("p_IDPersona", OracleDbType.Int32);
                p_IDPersona.Direction = ParameterDirection.Input;
                p_IDPersona.Value = idPersona;

                cmd.Parameters.Add(p_Cursor);
                cmd.Parameters.Add(p_IDPersona);

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