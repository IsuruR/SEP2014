window.onload = function () {
    d3.json("rounds.json", function (unparsedData) {

        var data = unparsedData.slice();

        var participants = new Array();
        var rounds = new Array();


        for (var i = 0; i < data.length; i++) {
            participants.push(data[i]['participants']);
            rounds.push(data[i]['name']);

        }

        console.log(participants);
        console.log(rounds);


        var r = 300;

        var color = d3.scale.ordinal()
            .range(["orchid", "turquoise", "pink", "coral", "paleGreen", "moccasin"])

        var canvas = d3.select("#div1").append("svg")
            .attr("width", 1500)
            .attr("height", 1500);

        var group = canvas.append("g")
            .attr("transform", "translate(300, 300)");

        var arc = d3.svg.arc()
            .innerRadius(200)
            .outerRadius(r);
        //To make this a pie chart, inner radius should be 0

        var pie = d3.layout.pie()
            .value(function (d) { return d; });

        var arcs = group.selectAll(".arc")
            .data(pie(participants))
            .enter()
            .append("g")
            .attr("class", "arc");

        arcs.append("path")
            .attr("d", arc)
            .attr("fill", function (d) { return color(d.data); });

        //canvas.selectAll("text")
        //    .data(pie(rounds))
        //    .enter()

        //var name = data(pie(name));

        arcs.append("text")
            .attr("transform", function (d) { return "translate(" + arc.centroid(d) + ")"; })
            .attr("text-anchor", "middle")
            .attr("font-size", "1.5em")
            .text(function (d) { return d.data; });
    });
}