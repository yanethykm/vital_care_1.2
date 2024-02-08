<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WFSale.aspx.cs" Inherits="Presentacion.WFSale" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/WFProvider.aspx">Proveedor </asp:HyperLink>
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/WFProduct.aspx">Producto </asp:HyperLink>
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/WFPerson.aspx">Persona </asp:HyperLink>
            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/WFDevolution.aspx">Devolucion </asp:HyperLink>
            <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/WFBuy.aspx">Compra </asp:HyperLink>

            <h1>Ventas</h1>
            <hr />
            <asp:Label ID="LBID" runat="server" Text="Label" Visible="false"></asp:Label><br />
            <asp:Label ID="Label1" runat="server" Text="Label">Cliente ID </asp:Label><br />
            <asp:TextBox ID="TBCliente" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label2" runat="server" Text="Label">Vendedor ID </asp:Label><br />
            <asp:TextBox ID="TBVendedor" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label3" runat="server" Text="Label">Producto ID </asp:Label><br />
            <asp:TextBox ID="TBProducto" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label4" runat="server" Text="Label">Cantidad </asp:Label><br />
            <asp:TextBox ID="TBCantidad" runat="server"></asp:TextBox><br />
            <hr />
            <asp:Label ID="LblMensaje" runat="server" Text=""></asp:Label>
            <br />
            <asp:Button ID="BtnGuardar" runat="server" Text="Facturar " OnClick="BtnGuardar_Click" />
            <asp:Button ID="BtnEliminar" runat="server" Text="Eliminar" OnClick="BtnEliminar_Click"/>
            <asp:Button ID="BtnLimpiar" runat="server" Text="Limpiar" OnClick="BtnLimpiar_Click"/>
            <br />
            <br />
            <asp:GridView ID="GVSale" runat="server" AutoGenerateColumns="true" OnSelectedIndexChanged="GVSale_SelectedIndexChanged" OnRowDeleting="GVSale_RowDeleting">
                <Columns>
                    <asp:CommandField ShowSelectButton="true" />
                    <asp:CommandField ShowDeleteButton="true" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
