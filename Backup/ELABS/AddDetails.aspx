<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddDetails.aspx.cs" Inherits="ELABS.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 183px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div>

    <br />
    <asp:Label ID="Label2" runat="server" Text="Add Company Details" 
        style="font-size: medium; font-family: 'Baskerville Old Face'; text-decoration: underline"></asp:Label>
    <br />
    <br />
    <table class="nav-justified">
        <tr>
            <td class="style1">
                <asp:Label ID="Label4" runat="server" Text="Company_name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtcompanyname" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label5" runat="server" Text="Formation_year"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtformationyear" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label6" runat="server" Text="Address"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtaddress" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label7" runat="server" Text="Technician_name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txttechnicienname" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label8" runat="server" Text="Contact_no"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtcontactno" runat="server" MaxLength="10"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                <asp:Button ID="btninsert" runat="server" onclick="btninsert_Click" 
                    Text="Insert" />
                <asp:Button ID="btnback" runat="server" onclick="btnback_Click" Text="Back" />
            </td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <br />

</div>

</asp:Content>
