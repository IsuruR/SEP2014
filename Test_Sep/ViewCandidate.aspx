<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ViewCandidate.aspx.cs" Inherits="ViewCandidate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width"/>

    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/bootstrap-responsive.min.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/main.css"/>
    <style type="text/css">


        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 331px;
        }


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">   
    <form class="page-header" style="background-color: #FFFFFF">
            <fieldset >
                <asp:Image ID="Image1" runat="server" Width="150px" Height="200px"  class="img-polaroid" />            
                <legend><asp:Label ID="lblFullName" runat="server" Text=""></asp:Label></legend>
             <div class="dl-horizontal">
               
                <br/>
            </div>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style2">
                 <asp:Label ID="Label3" class="control-label" runat="server" Text="Gender"></asp:Label>
                        </td>
                        <td>
                  <asp:Label ID="lblSex" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="Label1" class="control-label" runat="server" Text="Age"></asp:Label>

                        </td>
                        <td>
                            <asp:Label ID="lblAge" class="control-label" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                 <asp:Label ID="Label4" class="control-label" runat="server" Text="Hometown"></asp:Label>
                        </td>
                        <td>
                  <asp:Label ID="lblAddress" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                 <asp:Label ID="Label6" class="control-label" runat="server" Text="Twitter Page"></asp:Label>
                        </td>
                        <td>
                  <asp:Label ID="lblTwitter" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                 <asp:Label ID="Label14" class="control-label" runat="server" Text="Team"></asp:Label>
                        </td>
                        <td>
                  <asp:Label ID="lblTeam" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
           <div class="form-actions">
                    <asp:Button ID="btncancel" class="btn " runat="server" Text="Go Back" OnClick="btncancel_Click" />
                </div>
            </fieldset>
        </form>
</asp:Content>

