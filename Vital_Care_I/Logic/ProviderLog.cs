using Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Logic
{
    public class ProviderLog
    {
        private Provider objprovider = new Provider();

        public DataTable ObtenerDatosDesdeProcedimiento()
        {
            return objprovider.ListarProveedor();
        }

        public DataTable InsertarProveedor(int _IDPersona)
        {
            return objprovider.InsertarProveedor(_IDPersona);
        }

        public DataTable ListarPersonaProveedor()
        {
            return objprovider.Listar_Persona_Proveedor();
        }

        public DataTable ObtenerDatosPersona(int _IDPersona)
        {
            return objprovider.ObtenerDatosPersona(_IDPersona);
        }

    }
}