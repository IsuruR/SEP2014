var width = 200,
            height = 200;

var canvas = d3.select("#div1").append("svg")
    .attr("width", width)
    .attr("height", height)
    .append("g")
        .attr("transform", "translate(20, 20)");


var pack = d3.layout.pack()
    .size([width - 50, height - 50])
    .padding(10);

d3.json("bubbleData1.json", function (data) {

    var nodes = pack.nodes(data);
    console.log(nodes);

    var node = canvas.selectAll(".node")
        .data(nodes)
        .enter()
        .append("g")
            .attr("transform", function (d) { return "translate(" + d.x + "," + d.y + ")"; })

    node.append("circle")
        .attr("r", function (d) { return d.r; })
        .attr("fill", function (d) { return d.children ? "white" : "deepPink"; })
        .attr("opacity", 0.25)
        .attr("stroke", function (d) { return d.children ? "white" : "#ADADAD"; })
        .attr("stroke-width", "2");

    node.append("text")
        .text(function (d) { return d.children ? "" : d.name; })
        .attr("font-size", "0.8em");

});
