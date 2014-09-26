<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="PositiveFeats.aspx.cs" Inherits="PositiveNegativeFeats" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        body {
            font-family: sans-serif;
            font-size: 68%;
        }
        iframe {
            height: 800px;
            width: 100%;
            background-color: white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
    <iframe src="Positive.aspx"></iframe>
    </div>
</asp:Content>

