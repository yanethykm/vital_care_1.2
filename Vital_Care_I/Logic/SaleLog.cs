using Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Logic
{
    public class SaleLog
    {

        private Sale objsale = new Sale();

        public DataTable ObtenerDatosDesdeProcedimiento()
        {
            return objsale.ListarVenta();
        }

        public DataTable Insertar(int _IdCliente, int _IdVendedor, int _IdProducto, int _CantidadVendida)
        {
            return objsale.InsertarVenta(_IdCliente, _IdVendedor, _IdProducto, _CantidadVendida);
        }

        public DataTable Eliminar(int _IdVenta)
        {
            return objsale.EliminarVenta(_IdVenta);
        }
    }
}