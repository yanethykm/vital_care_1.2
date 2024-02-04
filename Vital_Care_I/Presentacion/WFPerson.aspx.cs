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
    public partial class WFPerson : System.Web.UI.Page
    {
        PersonLog businessLogic = new PersonLog();
        private int _ID;
        private int nitcedula;
        private string nombrerazonsocial;
        private string apellido;
        private string direccion;
        private string telefono;
        private string email;
        private string tipodocumento;
        private bool executed = false;
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
            TBIdent.Text="";
            TBNombre.Text="";
            TBApellido.Text="";
            TBDireccion.Text="";
            TBTelefono.Text="";
            TBEmail.Text="";
            TBTipoDoc.Text="";
        }
        private void list()
        {
            
            DataTable resultado = businessLogic.ObtenerDatosDesdeProcedimiento();

            // Asigna los datos al control GridView
            GridView1.DataSource = resultado;
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            LBID.Text = GridView1.SelectedRow.Cells[2].Text;
            TBIdent.Text = GridView1.SelectedRow.Cells[3].Text;
            TBNombre.Text = GridView1.SelectedRow.Cells[4].Text;
            TBApellido.Text = GridView1.SelectedRow.Cells[5].Text;
            TBDireccion.Text = GridView1.SelectedRow.Cells[6].Text;
            TBTelefono.Text = GridView1.SelectedRow.Cells[7].Text;
            TBEmail.Text = GridView1.SelectedRow.Cells[8].Text;
            TBTipoDoc.Text = GridView1.SelectedRow.Cells[9].Text;
        }

        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            //nitcedula = Convert.ToInt32(TBIdent.Text);
            //nombrerazonsocial = TBNombre.Text;
            //apellido = TBApellido.Text;
            //direccion = TBDireccion.Text;
            //telefono = TBTelefono.Text;
            //email = TBEmail.Text;
            //tipodocumento = TBTipoDoc.Text;

            //DataTable executed = businessLogic.Insertar(nitcedula, nombrerazonsocial, apellido, direccion, telefono, email, tipodocumento);
            //if (executed != null)
            //{
            //    LblMensaje.Text="Registro exitoso";
            //    list();
            //}
            //else
            //{
            //    LblMensaje.Text="Error de registro";
            //}
            try
            {
                nitcedula = Convert.ToInt32(TBIdent.Text);
                nombrerazonsocial = TBNombre.Text;
                apellido = TBApellido.Text;
                direccion = TBDireccion.Text;
                telefono = TBTelefono.Text;
                email = TBEmail.Text;
                tipodocumento = TBTipoDoc.Text;

                DataTable executed = businessLogic.Insertar(nitcedula, nombrerazonsocial, apellido, direccion, telefono, email, tipodocumento);

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
                LblMensaje.Text = "Error durante la operación. Consulta los registros para más detalles.";
            }
        }

        protected void BtnActualizar_Click(object sender, EventArgs e)
        {
            try
            {
                _ID = Convert.ToInt32(LBID.Text);
                nitcedula = Convert.ToInt32(TBIdent.Text);
                nombrerazonsocial = TBNombre.Text;
                apellido = TBApellido.Text;
                direccion = TBDireccion.Text;
                telefono = TBTelefono.Text;
                email = TBEmail.Text;
                tipodocumento = TBTipoDoc.Text;

                DataTable executed = businessLogic.Actualizar(_ID, nitcedula, nombrerazonsocial, apellido, direccion, telefono, email, tipodocumento);

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
                LblMensaje.Text = "Error durante la operación. Consulta los registros para más detalles.";
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    e.Row.Cells[2].Visible = false;
            //}
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                _ID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                DataTable executed = businessLogic.Eliminar(_ID);

                if (executed != null && executed.Rows.Count > 0)
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
                LblMensaje.Text = "Error durante la operación. Consulta los registros para más detalles.";
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
                LblMensaje.Text = "Error durante la operación. Consulta los registros para más detalles.";
            }
        }
    }
}