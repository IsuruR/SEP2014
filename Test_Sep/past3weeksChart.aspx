<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="past3weeksChart.aspx.cs" Inherits="past3weeksChart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <style>
        body {
            font-family: sans-serif;
            font-size: 68%;
        }
        iframe {
            height: 400px;
            width: 100%;
            background-color: white;
        }
        pre,
        body.loaded textarea {
            display:none;
        }
        body.loaded pre {
            background-color: #BAFFBA;
            border: 0 none;
            border-left: 4px solid #2e8b57;
            display: inline-block;
            font-size: 1.1em;
            margin: 0 0 8px 0;
            padding: 8px 30px 8px 12px;
        }
        th {
            text-align: left;
        }
        tr.header th {
            background-color: #2e8b57;
            color: white;
            font-size: 1.2em;
            padding: 4px 20px 4px 8px;
        }
        td, th {
            padding: 4px 8px 4px 8px;
        }
        tr:nth-of-type(odd) {
            background-color: #BAFFBA;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
         <div >
         
     <iframe src="Umidu.aspx" title="Colorbox integration" id="test" runat="server">
     </iframe>
        </div>
    <div>
         <div style="text-align:center">
         <br />
         <asp:Panel ID="pnlSuccess" Visible="True" runat="server">
                      <div class="alert alert-success">
                          
                                <asp:Button ID="Button1" runat="server" class="btn btn-primary" Text="<<< Back"  Width="200px" Height="50px" Font-Size="X-Large" OnClick="Button1_Click"/>
                              click this button to go to the Social Media Rating page..(Above diagram Visualize the contestant Twitter growth in Recently Past weeks.)
                          
                      </div>
                </asp:Panel>
        
    </div>
    </div>
</asp:Content>

