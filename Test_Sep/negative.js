var margin = { top: 20, right: 20, bottom: 60, left: 60 },
        width = 600 - margin.left - margin.right,
        height = 400 - margin.top - margin.bottom;

// Parse the date / time
//var parseDate = d3.time.format("%m/%d/%Y").parse;

var x = d3.scale.ordinal().rangeRoundBands([0, width], .65);

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
        d.negative = +d.negative;
    });
    x.domain(data.map(function (d) { return d.name; }));
    y.domain([0, d3.max(data, function (d) { return d.negative; })]);

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
    .text("Negative Feats");

    svg.selectAll("bar")
    .data(data)
    .enter().append("rect")
    .style("fill", "steelblue")
    .attr("x", function (d) { return x(d.name); })
    .attr("width", x.rangeBand())
    .attr("y", function (d) { return y(d.negative); })
    .attr("height", function (d) { return height - y(d.negative); });
});