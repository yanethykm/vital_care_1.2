<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WFPerson.aspx.cs" Inherits="Presentacion.WFPerson" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <h1>Persona </h1>
    <form id="form1" runat="server">
        <div>
            <hr />
            <asp:Label ID="LBID" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="Label2" runat="server" Text="Label">Identificación </asp:Label>
            <asp:TextBox ID="TBIdent" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label3" runat="server" Text="Label">Nombre o Razón Social </asp:Label>
            <asp:TextBox ID="TBNombre" runat="server" ></asp:TextBox><br />
            <asp:Label ID="Label4" runat="server" Text="Label">Apellido </asp:Label>
            <asp:TextBox ID="TBApellido" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label5" runat="server" Text="Label">Dirección </asp:Label>
            <asp:TextBox ID="TBDireccion" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label6" runat="server" Text="Label">Teléfono </asp:Label>
            <asp:TextBox ID="TBTelefono" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label7" runat="server" Text="Label">Email </asp:Label>
            <asp:TextBox ID="TBEmail" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label8" runat="server" Text="Label">Tipo de documento (C.C ó C.E)</asp:Label>
            <asp:TextBox ID="TBTipoDoc" runat="server"></asp:TextBox><br /><br />
            <asp:Label ID="LblMensaje" runat="server" Text="" Visible="true"></asp:Label><br />
            <asp:Button ID="BtnGuardar" runat="server" Text="Guardar" OnClick="BtnGuardar_Click"/>
            <asp:Button ID="BtnActualizar" runat="server" Text="Actualizar" OnClick="BtnActualizar_Click" />
            <asp:Button ID="BtnLimpiar" runat="server" Text="Limpiar" OnClick="BtnLimpiar_Click" />
            <br /><br />
            <hr /><br />
            <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateColumns="true" OnRowDataBound="GridView1_RowDataBound" OnRowDeleting="GridView1_RowDeleting">
                <Columns>
                    <asp:CommandField ShowSelectButton="true" />
                    <asp:CommandField ShowDeleteButton="true" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
