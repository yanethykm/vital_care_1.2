using Data;
using Microsoft.SqlServer.Server;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Logic
{
    public class PersonLog
    {
        private showPerson objperson = new showPerson();

        public DataTable ObtenerDatosDesdeProcedimiento()
        {
            return objperson.ListarPersona();
        }
        /// <summary>
        /// Metodo para insertar personas Logic
        /// </summary>
        /// <param name="NitCedula">identificación parametro</param>
        /// <param name="NombreRazonSocial">Nombre o razon social parametro</param>
        /// <param name="Apellido">Apellido parametro</param>
        /// <param name="Direccion">Dirección parametro</param>
        /// <param name="Telefono">Telefono parametro</param>
        /// <param name="Email">Correo electronico parametro</param>
        /// <param name="TipoDocumento">Tipo de documento: C.C ó C.E ó T.I </param>
        /// <returns></returns>
        public DataTable Insertar(int _NitCedula, string _NombreRazonSocial, string _Apellido, string _Direccion, string _Telefono, string _Email, string _TipoDocumento)
        {
            return objperson.InsertarPersona(_NitCedula, _NombreRazonSocial, _Apellido, _Direccion, _Telefono, _Email, _TipoDocumento);
        }

        public DataTable Actualizar(int _ID, int _NitCedula, string _NombreRazonSocial, string _Apellido, string _Direccion, string _Telefono, string _Email, string _TipoDocumento)
        {
            return objperson.ActualizarPersona(_ID, _NitCedula, _NombreRazonSocial, _Apellido, _Direccion, _Telefono, _Email, _TipoDocumento);
        }

        public DataTable Eliminar(int _ID)
        {
            return objperson.EliminarPersona(_ID);
        }
    }
}