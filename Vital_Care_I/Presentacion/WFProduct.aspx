<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WFProduct.aspx.cs" Inherits="Presentacion.WFProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Usuarios
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <form id="form1" class="row g-3" runat="server">
        <div>
            <br />
            <h1>Producto</h1>
            <hr />

            <asp:Label ID="LBID" runat="server" Text="ID" Visible="false"></asp:Label><br />
            <div class="col-md-6">
                <label for="inputState" class="form-label" runat="server">Codigo</label>
                <asp:TextBox ID="TBCodigo" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="col-md-6">
                <label for="inputState" class="form-label" runat="server">Nombre Producto</label>
                <asp:TextBox ID="TBProducto" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="col-md-6">
                <label for="inputState" class="form-label" runat="server">Presentación/Descripcion</label>
                <asp:TextBox ID="TBDescripcion" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="col-md-6">
                <label for="inputState" class="form-label" runat="server">Precio de Venta</label>
                <asp:TextBox ID="TBPrecioventa" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="col-md-6">
                <label for="inputState" class="form-label" runat="server">Cantidad Minima en Stock</label>
                <asp:TextBox ID="TBCantidadminima" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="col-md-6">
                <label for="inputState" class="form-label" runat="server">Cantidad existencia</label>
                <asp:TextBox ID="TBCantidad" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="col-md-6">
                <label for="inputState" class="form-label" runat="server">Categoria ID</label>
                <asp:TextBox ID="TBCategoria" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="col-md-6">
                <label for="inputState" class="form-label" runat="server">Proveedor ID</label>
                <asp:TextBox ID="TBProveedor" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <hr />
            <asp:Label ID="LblMensaje" runat="server" Text=""></asp:Label><br />
            <br />
            <div class="col-12">
                <asp:Button ID="BtnGuardar" runat="server" Text="Guardar" OnClick="BtnGuardar_Click" CssClass="btn btn-primary"/>
                <asp:Button ID="BtnActualizar" runat="server" Text="Actualizar" OnClick="BtnActualizar_Click" CssClass="btn btn-primary"/>
                <asp:Button ID="BtnEliminar" runat="server" Text="Eliminar" OnClick="BtnEliminar_Click" CssClass="btn btn-primary"/>
                <asp:Button ID="BtnLimpiar" runat="server" Text="Limpiar" OnClick="BtnLimpiar_Click" CssClass="btn btn-primary"/>
            </div>
            <br />
            <hr />
            <asp:GridView ID="GVProduct" AutoGenerateColumns="true" OnSelectedIndexChanged="GVProduct_SelectedIndexChanged" OnRowDeleting="GVProduct_RowDeleting" runat="server" CssClass="p-3 border bg-light text-center">
                <Columns>
                    <asp:CommandField ShowSelectButton="true" />
                    <asp:CommandField ShowDeleteButton="true" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</asp:Content>
