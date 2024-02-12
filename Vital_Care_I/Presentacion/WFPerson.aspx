<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WFPerson.aspx.cs" Inherits="Presentacion.WFPerson" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Personas
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <br />
    <h1>Persona </h1>
    <form id="form1" class="row g-3" runat="server">
        <div>
            <hr />
            <asp:Label ID="LBID" runat="server" Text="" Visible="false"></asp:Label>
            <div class="col-md-6">
                <label for="inputState" class="form-label" runat="server">Identificación</label>
                <asp:TextBox ID="TBIdent" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <label for="inputState" class="form-label" runat="server">Nombre o Razón Social</label>
                <asp:TextBox ID="TBNombre" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <label for="inputState" class="form-label" runat="server">Apellido</label>
                <asp:TextBox ID="TBApellido" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <label for="inputState" class="form-label" runat="server">Dirección</label>
                <asp:TextBox ID="TBDireccion" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <label for="inputState" class="form-label" runat="server">Telefono</label>
                <asp:TextBox ID="TBTelefono" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <label for="inputEmail4" class="form-label" runat="server">Email</label>
                <asp:TextBox ID="TBEmail" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <label for="inputState" class="form-label">Tipo de documento</label>
                <asp:DropDownList ID="TBTipoD" runat="server" CssClass="form-select">
                    <asp:ListItem>C.C</asp:ListItem>
                    <asp:ListItem>C.E</asp:ListItem>
                </asp:DropDownList>
            </div>
            <br />
            <asp:Label ID="LblMensaje" runat="server" Text="" Visible="true"></asp:Label><br />
            <br />
            <div class="col-12">
                <asp:Button ID="BtnGuardar" runat="server" Text="Guardar" OnClick="BtnGuardar_Click" CssClass="btn btn-primary"/>
                <asp:Button ID="BtnActualizar" runat="server" Text="Actualizar" OnClick="BtnActualizar_Click" CssClass="btn btn-primary"/>
                <asp:Button ID="BtnEliminar" runat="server" Text="Eliminar" OnClick="BtnEliminar_Click" CssClass="btn btn-danger"/>
                <asp:Button ID="BtnLimpiar" runat="server" Text="Limpiar" OnClick="BtnLimpiar_Click" CssClass="btn btn-primary"/>
            </div>

            <hr />
            <br />
            <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateColumns="true" OnRowDataBound="GridView1_RowDataBound" OnRowDeleting="GridView1_RowDeleting" CssClass="p-3 border bg-light text-center">
                <Columns>
                    <asp:CommandField ShowSelectButton="true" />
                    <asp:CommandField ShowDeleteButton="true" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</asp:Content>
