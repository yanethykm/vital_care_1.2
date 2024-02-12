<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WFProvider.aspx.cs" Inherits="Presentacion.WFProvider" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Usuarios
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <form id="form1" class="row g-3" runat="server">
        <div>
            <br />
            <h1>Proveedor</h1>
            <hr />
            <asp:Label ID="LBID" runat="server" Text="Label" Visible="true"></asp:Label>
            <div class="col-md-6">
                <asp:Label ID="Label1" runat="server" Text="Label">Seleccione una Persona  </asp:Label>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem Text="--Seleccione una Persona--" Value=""></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-12">
                <asp:Button ID="BtnGuardarP" runat="server" Text="Guardar" OnClick="BtnGuardarP_Click" CssClass="btn btn-primary"/>
            </div>
                <br />
            <asp:GridView ID="GVProvider" runat="server" OnSelectedIndexChanged="GVProvider_SelectedIndexChanged" AutoGenerateColumns="true" OnRowDeleting="GVProvider_RowDeleting">
                <Columns>
                    <asp:CommandField ShowSelectButton="true" />
                    <asp:CommandField ShowDeleteButton="true" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</asp:Content>
