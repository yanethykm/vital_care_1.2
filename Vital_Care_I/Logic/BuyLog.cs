using Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Logic
{
    public class BuyLog
    {
        private Buy objcompra = new Buy();

        public DataTable ObtenerDatosDesdeProcedimiento()
        {
            return objcompra.ListarCompra();
        }

        public DataTable Insertar(string _NumeroFactura, DateTime _FechaCompra, int _CantidadComprada, int _PrecioUnitario, int _IdProducto, int _IdProveedor)
        {
            return objcompra.InsertarCompra(_NumeroFactura, _FechaCompra, _CantidadComprada, _PrecioUnitario, _IdProducto, _IdProveedor);
        }

        public DataTable Eliminar(int _IdCompra)
        {
            return objcompra.EliminarCompra(_IdCompra);
        }
    }
}