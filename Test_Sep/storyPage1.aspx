<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="storyPage1.aspx.cs" Inherits="storyPage1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
    <link href="../css/circle-menu.css" rel="stylesheet" />
   
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="../jQuery.circleMenu.js"></script>
      <style>
        body {
            font-family: sans-serif;
            font-size: 68%;
        }
        iframe {
            height: 600px;
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
     <iframe src="about/index.htm" title="Colorbox integration"></iframe>
        </div>
    
</asp:Content>

