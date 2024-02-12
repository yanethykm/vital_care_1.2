<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WFCategory.aspx.cs" Inherits="Presentacion.WFCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Categorias
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <form id="form1" class="row g-3" runat="server">
        <div>
            <h1>Categorias </h1>
            <hr />
            <asp:Label ID="LBID" runat="server" Text="Label" Visible="false"></asp:Label><br />
            <div class="col-md-6">
                <label for="inputState" class="form-label" runat="server">Nombre de la Categoria</label>
                <asp:TextBox ID="TBCategoria" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <asp:Label ID="LblMensaje" runat="server" Text=""></asp:Label><br />
            <div class="col-12">
                <asp:Button ID="BtnGuardar" runat="server" Text="Guardar" OnClick="BtnGuardar_Click" CssClass="btn btn-primary"/>
                <asp:Button ID="BtnActualizar" runat="server" Text="Actualizar" OnClick="BtnActualizar_Click" CssClass="btn btn-primary"/>
                <asp:Button ID="Eliminar" runat="server" Text="Eliminar" OnClick="Eliminar_Click" CssClass="btn btn-primary"/>
                <asp:Button ID="BtnLimpiar" runat="server" Text="Limpiar" OnClick="BtnLimpiar_Click" CssClass="btn btn-primary"/><br />
            </div>
            <br />
            <asp:GridView ID="GVCategory" runat="server" AutoGenerateColumns="true" OnSelectedIndexChanged="GVCategory_SelectedIndexChanged" OnRowDeleting="GVCategory_RowDeleting" CssClass="p-3 border bg-light text-center">
                <Columns>
                    <asp:CommandField ShowSelectButton="true" />
                    <asp:CommandField ShowDeleteButton="true" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</asp:Content>
