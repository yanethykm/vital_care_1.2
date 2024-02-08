using Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Logic
{
    public class CategoryLog
    {
        private Category objcategoria = new Category();

        public DataTable ObtenerDatosDesdeProcedimiento()
        {
            return objcategoria.ListarCategoria();
        }

        public DataTable Insertar(string _Categoria)
        {
            return objcategoria.InsertarCategoria(_Categoria);
        }

        public DataTable Actualizar(int _IdCategoria, string _Categoria)
        {
            return objcategoria.ActualizarCategoria(_IdCategoria, _Categoria);
        }

        public DataTable Eliminar(int _IdCategoria)
        {
            return objcategoria.EliminarCategoria(_IdCategoria);
        }
    }
}