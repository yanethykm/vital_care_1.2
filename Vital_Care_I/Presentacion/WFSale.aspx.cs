using Logic;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentacion
{
    public partial class WFSale : System.Web.UI.Page
    {
        SaleLog businessLogic = new SaleLog();
        private int _ID;
        private int idCliente;
        private int idVendedor;
        private int idProducto;
        private int cantidadvendida;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                list();
            }
        }

        private void limpiar()
        {
            LBID.Text="";
            TBCliente.Text="";
            TBVendedor.Text="";
            TBProducto.Text="";
            TBCantidad.Text="";
        }
        private void list()
        {

            DataTable resultado = businessLogic.ObtenerDatosDesdeProcedimiento();

            // Asigna los datos al control GridView
            GVSale.DataSource = resultado;
            GVSale.DataBind();
        }

        protected void GVSale_SelectedIndexChanged(object sender, EventArgs e)
        {
            LBID.Text = GVSale.SelectedRow.Cells[2].Text;
            TBCliente.Text = GVSale.SelectedRow.Cells[8].Text;
            TBVendedor.Text = GVSale.SelectedRow.Cells[13].Text;
            TBProducto.Text = GVSale.SelectedRow.Cells[6].Text;
            TBCantidad.Text = GVSale.SelectedRow.Cells[5].Text;
        }

        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                idCliente = Convert.ToInt32(TBCliente.Text);
                idVendedor = Convert.ToInt32(TBVendedor.Text);
                idProducto = Convert.ToInt32(TBProducto.Text);
                cantidadvendida = Convert.ToInt32(TBCantidad.Text);


                DataTable executed = businessLogic.Insertar(idCliente, idVendedor, idProducto, cantidadvendida);

                if (executed != null)
                {
                    LblMensaje.Text = "Registro exitoso";
                    limpiar();
                    list();
                }
                else
                {
                    LblMensaje.Text = "Error de registro";
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                LblMensaje.Text = "Error durante la operación de guardar. Consulta los registros para más detalles.";
            }
        }

        protected void BtnEliminar_Click(object sender, EventArgs e)
        {

        }

        protected void BtnLimpiar_Click(object sender, EventArgs e)
        {
            limpiar();
        }

        protected void GVSale_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                // Obtener el ID de la venta a eliminar
                int idVenta = Convert.ToInt32(GVSale.DataKeys[e.RowIndex].Value);

                // Llamar al método Eliminar en la capa de lógica
                DataTable resultado = businessLogic.Eliminar(idVenta);

                if (resultado != null)
                {
                    // Actualizar la GridView
                    list();
                    LblMensaje.Text = "Venta eliminada correctamente.";
                }
                else
                {
                    LblMensaje.Text = "Error al eliminar la venta.";
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                LblMensaje.Text = "Error durante la eliminación de la venta. No pueden haber campos vacios..";
            }

        }
    }
}