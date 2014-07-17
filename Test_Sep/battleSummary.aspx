<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="battleSummary.aspx.cs" Inherits="summary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <asp:Label ID="Label3" runat="server" BorderColor="Black" Font-Bold="True" Font-Italic="True" Font-Size="X-Large" ForeColor="Black" Text="Battle Rounds"></asp:Label>
    <br />
    <br />
    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/summary/battle1.jpg" />
    <br />
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" BorderColor="Black" Font-Bold="True" ForeColor="Black" Text="Episode 1 (1 March)"></asp:Label>
    <br />
    <br />
    <asp:Image ID="Image2" runat="server" ImageUrl="~/images/summary/battle2.jpg" />
    <br />
    <br />
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" BorderColor="Black" Font-Bold="True" ForeColor="Black" Text="Episode 2 (8 March)" ValidateRequestMode="Disabled"></asp:Label>
    <br />
    <br />
    <asp:Image ID="Image3" runat="server" ImageUrl="~/images/summary/battle3.jpg" />
    <br />
</asp:Content>

