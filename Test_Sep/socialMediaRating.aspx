<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="socialMediaRating.aspx.cs" Inherits="socialMediaRating" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align:center">
    <div>
        
            <asp:Panel ID="pnlSuccess" Visible="True" runat="server">
                      <div style="text-align:center" class="alert alert-success">
                         <strong><asp:Label ID ="week" runat="server"></asp:Label></strong>
                            Twitter Growth for the Contestants
                           </div>
                </asp:Panel>
    </div>
    <div style="text-align:center">
        <asp:GridView ID="GridView1" runat="server" Width="100%" CellPadding="4" AutoGenerateColumns="False" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" PageSize="5" OnRowCommand="GridView1_RowCommand" >
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Rank" HeaderText="Rank">
                <FooterStyle HorizontalAlign="Center" />
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:ImageField DataImageUrlField="Image" >
                    <ControlStyle Height="70px" Width="70px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:ImageField>
                <asp:BoundField DataField="Name" HeaderText="Name" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="followers" HeaderText="Followers" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="increasedBy" HeaderText="Increased Amount" >
                </asp:BoundField>
                <asp:BoundField DataField="Percentage" HeaderText="Growth Percentage" >
                
                
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                
                
                <asp:buttonfield  buttontype="button" Text="Show growth" commandname="Details"  />
                
                
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Font-Strikeout="False" HorizontalAlign="Center" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    </div>
    <div>
          <div>
              <br />

        <asp:Label ID="lbl1" runat="server"></asp:Label>
            <asp:Panel ID="pnlYouTube" Visible="True" runat="server">
                      <div style="text-align:center" class="alert alert-success">
                         <strong><asp:Label ID ="Label2" runat="server"></asp:Label></strong>
                            Contestants videos Views in YOUTUBE
                           </div>
                </asp:Panel>
    </div>
        <div style="text-align:center">
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="75%"  HorizontalAlign="Center" AllowPaging="false" PageSize="5">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:ImageField DataImageUrlField="utubeimage">
                        <ControlStyle Height="70px" Width="70px" />
                    </asp:ImageField>
                    <asp:BoundField DataField="Name" HeaderText="Name"/>
                    <asp:BoundField DataField="Views" HeaderText="Views"/>
                </Columns>
                <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Font-Strikeout="False" HorizontalAlign="Center" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
          </div>
    </div>
        </div>
</asp:Content>

