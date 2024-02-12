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
    public partial class WFProvider : System.Web.UI.Page
    {
        ProviderLog businessLogic = new ProviderLog();
        PersonLog personLog = new PersonLog();
        private int _ID;
        private int IdPerson;
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
            GVProvider.DataSource = resultado;
            GVProvider.DataBind();
        }

        private void CargarDropDownList()
        {
            DataTable personas = businessLogic.ListarPersonaProveedor(); // Cambia esto por tu método para obtener personas

            if (personas != null && personas.Rows.Count > 0)
            {
                DropDownList1.DataSource = personas;
                DropDownList1.DataTextField = "Nombre_RazonSocial"; // Cambia "Nombre" por el nombre de la columna que contiene los nombres
                DropDownList1.DataValueField = "ID"; // Cambia "IDPersona" por el nombre de la columna que contiene los IDs
                DropDownList1.DataBind();
            }
            else
            {
                // Manejo cuando no hay datos
            }
        }

        protected void GVProvider_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void GVProvider_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (int.TryParse(DropDownList1.SelectedValue, out _ID))
            {
                DataTable resultado = businessLogic.ObtenerDatosPersona(_ID);

                if (resultado != null && resultado.Rows.Count > 0)
                {
                    // Mostrar la información en los TextBoxes
                    LBID.Text = resultado.Rows[0]["ID"].ToString();
                   
                    // Agrega más líneas para otros campos según sea necesario
                }

                // Actualizar el GridView si es necesario
                //DataTable proveedores = businessLogic.ObtenerProveedoresPorPersona(IdPerson);
                //GVProvider.DataSource = proveedores;
                //GVProvider.DataBind();
            }
        }

        protected void BtnGuardarP_Click(object sender, EventArgs e)
        {
            if (int.TryParse(DropDownList1.SelectedValue, out IdPerson))
            {
                // Llamar al método de la capa lógica para obtener los proveedores de la persona seleccionada
                DataTable resultado = businessLogic.InsertarProveedor(IdPerson);

                // Asignar los datos al control GridView
                GVProvider.DataSource = resultado;
                GVProvider.DataBind();

                list();
            }
        }
    }
}