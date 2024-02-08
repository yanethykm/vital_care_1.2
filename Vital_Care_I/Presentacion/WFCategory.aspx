<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WFCategory.aspx.cs" Inherits="Presentacion.WFCategory" %>

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
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/WFPerson.aspx">Persona </asp:HyperLink>
            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/WFDevolution.aspx">Devolucion </asp:HyperLink>
            <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/WFBuy.aspx">Compra </asp:HyperLink>
            <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/WFUser.aspx">Compra </asp:HyperLink>

            <h1>Categorias </h1>
            <hr />
            <asp:Label ID="LBID" runat="server" Text="Label" Visible="false"></asp:Label><br />
            <asp:Label ID="Label1" runat="server" Text="Label">Nombre de la Categoria </asp:Label><br />
            <asp:TextBox ID="TBCategoria" runat="server"></asp:TextBox><br />
            <br />
            <asp:Label ID="LblMensaje" runat="server" Text=""></asp:Label><br />
            <asp:Button ID="BtnGuardar" runat="server" Text="Guardar" OnClick="BtnGuardar_Click"/>
            <asp:Button ID="BtnActualizar" runat="server" Text="Actualizar" OnClick="BtnActualizar_Click"/>
            <asp:Button ID="Eliminar" runat="server" Text="Eliminar" OnClick="Eliminar_Click"/>
            <asp:Button ID="BtnLimpiar" runat="server" Text="Limpiar" OnClick="BtnLimpiar_Click"/><br />
            <br />
            <asp:GridView ID="GVCategory" runat="server" AutoGenerateColumns="true" OnSelectedIndexChanged="GVCategory_SelectedIndexChanged" OnRowDeleting="GVCategory_RowDeleting">
                <Columns>
                    <asp:CommandField ShowSelectButton="true" />
                    <asp:CommandField ShowDeleteButton="true" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
