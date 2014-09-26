<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Positive.aspx.cs" Inherits="PositiveNegative" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="http://d3js.org/d3.v3.min.js"></script>
</head>
<body>
    <div id="div1" style="font-size:24px; text-decoration:underline; text-align: center; ">Positive Feats Analysis</div>
    <br />
    <br />
    <br />

    <div id="div2"></div>

    <script>
        var margin = { top: 5, right: 20, bottom: 165, left: 80},
        width = 900 - margin.left - margin.right,
        height = 600- margin.top - margin.bottom;

        // Parse the date / time
        //var parseDate = d3.time.format("%m/%d/%Y").parse;
        //var parsePositive = d3.format("r");

        var x = d3.scale.ordinal().rangeRoundBands([0, width], .35);

        var y = d3.scale.linear().range([height, 0]);

        var xAxis = d3.svg.axis()
        .scale(x)
        .orient("bottom");
        //.tickFormat(d3.time.format("%m/%d/%Y"));

        var yAxis = d3.svg.axis()
        .scale(y)
        .orient("left")
        .ticks(10);

        var svg = d3.select("#div2").append("svg")
        .attr("width", width + margin.left + margin.right)
        .attr("height", height + margin.top + margin.bottom)
        .append("g")
        .attr("transform",
        "translate(" + margin.left + "," + margin.top + ")");

        d3.csv("PositiveNegative.csv", function (error, data) {
            data.forEach(function (d) {
                d.name = d.name;
                d.positive = d.positive;
            });
            x.domain(data.map(function (d) { return d.name; }));
            y.domain([0, d3.max(data, function (d) { return d.positive; })]);

            svg.append("g")
            .attr("class", "x axis")
            .attr("transform", "translate(0," + height + ")")
            .call(xAxis)
            .selectAll("text")
            .style("text-anchor", "end")
            .attr("dx", "-.8em")
            .attr("dy", "-.55em")
            .attr("transform", "rotate(-90)");

            svg.append("text")      // text label for the x axis
            .attr("transform",
                    "translate(" + (width / 2) + " ," +
                    (height + margin.bottom) + ")")
            .style("text-anchor", "middle")
            .style("text-decoration", "bold")
            .style("text-size", "16px")
            .text("Contestant");


            svg.append("g")
            .attr("class", "y axis")
            .call(yAxis);

            svg.append("text")      // text label for the y axis
            .attr("transform", "rotate(-90)")
            .attr("y", 0 - (margin.left))
            .attr("x", 0 - (height / 2))
            .attr("dy", "1em")
            .style("text-anchor", "middle")
            .style("text-decoration", "bold")
            .style("text-size", "16px")
            .text("Positive Feats");

            svg.selectAll("bar")
            .data(data)
            .enter().append("rect")
            .style("fill", "seagreen")
            .attr("x", function (d) { return x(d.name); })
            .attr("width", x.rangeBand())
            .attr("y", function (d) { return y(d.positive); })
            .attr("height", function (d) { return height - y(d.positive); });
        });
    </script>
</body>
</html>
