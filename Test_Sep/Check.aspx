<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Check.aspx.cs" Inherits="Check" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/barchart1.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../src/plugins/jqplot.barRenderer.min.js"></script>
<script type="text/javascript" src="../src/plugins/jqplot.categoryAxisRenderer.min.js"></script>
<script type="text/javascript" src="../src/plugins/jqplot.pointLabels.min.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="width:100%">
    <div style="width:50%;background:#FD0000">
        
    </div>
</div>
   <script type="text/javascript">
       google.load("visualization", "1", { packages: ["corechart"] });
       google.setOnLoadCallback(drawChart);
       function drawChart() {
           var data = google.visualization.arrayToDataTable([
             ['Year', 'Sales', 'Expenses'],
             ['2004', 1000, 400],
             ['2005', 1170, 460],
             ['2006', 660, 1120],
             ['2007', 1030, 540]
           ]);

           var options = {
               title: 'Company Performance',
               vAxis: { title: 'Year', titleTextStyle: { color: 'red' } }
           };

           var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
           chart.draw(data, options);
       }
    </script>
    <div style="width:100%;float:left">
    <div id="chart_div" style="width: 50%; height: 500px;float:left"> </div>
     <div id="Div1" style="width: 50%; height: 500px;float:left"> </div>
    </div>
</asp:Content>

