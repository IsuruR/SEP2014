<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="storyPage2.aspx.cs" Inherits="storyPage2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="jquery.youtubevideogallery.js"></script>
    <link rel="stylesheet" href="youtube-video-gallery.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="test/test.css" type="text/css" rel="stylesheet">
    <!--[if IE lt 9]>
    <link href="youtube-video-gallery-legacy-ie.css" type="text/css" rel="stylesheet"/>
    <![endif]-->
    <title></title>
     <style>
        body {
            font-family: sans-serif;
            font-size: 68%;
        }
        iframe {
            height: 400px;
            width: 100%;
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
    <h1 style="font-weight: bold; font-size: x-large; font-style: italic"><asp:Label ID="Label1" runat="server" Text="BBC The Voice UK 2014"></asp:Label></h1>
  <iframe src="about/indexAll.html" title="Colorbox integration"></iframe>
    

</asp:Content>

