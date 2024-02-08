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
    public partial class WFDevolution : System.Web.UI.Page
    {
        DevolutionLog businessLogic = new DevolutionLog();
        private int _ID;
        private string FechaDevolucion;
        private int CantidadDevuelta;
        private string RazonDevolucion;
        private int IdVenta;

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
            TBFechaDev.Text="";
            TBCantidadDev.Text="";
            TBRazon.Text = "";
            TBVenta.Text="";
            
        }
        private void list()
        {

            DataTable resultado = businessLogic.ObtenerDatosDesdeProcedimiento();

            // Asigna los datos al control GridView
            GVDevolution.DataSource = resultado;
            GVDevolution.DataBind();
        }

        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                DateTime FechaDevolucion = DateTime.Parse(TBFechaDev.Text);
                CantidadDevuelta = Convert.ToInt32(TBCantidadDev.Text);
                RazonDevolucion = TBRazon.Text;
                IdVenta = Convert.ToInt32(TBVenta.Text);


                DataTable executed = businessLogic.Insertar(FechaDevolucion, CantidadDevuelta, RazonDevolucion, IdVenta);

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
    }
}