<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WFBuy.aspx.cs" Inherits="Presentacion.WFBuy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Compras
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <form id="form1" class="row g-3" runat="server">
        <div>
            <h1>Compras </h1>
            <hr />
            <asp:Label ID="LBID" runat="server" Text="Label" Visible="false"></asp:Label><br />
            <div class="col-md-6">
                <label for="inputState" class="form-label" runat="server">Numero de Factura</label>
                <asp:TextBox ID="TBNFactura" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <label for="inputState" class="form-label" runat="server">Facha de Compra (AAAA-MM-DD)</label>
                <asp:TextBox ID="TBFecha" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <label for="inputState" class="form-label" runat="server">Cantidad Comprada</label>
                <asp:TextBox ID="TBCantidad" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <label for="inputState" class="form-label" runat="server">Precio Unitario</label>
                <asp:TextBox ID="TBPrecioU" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <label for="inputState" class="form-label" runat="server">Producto ID</label>
                <asp:TextBox ID="TBProducto" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <label for="inputState" class="form-label" runat="server">Proveedor ID</label>
                <asp:TextBox ID="TBProveedor" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <br />
            <asp:Label ID="LblMensaje" runat="server" Text=""></asp:Label>
            <br />
            <div class="col-12">
                <asp:Button ID="BtnGuardar" runat="server" Text="Guardar" OnClick="BtnGuardar_Click" CssClass="btn btn-primary" />
                <asp:Button ID="BtnEliminar" runat="server" Text="Eliminar" OnClick="BtnEliminar_Click" CssClass="btn btn-danger"/>
                <asp:Button ID="BtnLimpiar" runat="server" Text="Limpiar" OnClick="BtnLimpiar_Click" CssClass="btn btn-primary"/>
            </div>
            <br />
            <asp:GridView ID="GVBuy" runat="server" AutoGenerateColumns="true" OnSelectedIndexChanged="GVBuy_SelectedIndexChanged" OnRowDeleting="GVBuy_RowDeleting" CssClass="p-3 border bg-light text-center">
                <Columns>
                    <asp:CommandField ShowSelectButton="true" />
                    <asp:CommandField ShowDeleteButton="true" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</asp:Content>
