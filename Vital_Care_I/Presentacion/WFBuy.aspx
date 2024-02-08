<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WFBuy.aspx.cs" Inherits="Presentacion.WFBuy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/WFSale.aspx">Venta </asp:HyperLink>
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/WFProvider.aspx">Proveedor </asp:HyperLink>
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/WFProduct.aspx">Producto </asp:HyperLink>
            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/WFPerson.aspx">Persona </asp:HyperLink>
            <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/WFDevolution.aspx">Devolucion </asp:HyperLink>
            <h1>Compras </h1>
            <hr />
            <asp:Label ID="LBID" runat="server" Text="Label" Visible="false"></asp:Label><br />
            <asp:Label ID="Label1" runat="server" Text="Label">Numero Factura </asp:Label><br />
            <asp:TextBox ID="TBNFactura" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label2" runat="server" Text="Label">Facha de Compra (AAAA-MM-DD) </asp:Label><br />
            <asp:TextBox ID="TBFecha" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label3" runat="server" Text="Label">Cantidad Comprada </asp:Label><br />
            <asp:TextBox ID="TBCantidad" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label4" runat="server" Text="Label">Precio Unitario </asp:Label><br />
            <asp:TextBox ID="TBPrecioU" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label5" runat="server" Text="Label">Producto ID</asp:Label><br />
            <asp:TextBox ID="TBProducto" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label6" runat="server" Text="Label">Proveedor ID</asp:Label><br />
            <asp:TextBox ID="TBProveedor" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="LblMensaje" runat="server" Text=""></asp:Label>
            <br />
            <asp:Button ID="BtnGuardar" runat="server" Text="Guardar" OnClick="BtnGuardar_Click"/>
            <asp:Button ID="BtnEliminar" runat="server" Text="Eliminar" OnClick="BtnEliminar_Click"/>
            <asp:Button ID="BtnLimpiar" runat="server" Text="Limpiar" OnClick="BtnLimpiar_Click"/>
            <br />
            <br />
            <asp:GridView ID="GVBuy" runat="server" AutoGenerateColumns="true" OnSelectedIndexChanged="GVBuy_SelectedIndexChanged" OnRowDeleting="GVBuy_RowDeleting">
                <Columns>
                    <asp:CommandField ShowSelectButton="true" />
                    <asp:CommandField ShowDeleteButton="true" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
