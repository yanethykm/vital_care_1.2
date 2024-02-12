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
    public partial class WFUsers : System.Web.UI.Page
    {
        UserLog businessLogic = new UserLog();
        ProviderLog businessLogic1 = new ProviderLog();
        private int _ID;
        private string Usuario;
        private string Clave;
        private string Estado;
        private int IdPersona;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                list();
                CargarDropDownList();
            }
        }

        private void list()
        {
            DataTable resultado = businessLogic.ObtenerDatosDesdeProcedimiento();

            // Asigna los datos al control GridView
            GVUser.DataSource = resultado;
            GVUser.DataBind();
        }

        private void limpiar()
        {
            LBID.Text="";
            TBUsuario.Text="";
            TBClave.Text="";
            DropDownList1.Text="";
            
        }

        private void CargarDropDownList()
        {
            DataTable personas = businessLogic.ListarPersona(); // Cambia esto por tu método para obtener personas

            if (personas != null && personas.Rows.Count > 0)
            {
                DropDownList1.DataSource = personas;
                DropDownList1.DataTextField = "Nombre_RazonSocial"; // nombre de la columna que contiene los nombres
                DropDownList1.DataValueField = "ID"; // Cambia "IDPersona" por el nombre de la columna que contiene los IDs
                DropDownList1.DataBind();
            }
            else
            {
                // Manejo cuando no hay datos
            }
        }

        protected void GVUser_SelectedIndexChanged(object sender, EventArgs e)
        {
            LBID.Text = GVUser.SelectedRow.Cells[2].Text;
            TBUsuario.Text = GVUser.SelectedRow.Cells[8].Text;
            TBClave.Text = GVUser.SelectedRow.Cells[9].Text;
            TBEstado.Text = GVUser.SelectedRow.Cells[10].Text;
            

        }

        protected void GVUser_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            LblMensaje.Text="Selecciona primero para poder eliminar, luego oprima el BOTON ELIMINAR";
        }

        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario = TBUsuario.Text;
                Clave = TBClave.Text;
                Estado = TBEstado.Text;
                int.TryParse(DropDownList1.SelectedValue, out IdPersona);
                
                    // Llamar al método de la capa lógica para obtener los proveedores de la persona seleccionada
                DataTable executed = businessLogic.Insertar(Usuario, Clave, Estado, IdPersona); ;
                if (executed != null)
                {
                    LblMensaje.Text = "Registro exitoso";
                    limpiar();
                    list();
                }
                else
                {
                    LblMensaje.Text = "Error de registro, asegurece de poner los datos correctos.";
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                LblMensaje.Text = "Error durante la operación. No pueden haber campos vacios..";
            }
        }

        protected void BtnActualizar_Click(object sender, EventArgs e)
        {
            try
            {
                _ID = Convert.ToInt32(LBID.Text);
                Usuario = TBUsuario.Text;
                Clave = TBClave.Text;
                Estado = TBEstado.Text;
                if (int.TryParse(DropDownList1.SelectedValue, out IdPersona))
                {

                    DataTable executed = businessLogic.Actualizar(_ID, Usuario, Clave, Estado, IdPersona);
                    GVUser.DataSource = executed;
                    GVUser.DataBind();
                    LblMensaje.Text = "Actualización exitosa";
                    limpiar();
                    list();
                }
                else
                {
                    LblMensaje.Text = "Error al actualizar, revise los campos y rectifique el ID de Persona, recuerde que es un ID";
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                LblMensaje.Text = "Error durante la operación. No pueden haber campos vacios.";
            }
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
                    LblMensaje.Text = "Error al Eliminar";
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                LblMensaje.Text = "Error durante la operación. No pueden haber campos vacios.";
            }
        }

        protected void BtnLimpiar_Click(object sender, EventArgs e)
        {
            limpiar();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (int.TryParse(DropDownList1.SelectedValue, out _ID))
            {
                DataTable resultado = businessLogic1.ObtenerDatosPersona(_ID);

                if (resultado != null && resultado.Rows.Count > 0)
                {
                    // Mostrar la información en los TextBoxes
                    LBID.Text = resultado.Rows[0]["ID"].ToString();

                }
            }
        }
    }
}