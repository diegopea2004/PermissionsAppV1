<%@ Page Title="Solicitar Permisos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PermissionsAppV1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <div class="wrapper col5">
        <table class="auto-style1">
            <tr>               
                <td class="auto-style2">
                    <asp:Label ID="Label3" runat="server" Text="Nombre"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:Label ID="Label4" runat="server" Text="Apellido"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:Label ID="Label5" runat="server" Text="Tipo de permiso"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:Label ID="Label6" runat="server" Text="Fecha de permiso"></asp:Label>
                </td>
                <td rowspan="2">&nbsp;</td>
            </tr>
            <tr>                
                <td class="auto-style2">
                    <asp:TextBox ID="txtName" runat="server" Width="100%"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtSurname" runat="server" Width="100%"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:DropDownList ID="ddlTypeOfPermission" runat="server"></asp:DropDownList>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtPermissionDate" runat="server" Width="100%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td><asp:Button ID="btnInsertPermission" runat="server" Text="INSERTAR" OnClick="btnInsertPermission_Click" /></td>
            </tr>
        </table>
    </div>
</asp:Content>
