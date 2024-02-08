<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WFDevolution.aspx.cs" Inherits="Presentacion.WFDevolution" %>

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
            <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/WFBuy.aspx">Compra </asp:HyperLink>
            <h1>Devoluciones </h1>
            <hr />
            <asp:Label ID="LBID" runat="server" Text="Label" Visible="false"></asp:Label><br />
            <asp:Label ID="Label2" runat="server" Text="Label">Fecha de devolucion (AAAA - MM - DD) </asp:Label><br />
            <asp:TextBox ID="TBFechaDev" runat="server" Text="AAAA - MM - DD"></asp:TextBox><br />
            <asp:Label ID="Label3" runat="server" Text="Label">Cantidad devuelta </asp:Label><br />
            <asp:TextBox ID="TBCantidadDev" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label1" runat="server" Text="Label">Razon devolucion </asp:Label><br />
            <asp:TextBox ID="TBRazon" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label4" runat="server" Text="Label">Venta ID</asp:Label><br />
            <asp:TextBox ID="TBVenta" runat="server"></asp:TextBox>
            <hr />
            <asp:Label ID="LblMensaje" runat="server" Text="Label" Visible="false"></asp:Label><br />
            <asp:Button ID="BtnGuardar" runat="server" Text="Guardar" OnClick="BtnGuardar_Click"/>
            <asp:Button ID="BtnLimpiar" runat="server" Text="Limpiar" OnClick="BtnLimpiar_Click"/><br />
            <asp:GridView ID="GVDevolution" runat="server" AutoGenerateColumns="true">
                <Columns>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
