<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WFProvider.aspx.cs" Inherits="Presentacion.WFProvider" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Proveedor</h1>
            <hr /><br />
            <asp:Label ID="Label1" runat="server" Text="Label">Seleccione una Persona  </asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem Text="--Seleccione una Persona--" Value=""></asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="LBID" runat="server" Text="Label" Visible="true"></asp:Label>
            <asp:Label ID="Label2" runat="server" Text="Label">Identificación </asp:Label>
            <asp:TextBox ID="TBNit" runat="server" ReadOnly="true"></asp:TextBox><br />
            <asp:Label ID="Label3" runat="server" Text="Label ">Nombre </asp:Label>
            <asp:TextBox ID="TBNombre" runat="server" ReadOnly="true"></asp:TextBox><br />
            <asp:Label ID="Label5" runat="server" Text="Label">Apellido </asp:Label>
            <asp:TextBox ID="TBApellido" runat="server" ReadOnly="true"></asp:TextBox><br />
            <asp:Label ID="Label6" runat="server" Text="Label">Teléfono </asp:Label>
            <asp:TextBox ID="TBTelefono" runat="server" ReadOnly="true"></asp:TextBox><br />
            <asp:Label ID="Label4" runat="server" Text="Label">Email </asp:Label>
            <asp:TextBox ID="TBEmail" runat="server" ReadOnly="true"></asp:TextBox><br />
            <asp:Button ID="BtnGuardarP" runat="server" Text="Guardar" OnClick="BtnGuardarP_Click" />
            <br />
            <asp:GridView ID="GVProvider" runat="server" OnSelectedIndexChanged="GVProvider_SelectedIndexChanged" AutoGenerateColumns="true" OnRowDeleting="GVProvider_RowDeleting">
                <Columns>
                    <asp:CommandField ShowSelectButton="true" />
                    <asp:CommandField ShowDeleteButton="true" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
