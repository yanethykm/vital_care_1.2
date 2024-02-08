using Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Logic
{
    public class DevolutionLog
    {
        private Devolution objdev = new Devolution();

        public DataTable ObtenerDatosDesdeProcedimiento()
        {
            return objdev.ListarDevolucion();
        }

        public DataTable Insertar(DateTime _FechaDevolucion, int _CantidadDevuelta, string _RazonDevolucion, int _IdVenta)
        {
            return objdev.InsertarDevolucion(_FechaDevolucion, _CantidadDevuelta, _RazonDevolucion, _IdVenta);
        }
    }
}