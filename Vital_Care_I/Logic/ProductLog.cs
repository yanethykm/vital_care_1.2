using Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Logic
{
    public class ProductLog
    {
        private Product objproduct = new Product();

        public DataTable ObtenerDatosDesdeProcedimiento()
        {
            return objproduct.ListarProducto();
        }

        public DataTable Insertar(int _ID, string _Producto, string _Descripcion, int _PrecioVenta, int _CantidadMinima, int _Cantidad, int _IdCategoria, int _IdProveedor)
        {
            return objproduct.InsertarProducto(_ID, _Producto, _Descripcion, _PrecioVenta, _CantidadMinima, _Cantidad, _IdCategoria, _IdProveedor);
        }

        public DataTable Actualizar(int _IDOld, int _IDNew, string _Producto, string _Descripcion, int _PrecioVenta, int _CantidadMinima, int _Cantidad, int _IdCategoria, int _IdProveedor)
        {
            return objproduct.ActualizarProducto(_IDOld, _IDNew, _Producto, _Descripcion, _PrecioVenta, _CantidadMinima, _Cantidad, _IdCategoria, _IdProveedor);
        }
        
        public DataTable Eliminar(int _IDOld)
        {
            return objproduct.EliminarProducto(_IDOld);
        }
    }
}