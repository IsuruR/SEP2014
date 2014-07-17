<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Statistics.aspx.cs" Inherits="js_Statistics" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/barchart1.css" type="text/css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <table style="width:100%">
    <tr>
        <td style="margin-right:auto">
             <svg>
      <rect color="red" width="200" height="15" ></rect>
  </svg>

        </td>
       
        <td> 
            <svg>
      <rect color="red" width="200" height="15"></rect>
  </svg>
            
        </td>
    </tr>
   
</table>

</asp:Content>

