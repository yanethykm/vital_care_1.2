using Logic;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentacion
{
    public partial class WFUser : System.Web.UI.Page
    {
        UserLog businessLogic = new UserLog();
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
            TBPersona.Text="";
        }

        protected void GVUser_SelectedIndexChanged(object sender, EventArgs e)
        {
            LBID.Text = GVUser.SelectedRow.Cells[2].Text;
            TBUsuario.Text = GVUser.SelectedRow.Cells[8].Text;
            TBClave.Text = GVUser.SelectedRow.Cells[9].Text;
            TBEstado.Text = GVUser.SelectedRow.Cells[10].Text;
            TBPersona.Text = GVUser.SelectedRow.Cells[4].Text;
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
                IdPersona = Convert.ToInt32(TBPersona.Text);

                DataTable executed = businessLogic.Insertar(Usuario, Clave, Estado,IdPersona);

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
                IdPersona = Convert.ToInt32(TBPersona.Text);

                DataTable executed = businessLogic.Actualizar(_ID, Usuario, Clave, Estado, IdPersona);

                if (executed != null)
                {
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
    }
}