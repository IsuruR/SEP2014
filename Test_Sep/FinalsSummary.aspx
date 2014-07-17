<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="FinalsSummary.aspx.cs" Inherits="FinalsSummary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <asp:Label ID="Label3" runat="server" BorderColor="Black" Font-Bold="True" Font-Italic="True" Font-Size="X-Large" ForeColor="Black" Text="Quarter Finals - Week 1"></asp:Label>
    <br />
    <br />
    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/summary/QuarterFinals1.jpg" />
    <br />
    <br />
    <br />
    <asp:Label ID="Label4" runat="server" BorderColor="Black" Font-Bold="True" Font-Italic="True" Font-Size="X-Large" ForeColor="Black" Text="Semi Finals - Week 2"></asp:Label>
    <br />
    <br />
    <asp:Image ID="Image2" runat="server" ImageUrl="~/images/summary/SemiFinals.jpg" />
    <br />
    <br />
    <br />
    <asp:Label ID="Label5" runat="server" BorderColor="Black" Font-Bold="True" Font-Italic="True" Font-Size="X-Large" ForeColor="Black" Text="Finals - Week 3"></asp:Label>
    <br />
    <br />
    <asp:Image ID="Image3" runat="server" ImageUrl="~/images/summary/finals.jpg" />
    <br />
    <br />
</asp:Content>

