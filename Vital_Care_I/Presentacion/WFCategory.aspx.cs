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
    public partial class WFCategory : System.Web.UI.Page
    {
        CategoryLog businessLogic = new CategoryLog();
        private int _ID;
        private string Categoria;
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
            TBCategoria.Text="";
        }
        private void list()
        {
            DataTable resultado = businessLogic.ObtenerDatosDesdeProcedimiento();

            // Asigna los datos al control GridView
            GVCategory.DataSource = resultado;
            GVCategory.DataBind();
        }

        protected void GVCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            LBID.Text = GVCategory.SelectedRow.Cells[2].Text;
            TBCategoria.Text = GVCategory.SelectedRow.Cells[3].Text;

        }

        protected void GVCategory_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            LblMensaje.Text="Selecciona primero para poder eliminar, luego oprima el BOTON ELIMINAR";
        }

        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                Categoria = TBCategoria.Text;

                DataTable executed = businessLogic.Insertar(Categoria);
                if (executed != null)
                {
                    LblMensaje.Text = "Registro exitoso";
                    limpiar();
                    list();
                }
                else
                {
                    LblMensaje.Text = "Error de registro, asegurece de poner el Nombre correctamente";
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                LblMensaje.Text = "Error durante la operación de guardar. No pueden haber campos vacios.";
            }
        }

        protected void BtnActualizar_Click(object sender, EventArgs e)
        {
            try
            {
                _ID = Convert.ToInt32(LBID.Text);
                Categoria = TBCategoria.Text;

                DataTable executed = businessLogic.Actualizar(_ID, Categoria);

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
                LblMensaje.Text = "Error durante la operación actualizando. No puedes tener campos vacios.";
            }
        }

        protected void Eliminar_Click(object sender, EventArgs e)
        {
            try
            {
                _ID = Convert.ToInt32(LBID.Text);

                DataTable executed = businessLogic.Eliminar(_ID);

                if (executed != null)
                {
                    LblMensaje.Text = "Eliminación exitosa";
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
                LblMensaje.Text = "Error durante la operación eliminando. No puedes tener campos vacios.";
            }
        }

        protected void BtnLimpiar_Click(object sender, EventArgs e)
        {
            limpiar();
        }
    }
}