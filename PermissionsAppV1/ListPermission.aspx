<%@ Page Title="Ver Permisos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListPermission.aspx.cs" Inherits="PermissionsAppV1.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <div>
        <asp:GridView ID="gvPermissions" runat="server"></asp:GridView>
    </div>
</asp:Content>
