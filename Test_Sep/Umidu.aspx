<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Umidu.aspx.cs" Inherits="Umidu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .axis {
        font: 10px sans-serif;
        }
        .axis path,
        .axis line {
        fill: none;
        stroke: #000;
        shape-rendering: crispEdges;
        }
    </style>
     <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/bootstrap-responsive.min.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
</head>
<body>
   <div>
       
       
   </div>
    <div id="div1" style="text-align:center;vertical-align:central">

    </div>
    <%-- <div style="text-align:center">
         <br />
         <asp:Panel ID="pnlSuccess" Visible="True" runat="server">
                      <div class="alert alert-success">
                          <form id="Form1" runat="server">
        <asp:Button ID="Button1" runat="server" class="btn btn-primary" Text="<<< Back" OnClick="Button1_Click" Width="200px" Height="50px" Font-Size="X-Large"/>
                              click this button to go to the Social Media Rating page..(Above diagram Visualize the contestant Twitter growth in Recently Past weeks.)
        </form>
                           </div>
                </asp:Panel>
        
    </div>--%>
    <script src="http://d3js.org/d3.v3.min.js"></script>
    <script>

        var margin = {top: 20, right: 20, bottom: 60, left: 60},
        width = 600 - margin.left - margin.right,
        height = 400 - margin.top - margin.bottom;

        // Parse the date / time
        var parseDate = d3.time.format("%d/%m/%Y").parse;

        var x = d3.scale.ordinal().rangeRoundBands([0, width], .65);

        var y = d3.scale.linear().range([height, 0]);

        var xAxis = d3.svg.axis()
        .scale(x)
        .orient("bottom")
        .tickFormat(d3.time.format("%d/%m/%Y"));

        var yAxis = d3.svg.axis()
        .scale(y)
        .orient("left")
        .ticks(10);

        var svg = d3.select("#div1").append("svg")
        .attr("width", width + margin.left + margin.right)
        .attr("height", height + margin.top + margin.bottom)
        .append("g")
        .attr("transform",
        "translate(" + margin.left + "," + margin.top + ")");

        d3.csv("BarData.csv", function(error, data) {
            data.forEach(function(d) {
                d.rdate = parseDate(d.rdate);
                d.followers = +d.followers;
            });
            x.domain(data.map(function(d) { return d.rdate; }));
            y.domain([0, d3.max(data, function(d) { return d.followers; })]);

            svg.append("g")
            .attr("class", "x axis")
            .attr("transform", "translate(0," + height + ")")
            .call(xAxis);
           
            svg.append("text")      // text label for the x axis
            .attr("transform",
                    "translate(" + (width / 2) + " ," +
                    (height + margin.bottom) + ")")
            .style("text-anchor", "middle")
            .style("text-decoration", "bold")
            .text("Date");


            svg.append("g")
            .attr("class", "y axis")
            .call(yAxis);
           
            svg.append("text")      // text label for the y axis
            .attr("transform", "rotate(-90)")
            .attr("y", 0 - (margin.left))
            .attr("x", 0 - (height / 2))
            .attr("dy", "1em")
            .style("text-anchor", "middle")
            .text("No.of Followers");

            svg.selectAll("bar")
            .data(data)
            .enter().append("rect")
            .style("fill", "steelblue")
            .attr("x", function(d) { return x(d.rdate); })
            .attr("width", x.rangeBand())
            .attr("y", function (d) { return y(d.followers); })
            .attr("height", function (d) { return height - y(d.followers); });
        });
</script>
</body>
</html>
