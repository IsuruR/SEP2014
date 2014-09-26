<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="MainDashboard.aspx.cs" Inherits="MainDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style>
      iframe {
            height: 720px;
            width: 100%;
        }
         #iframe2 {
             height: 750px;
            width: 100%;
         }
       </style> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <iframe src="compareArtist.aspx" title="Colorbox integration"></iframe>
    <iframe src="compareArtist.aspx" title="Colorbox integration"></iframe>
     <iframe src="WorldMapWithLeaflet.aspx" title="Colorbox integration" class="iframe2"></iframe>
</asp:Content>

