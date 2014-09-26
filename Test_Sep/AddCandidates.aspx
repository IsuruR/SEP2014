<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="AddCandidates.aspx.cs" Inherits="AddCandidates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width"/>

    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/bootstrap-responsive.min.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/main.css"/>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
            <form class="page-header" style="background-color: #FFFFFF">
            <fieldset >
                <legend style="font-style: italic; font-size: xx-large; font-weight: bold;">Add Candidates</legend>
                <asp:Panel ID="pnlSuccess" Visible="false" runat="server">
                      <div class='alert alert-success'>
                         <strong>Artist Added Successfully!</strong>
                            
                           </div>
                </asp:Panel>
                <asp:Panel ID="pnlError" Visible="false" runat="server">
                    <div class='alert alert-error'>
                     <strong>Error In Adding Artist!</strong>
                        
                     </div>
                </asp:Panel>
                
                <div class="control-group">
                    <asp:Label ID="Label2" class="control-label" runat="server" Text="Full Name"></asp:Label>

                    <div class="controls">
                        <asp:TextBox ID="txtFname" runat="server" ></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFname" ErrorMessage="*This information is required." ForeColor="#CC0000" ValidationGroup="Emp" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
        
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
                    <asp:Label ID="Label3" class="control-label" runat="server" Text="Age"></asp:Label>

                    <div class="controls">
                        <asp:TextBox ID="txtAge" runat="server" ></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAge" ErrorMessage="*This information is required." ForeColor="#CC0000" ValidationGroup="Emp" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
        
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtAge" Display="Dynamic" ErrorMessage="Age should be between 3 and 100" ForeColor="#CC0000" MaximumValue="100" MinimumValue="3" Type="Integer" ValidationGroup="Emp"></asp:RangeValidator>
        
                    </div>
                </div>
                    <div class="control-group">
                    <asp:Label ID="Label5" class="control-label" runat="server" Text="Hometown"></asp:Label>

                    <div class="controls">
                        <asp:TextBox ID="txtHometown" class="input-xxlarge" runat="server" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtHometown" ErrorMessage="*This information is required." ForeColor="#CC0000" ValidationGroup="Emp" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="control-group">

                <div class="control-group">
                    <asp:Label ID="Label6" class="control-label" runat="server" Text="Twitter URL"></asp:Label>

                    <div class="controls">
                        <asp:TextBox ID="txtTwitterUrl" class="input-xxlarge" runat="server" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtTwitterUrl" ErrorMessage="*This information is required." ForeColor="#CC0000" ValidationGroup="Emp" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtTwitterUrl" Display="Dynamic" ErrorMessage="Invalid URL Format" ForeColor="#CC0000" ValidationExpression="^https?://(www\.)?twitter\.com/(#!/)?([^/]+)(/\w+)*$" ValidationGroup="Emp"></asp:RegularExpressionValidator>
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
                    <asp:Label ID="Label13" class="control-label" runat="server" Text="Image"></asp:Label>

                    <div class="controls">
                        <asp:FileUpload ID="fileImage" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="fileImage" Display="Dynamic" ErrorMessage="*This information is required" ForeColor="#CC0000" ValidationGroup="Emp"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="fileImage" Display="Dynamic" ErrorMessage="Invalid Image Format" ForeColor="#CC0000" ValidationExpression="([^\s]+(\.(?i)(jpg|png|gif|bmp))$)" ValidationGroup="Emp"></asp:RegularExpressionValidator>
                    </div>
                </div>
         
                <div class="form-actions">
                    <asp:Button ID="btnsubmit" class="btn btn-primary" runat="server" Text="Submit" OnClick="btnsubmit_Click" ValidationGroup="Emp"/>
                    <asp:Button ID="btncancel" class="btn " runat="server" Text="Cancel" OnClick="btncancel_Click" />

                </div>
            </fieldset>
        </form>
</asp:Content>


