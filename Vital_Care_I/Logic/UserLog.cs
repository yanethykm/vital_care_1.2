using Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Logic
{
    public class UserLog
    {

        private User objuser = new User();

        public DataTable ObtenerDatosDesdeProcedimiento()
        {
            return objuser.ListarUsuario();
        }

        public DataTable Insertar(string _Usuario, string _Clave, int _IdPersona)
        {
            return objuser.InsertarUsuario(_Usuario, _Clave, _IdPersona);
        }

        public DataTable Actualizar(int _IdUsuario, string _Usuario, string _Clave, int _IdPersona)
        {
            return objuser.ActualizarUsuario(_IdUsuario, _Usuario, _Clave, _IdPersona);
        }

        public DataTable Eliminar(int _IdUsuario)
        {
            return objuser.EliminarUsuario(_IdUsuario);
        }
    }
}