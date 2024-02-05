<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WFProduct.aspx.cs" Inherits="Presentacion.WFProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Producto</h1>
            <hr /><br />
            <asp:Label ID="LBID" runat="server" Text="ID" Visible="false"></asp:Label><br />
            <asp:Label ID="Label8" runat="server" Text="Label">Codigo </asp:Label>
            <asp:TextBox ID="TBCodigo" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label1" runat="server" Text="Label">Producto </asp:Label>
            <asp:TextBox ID="TBProducto" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label2" runat="server" Text="Label">Descripcion </asp:Label>
            <asp:TextBox ID="TBDescripcion" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label3" runat="server" Text="Label">Precio de venta </asp:Label>
            <asp:TextBox ID="TBPrecioventa" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label4" runat="server" Text="Label">Cantidad mínima en stock </asp:Label>
            <asp:TextBox ID="TBCantidadminima" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label5" runat="server" Text="Label">Cantidad existencia </asp:Label>
            <asp:TextBox ID="TBCantidad" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label6" runat="server" Text="Label">Categoria ID</asp:Label>
            <asp:TextBox ID="TBCategoria" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label7" runat="server" Text="Label">Proveedor ID</asp:Label>
            <asp:TextBox ID="TBProveedor" runat="server"></asp:TextBox><br /><br /><br />
            <hr />
            <asp:Label ID="LblMensaje" runat="server" Text=""></asp:Label><br />
            <asp:Button ID="BtnGuardar" runat="server" Text="Guardar" OnClick="BtnGuardar_Click"/>
            <asp:Button ID="BtnActualizar" runat="server" Text="Actualizar" OnClick="BtnActualizar_Click" />
            <asp:Button ID="BtnEliminar" runat="server" Text="Eliminar" OnClick="BtnEliminar_Click" />
            <asp:Button ID="BtnLimpiar" runat="server" Text="Limpiar" OnClick="BtnLimpiar_Click" />
            <br />
            <hr />
            <asp:GridView ID="GVProduct" AutoGenerateColumns="true" OnSelectedIndexChanged="GVProduct_SelectedIndexChanged" OnRowDeleting="GVProduct_RowDeleting" runat="server">
                <Columns>
                    <asp:CommandField ShowSelectButton="true" />
                    <asp:CommandField ShowDeleteButton="true" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
