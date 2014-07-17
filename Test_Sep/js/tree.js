var canvas = d3.select("#tree").append("svg")
               .attr("width", 1200)
               .attr("height", 1200)
               .append("g")
                   .attr("transform", "translate(50, 50)");


var tree = d3.layout.tree()
    .size([1000, 1000]);

d3.json("treeData.json", function (data) {
    //var nodes = new Array();

    var nodes = tree.nodes(data);
    //console.log(nodes);

    var links = tree.links(nodes);
    //console.log(links);

    var node = canvas.selectAll(".node")
        .data(nodes)
        .enter()
        .append("g")
            .attr("class", "node")
            .attr("transform", function (d) { return "translate(" + d.y + "," + d.x + ")"; })

    node.append("circle")
        .attr("r", 8)
        .attr("fill", "mediumVioletRed");



    var diagonal = d3.svg.diagonal()
        .projection(function (d) { return [d.y, d.x]; });

    canvas.selectAll(".links")
        .data(links)
        .enter()
        .append("path")
        .attr("class", "link")
        .attr("fill", "none")
        .attr("stroke", "steelblue")
        .attr("d", diagonal);

    node.append("text")
        .text(function (d) { return d.name; });

});