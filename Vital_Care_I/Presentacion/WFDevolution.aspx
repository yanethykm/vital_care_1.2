<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WFDevolution.aspx.cs" Inherits="Presentacion.WFDevolution" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Devoluciones
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <form id="form1" class="row g-3" runat="server">
        <div>
            <h1>Devoluciones </h1>
            <hr />

            <asp:Label ID="LBID" runat="server" Text="Label" Visible="false"></asp:Label><br />
            <div class="col-md-6">
                <label for="inputState" class="form-label" runat="server">Fecha de devolucion (AAAA - MM - DD)</label>
                <asp:TextBox ID="TBFechaDev" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <label for="inputState" class="form-label" runat="server">Cantidad devuelta</label>
                <asp:TextBox ID="TBCantidadDev" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <label for="inputState" class="form-label" runat="server">Razon de devolucion</label>
                <asp:TextBox ID="TBRazon" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-6">
                <label for="inputState" class="form-label" runat="server">Venta ID</label>
                <asp:TextBox ID="TBVenta" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <hr />
            <asp:Label ID="LblMensaje" runat="server" Text="Label" Visible="false"></asp:Label><br />
            <br />
            <div class="col-12">
                <asp:Button ID="BtnGuardar" runat="server" Text="Guardar" OnClick="BtnGuardar_Click" CssClass="btn btn-primary"/>
                <asp:Button ID="BtnLimpiar" runat="server" Text="Limpiar" OnClick="BtnLimpiar_Click" CssClass="btn btn-primary"/><br />
            </div>
            <asp:GridView ID="GVDevolution" runat="server" AutoGenerateColumns="true" CssClass="p-3 border bg-light text-center">
                <Columns>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</asp:Content>
