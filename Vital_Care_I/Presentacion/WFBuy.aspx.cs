using Logic;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentacion
{
    public partial class WFBuy : System.Web.UI.Page
    {
        BuyLog businessLogic = new BuyLog();
        private int _ID;
        private string numerofactura;
        private DateTime fechacompra;
        private int cantidadcomprada;
        private int preciounitario;
        private int IdProducto;
        private int IdProveedor;



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
            TBNFactura.Text="";
            TBFecha.Text="";
            TBCantidad.Text="";
            TBPrecioU.Text="";
            TBProducto.Text="";
            TBProveedor.Text="";
            
        }
        private void list()
        {

            DataTable resultado = businessLogic.ObtenerDatosDesdeProcedimiento();

            // Asigna los datos al control GridView
            GVBuy.DataSource = resultado;
            GVBuy.DataBind();
        }

        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                numerofactura = TBNFactura.Text;
                fechacompra = DateTime.ParseExact(TBFecha.Text, "yyyy-MM-dd", CultureInfo.InvariantCulture);
                cantidadcomprada = Convert.ToInt32(TBCantidad.Text);
                preciounitario = Convert.ToInt32(TBPrecioU.Text);
                IdProducto = Convert.ToInt32(TBProducto.Text);
                IdProveedor = Convert.ToInt32(TBProveedor.Text);



                DataTable executed = businessLogic.Insertar(numerofactura, fechacompra, cantidadcomprada, preciounitario, IdProducto, IdProveedor);

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

        protected void BtnLimpiar_Click(object sender, EventArgs e)
        {
            limpiar();
        }

        protected void GVBuy_SelectedIndexChanged(object sender, EventArgs e)
        {
            LBID.Text = GVBuy.SelectedRow.Cells[2].Text;
            TBNFactura.Text = GVBuy.SelectedRow.Cells[3].Text;
            TBFecha.Text = GVBuy.SelectedRow.Cells[4].Text;
            TBCantidad.Text = GVBuy.SelectedRow.Cells[6].Text;
            TBPrecioU.Text = GVBuy.SelectedRow.Cells[7].Text;
            TBProducto.Text = GVBuy.SelectedRow.Cells[8].Text;
            TBProveedor.Text = GVBuy.SelectedRow.Cells[10].Text;
        }

        protected void BtnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                _ID = Convert.ToInt32(LBID.Text);

                DataTable executed = businessLogic.Eliminar(_ID);

                if (executed != null)
                {
                    LblMensaje.Text = "Eliminacion exitosa";
                    limpiar();
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

        protected void GVBuy_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            LblMensaje.Text="¡Para eliminar oprima Seleccionar y luego el botón de Eliminar!";

        }
    }
}