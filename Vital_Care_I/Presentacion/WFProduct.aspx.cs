using Logic;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentacion
{
    public partial class WFProduct : System.Web.UI.Page
    {
        ProductLog businessLogic = new ProductLog();
        private int _IDOld;
        private int _IDNew;
        private string producto;
        private string descripcion;
        private int precioventa;
        private int cantidadminima;
        private int cantidad;
        private int IdCategoria;
        private int IdProveedor;
        protected List<int> ProductIds = new List<int>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                list();
                //// Obtener los IDs de los productos de la GridView
                //foreach (GridViewRow row in GVProduct.Rows)
                //{
                //    int id;
                //    // Accedemos al valor del campo asociado al ID del producto en lugar del texto de la celda
                //    TableCell cell = row.Cells.Cast<TableCell>().FirstOrDefault(c => c.Text == "Codigo Producto");
                //    if (cell != null)
                //    {
                //        int columnIndex = cell.TabIndex; // Obtener el índice de la columna
                //        if (int.TryParse(row.Cells[columnIndex].Text, out id))
                //        {
                //            ProductIds.Add(id);
                //        }
                //    }
                //}
            }
        }

        private void limpiar()
        {
            LBID.Text="";
            TBCodigo.Text="";
            TBProducto.Text="";
            TBDescripcion.Text="";
            TBPrecioventa.Text="";
            TBCantidadminima.Text="";
            TBCantidad.Text="";
            TBCategoria.Text="";
            TBProveedor.Text="";
        }
        private void list()
        {

            DataTable resultado = businessLogic.ObtenerDatosDesdeProcedimiento();

            // Asigna los datos al control GridView
            GVProduct.DataSource = resultado;
            GVProduct.DataBind();
        }
        protected void GVProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            LBID.Text = GVProduct.SelectedRow.Cells[2].Text;
            TBCodigo.Text = GVProduct.SelectedRow.Cells[2].Text;
            TBProducto.Text = GVProduct.SelectedRow.Cells[3].Text;
            TBDescripcion.Text = GVProduct.SelectedRow.Cells[4].Text;
            TBPrecioventa.Text = GVProduct.SelectedRow.Cells[5].Text;
            TBCantidadminima.Text = GVProduct.SelectedRow.Cells[6].Text;
            TBCantidad.Text = GVProduct.SelectedRow.Cells[7].Text;
            TBCategoria.Text = GVProduct.SelectedRow.Cells[8].Text;
            TBProveedor.Text = GVProduct.SelectedRow.Cells[9].Text;
        }

        protected void GVProduct_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                _IDOld = Convert.ToInt32(GVProduct.DataKeys[e.RowIndex].Values[0]);
                DataTable executed = businessLogic.Eliminar(_IDOld);

                if (executed != null)
                {
                    LblMensaje.Text = "Eliminación exitosa";
                    
                    list();
                }
                else
                {
                    LblMensaje.Text = "Error al eliminar";
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                LblMensaje.Text = "Error durante la operación de eliminar. No pueden haber campos vacios.";
            }
        }

        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                _IDNew = Convert.ToInt32(TBCodigo.Text);
                producto = TBProducto.Text;
                descripcion = TBDescripcion.Text;
                precioventa = Convert.ToInt32(TBPrecioventa.Text);
                cantidadminima = Convert.ToInt32(TBCantidadminima.Text);
                cantidad = Convert.ToInt32(TBCantidad.Text);
                IdCategoria = Convert.ToInt32(TBCategoria.Text);
                IdProveedor = Convert.ToInt32(TBProveedor.Text);

                DataTable executed = businessLogic.Insertar(_IDNew, producto, descripcion, precioventa, cantidadminima, cantidad, IdCategoria, IdProveedor);

                 if (executed != null)
                 {
                    LblMensaje.Text = "Registro exitoso";
                    limpiar();
                    list();
                 }
                 else
                 {
                    LblMensaje.Text = "Error de registro, el codigo ya existe";
                 }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                LblMensaje.Text = "Error al registrar, verifique no hayan campos vacios.";
            }
            
        }

        protected void BtnActualizar_Click(object sender, EventArgs e)
        {
            try
            {
                _IDOld = Convert.ToInt32(LBID.Text);
                _IDNew = Convert.ToInt32(TBCodigo.Text);
                producto = TBProducto.Text;
                descripcion = TBDescripcion.Text;
                precioventa = Convert.ToInt32(TBPrecioventa.Text);
                cantidadminima = Convert.ToInt32(TBCantidadminima.Text);
                cantidad = Convert.ToInt32(TBCantidad.Text);
                IdCategoria = Convert.ToInt32(TBCategoria.Text);
                IdProveedor = Convert.ToInt32(TBProveedor.Text);

                DataTable executed = businessLogic.Actualizar(_IDOld, _IDNew, producto, descripcion, precioventa, cantidadminima, cantidad, IdCategoria, IdProveedor);

                if (executed != null)
                {
                    LblMensaje.Text = "Actualización exitosa";
                    limpiar();
                    list();
                }
                else
                {
                    LblMensaje.Text = "Error al actualizar";
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                LblMensaje.Text = "Error durante la operación actualizando. Consulta los registros para más detalles.";
            }
        }

        protected void BtnLimpiar_Click(object sender, EventArgs e)
        {
            limpiar();
        }

        protected void BtnEliminar_Click(object sender, EventArgs e)
        {
            try
            {

                _IDOld = Convert.ToInt32(LBID.Text);

                DataTable executed = businessLogic.Eliminar(_IDOld);

                if (executed != null)
                {
                    LblMensaje.Text = "Eliminación exitosa";

                    list();
                }
                else
                {
                    LblMensaje.Text = "Error al eliminar";
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                LblMensaje.Text = "Error durante la operación de eliminar. Consulta los registros para más detalles.";
            }
        }
    }
}