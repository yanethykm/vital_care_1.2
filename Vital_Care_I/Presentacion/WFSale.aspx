<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WFSale.aspx.cs" Inherits="Presentacion.WFSale" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Ventas
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <form id="form1" class="row g-3" runat="server">
        <div>
            <br />
            <h1>Ventas</h1>
            <hr />
            <asp:Label ID="LBID" runat="server" Text="Label" Visible="false"></asp:Label><br />
            <div class="col-md-6">
                <label for="inputState" class="form-label" runat="server">Cliente ID</label>
                <asp:TextBox ID="TBCliente" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <label for="inputState" class="form-label" runat="server">Vendedor ID</label>
                <asp:TextBox ID="TBVendedor" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <label for="inputState" class="form-label" runat="server">Producto ID</label>
                <asp:TextBox ID="TBProducto" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <label for="inputState" class="form-label" runat="server">Cantidad</label>
                <asp:TextBox ID="TBCantidad" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <hr />
            <asp:Label ID="LblMensaje" runat="server" Text=""></asp:Label>
            <br />
            <div class="col-12">
                <asp:Button ID="BtnGuardar" runat="server" Text="Guardar" OnClick="BtnGuardar_Click" CssClass="btn btn-primary" />
                <asp:Button ID="BtnEliminar" runat="server" Text="Eliminar" OnClick="BtnEliminar_Click" CssClass="btn btn-primary"/>
                <asp:Button ID="BtnLimpiar" runat="server" Text="Limpiar" OnClick="BtnLimpiar_Click" CssClass="btn btn-primary"/>
            </div>
            <br />
            <asp:GridView ID="GVSale" runat="server" AutoGenerateColumns="true" OnSelectedIndexChanged="GVSale_SelectedIndexChanged" OnRowDeleting="GVSale_RowDeleting" CssClass="p-3 border bg-light text-center">
                <Columns>
                    <asp:CommandField ShowSelectButton="true" />
                    <asp:CommandField ShowDeleteButton="true" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</asp:Content>
