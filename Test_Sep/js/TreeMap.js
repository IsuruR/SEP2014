var color = d3.scale.category20b();

var canvas = d3.select("#div1").append("svg")
    .attr("width", 1000)
    .attr("height", 1000)

d3.json("testTreeData.json", function (data) {

    var treemap = d3.layout.treemap()
        .size([1000, 1000])
        .nodes(data)

    //console.log(treemap);

    var cells = canvas.selectAll("g")
        .data(treemap)
        .enter()
        .append("g")
        .attr("class", "cell")

    cells.append("rect")
        .attr("x", function (d) { return d.x; })
        .attr("y", function (d) { return d.y; })
        .attr("width", function (d) { return d.dx; })
        .attr("height", function (d) { return d.dy; })
        .attr("fill", function (d) { return d.children ? null : color(d.parent.name); })
        .attr("stroke", "white")

    cells.append("text")
        .attr("x", function (d) { return d.x + d.dx / 2; })
        .attr("y", function (d) { return d.y + d.dy / 2; })
        .attr("text-anchor", "middle")
        .text(function (d) { return d.children ? null : d.name; });

});
