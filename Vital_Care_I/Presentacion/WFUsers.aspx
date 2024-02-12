<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WFUsers.aspx.cs" Inherits="Presentacion.WFUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Usuarios
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <form class="row g-3" runat="server">
        <div>
            <br />
            <h1>Usuarios</h1>
            <hr />

            <asp:Label ID="LBID" runat="server" Text="Label" Visible="false"></asp:Label>
            <div class="col-md-6">
                <label for="inputState" class="form-label" runat="server">Usuario</label>
                <asp:TextBox ID="TBUsuario" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <label for="inputState" class="form-label">Password</label>
                <asp:TextBox ID="TBClave" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <label for="inputState" class="form-label">Estado</label>
                <asp:DropDownList ID="TBEstado" runat="server" CssClass="form-select">

                    <asp:ListItem>Activo</asp:ListItem>
                    <asp:ListItem>Inactivo</asp:ListItem>

                </asp:DropDownList>
            </div>
            <br />
            <div class="col-md-6">
                <asp:Label ID="Label1" runat="server" Text="Label">Seleccione una Persona  </asp:Label>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="form-select">
                    <asp:ListItem Text="--Seleccione una Persona--" Value=""></asp:ListItem>
                </asp:DropDownList>
            </div>
            <br />
            <br />
            <asp:Label ID="LblMensaje" runat="server" Text=""></asp:Label>


            <div class="col-12">
                <asp:Button ID="BtnGuardar" runat="server" Text="Guardar" OnClick="BtnGuardar_Click" CssClass="btn btn-primary" />
                <asp:Button ID="BtnActualizar" runat="server" Text="Actualizar" OnClick="BtnActualizar_Click" CssClass="btn btn-primary" />
                <asp:Button ID="BtnEliminar" runat="server" Text="Eliminar" OnClick="BtnEliminar_Click" CssClass="btn btn-danger" />
                <asp:Button ID="BtnLimpiar" runat="server" Text="Limpiar" OnClick="BtnLimpiar_Click" CssClass="btn btn-primary" />

            </div>
            <br />
            <br />

            <asp:GridView ID="GVUser" runat="server" AutoGenerateColumns="true" OnSelectedIndexChanged="GVUser_SelectedIndexChanged" OnRowDeleting="GVUser_RowDeleting" CssClass="p-3 border bg-light text-center">
                <Columns>
                    <asp:CommandField ShowSelectButton="true" />
                    <asp:CommandField ShowDeleteButton="true" />
                </Columns>
            </asp:GridView>
        </div>

    </form>

</asp:Content>
