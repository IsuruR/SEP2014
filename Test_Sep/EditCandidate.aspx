<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="EditCandidate.aspx.cs" Inherits="EditCandidate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width"/>

    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/bootstrap-responsive.min.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/main.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label runat="server" Text="Edit Candidates" Font-Bold="true" Font-Size="XX-Large" Font-Italic="true"></asp:Label>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" HeaderStyle-HorizontalAlign="Left" Width="100%" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ArtistID" DataSourceID="CandidateSqlDataSource" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px">
        <Columns>
            <asp:BoundField DataField="ArtistID" HeaderText="ArtistID" InsertVisible="False" ReadOnly="True" SortExpression="ArtistID" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
            <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age" />
            <asp:BoundField DataField="HomeTown" HeaderText="HomeTown" SortExpression="HomeTown" />
            <asp:CommandField DeleteText="" SelectText="Select Artist" ShowDeleteButton="True" ShowSelectButton="True" />
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
    <asp:SqlDataSource ID="CandidateSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:VisualAnalyticConnectionString %>" SelectCommand="SELECT [Name], [Gender], [Age], [HomeTown], [ArtistID] FROM [Artist]">
    </asp:SqlDataSource>
    <asp:Panel ID="pnlAll" Visible="false" runat="server">
        <fieldset >
            <legend>Edit Candidates</legend>
            <asp:Panel ID="pnlSuccess" Visible="false" runat="server">
                <div class='alert alert-success'>
                    <strong>Done!</strong> Artist Updated Successfully.
                </div>
            </asp:Panel>
            <asp:Panel ID="pnlError" Visible="false" runat="server">
                <div class='alert alert-error'>
                    <strong>Error!</strong> Cannot Update Artist!
                </div>
            </asp:Panel>
            <asp:Panel ID="PanelDeleteSuccess" Visible="false" runat="server">
                <div class='alert alert-success'>
                    <strong>Done!</strong> Artist Deleted Successfully!
                </div>
            </asp:Panel>
            <asp:Panel ID="PanelDeleteError" Visible="false" runat="server">
                <div class='alert alert-error'>
                    <strong>Error!</strong> Cannot Delete Artist!
                </div>
            </asp:Panel>
            <div class="control-group">
                <asp:Label ID="Label2" class="control-label" runat="server" Text="First Name"></asp:Label>
                <div class="controls">
                    <asp:TextBox ID="txtFname" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFname" ErrorMessage="*This information is required." ForeColor="#CC0000" ValidationGroup="Emp" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="control-group">
                <asp:Label ID="Label10" class="control-label" runat="server" Text="Gender"></asp:Label>
                <div class="controls">
                    <asp:DropDownList ID="drpSex" class="span3" runat="server">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="control-group">
                    <asp:Label ID="Label1" class="control-label" runat="server" Text="Age"></asp:Label>

                    <div class="controls">
                        <asp:TextBox ID="txtAge" runat="server" ></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAge" ErrorMessage="*This information is required." ForeColor="#CC0000" ValidationGroup="Emp" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
        
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtAge" Display="Dynamic" ErrorMessage="Age should be between 3 and 100" ForeColor="#CC0000" MaximumValue="100" MinimumValue="3" Type="Integer" ValidationGroup="Emp"></asp:RangeValidator>
        
                    </div>
                </div>
            <div class="control-group">
                <asp:Label ID="Label5" class="control-label" runat="server" Text="Hometown"></asp:Label>
                <div class="controls">
                    <asp:TextBox ID="txtHometown" class="input-xxlarge" runat="server" OnTextChanged="txtHometown_TextChanged" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtHometown" ErrorMessage="*This information is required." ForeColor="#CC0000" ValidationGroup="Emp" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
            </div>
            
            <div class="control-group">
                <asp:Label ID="Label3" class="control-label" runat="server" Text="Twitter URL"></asp:Label>
                <div class="controls">
                    <asp:TextBox ID="txtTw" class="input-xxlarge" runat="server" OnTextChanged="txtTw_TextChanged" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtTw" ErrorMessage="*This information is required." ForeColor="#CC0000" ValidationGroup="Emp" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtTw" Display="Dynamic" ErrorMessage="Invalid URL Format" ForeColor="#CC0000" ValidationExpression="^https?://(www\.)?twitter\.com/(#!/)?([^/]+)(/\w+)*$" ValidationGroup="Emp"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="control-group">
                <asp:Label ID="Label12" class="control-label" runat="server" Text="Team"></asp:Label>
                <div class="controls">
                    <asp:DropDownList ID="drpTeam" class="span3" runat="server">
                        <asp:ListItem Value="1" >Kylie</asp:ListItem>
                        <asp:ListItem Value="2">Ricky</asp:ListItem>
                        <asp:ListItem Value="3">Tom</asp:ListItem>
                        <asp:ListItem Value="4">Will</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="control-group">
                <asp:Label ID="Label4" class="control-label" runat="server" Text="Image"></asp:Label>
                <div class="controls">
                    <asp:Image ID="ArtistImage" runat="server" Height="200px" Width="150px" />
                    <br />
                </div>
                <div class="controls">
                    <asp:FileUpload ID="fileImage" runat="server"/>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="fileImage" Display="Dynamic" ErrorMessage="Invalid Image Format" ForeColor="#CC0000" ValidationExpression="([^\s]+(\.(?i)(jpg|png|gif|bmp))$)" ValidationGroup="Emp"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="form-actions">
                <asp:Button ID="btnsubmit"  class="btn btn-primary" runat="server" Text="Edit" OnClick="btnsubmit_Click" ValidationGroup="Emp"/>
                <asp:Button ID="btnDelete"  runat="server" CssClass="btn btn-danger" Text="Delete" OnClick="btnDelete_Click" OnClientClick="return confirm('Are you sure you want to delete this Artist?');"/>
                <asp:Button ID="btncancel" class="btn " runat="server" Text="Cancel" OnClick="btncancel_Click" />
            </div>
        </fieldset></asp:Panel>
    <br />
     <form class="page-header" style="background-color: #FFFFFF">
            &nbsp;</form>
</asp:Content>

