<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Candidates.aspx.cs" Inherits="Candidates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Candidates Information" Font-Bold="true" Font-Size="XX-Large" Font-Italic="true"></asp:Label>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="20" AllowSorting="True" HeaderStyle-HorizontalAlign="Left" Width="100%" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ArtistID" DataSourceID="CandidateSqlDataSource" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px">
        <Columns>
            <asp:BoundField DataField="ArtistID" HeaderText="ArtistID" InsertVisible="False" ReadOnly="True" SortExpression="ArtistID" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
            <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age" />
            <asp:BoundField DataField="HomeTown" HeaderText="HomeTown" SortExpression="HomeTown" />
            <asp:BoundField DataField="TwitterURL" HeaderText="TwitterURL" SortExpression="TwitterURL" />
            <asp:CommandField SelectText="Select Artist" ShowSelectButton="True" />
        </Columns>
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#af2121" Font-Bold="True" ForeColor="#FFFFCC" />
        <PagerStyle BackColor="#ad2121" ForeColor="#FFFFCC" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#000000" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <SortedAscendingCellStyle BackColor="#FEFCEB" />
        <SortedAscendingHeaderStyle BackColor="#AF0101" />
        <SortedDescendingCellStyle BackColor="#F6F0C0" />
        <SortedDescendingHeaderStyle BackColor="#7E0000" />
    </asp:GridView>
    <asp:SqlDataSource ID="CandidateSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:VisualAnalyticConnectionString %>" SelectCommand="SELECT [Name], [Gender], [Age], [HomeTown], [TwitterURL], [ArtistID] FROM [Artist]"></asp:SqlDataSource>
</asp:Content>

