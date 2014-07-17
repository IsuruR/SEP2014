<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Candidates.aspx.cs" Inherits="Candidates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Candidates Information" Font-Bold="true" Font-Size="XX-Large" Font-Italic="true"></asp:Label>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="20" AllowSorting="True" HeaderStyle-HorizontalAlign="Left" Width="100%" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="contestantID" DataSourceID="CandidateSqlDataSource" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="contestantID" HeaderText="Contestant ID" ReadOnly="True" SortExpression="contestantID" />
            <asp:BoundField DataField="contestantName" HeaderText="Contestant Name" SortExpression="contestantName" />
            <asp:BoundField DataField="gender" HeaderText="Gender" SortExpression="gender" />
            <asp:BoundField DataField="age" HeaderText="Age" SortExpression="age" />
            <asp:BoundField DataField="hometown" HeaderText="Home Town" SortExpression="hometown" />
            <asp:BoundField DataField="country" HeaderText="Country" SortExpression="country" />
            <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
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
    <asp:SqlDataSource ID="CandidateSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:VisualAnalyticConnectionString %>" SelectCommand="SELECT * FROM [contestant]"></asp:SqlDataSource>
</asp:Content>

