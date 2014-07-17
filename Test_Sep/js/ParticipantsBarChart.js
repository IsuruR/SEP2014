window.onload = function () {
    d3.json("rounds.json", function (unparsedData) {

        var data = unparsedData.slice();
        //console.log(data);
        //console.log(data[0]['participants']);


        var participants = new Array();
        var rounds = new Array();


        for (var i = 0; i < data.length; i++) {
            participants.push(data[i]['participants']);
            rounds.push(data[i]['name']);
        }

        console.log(participants);
        console.log(rounds);


        //Create the SVG graph.
        var svg = d3.select("#div1").append("svg").attr("width", "100%").attr("height", "100%").append("g")
                .attr("transform", "translate(20, 50)");


        //Add data to the graph and call enter.
        var dataEnter = svg.selectAll("rect").data(participants).enter();


        //The height of the graph (without text).
        var graphHeight = 450;

        //The width of each bar.
        var barWidth = 100;

        //The distance between each bar.
        var barSeparation = 10;

        //The maximum value of the data.
        var maxData = 60;



        //The actual horizontal distance from drawing one bar rectangle to drawing the next.
        var horizontalBarDistance = barWidth + barSeparation;


        //The horizontal and vertical offsets of the text that displays each bar's value.
        var textXOffset = horizontalBarDistance / 2 - 5;
        var textYOffset = 20;


        //The value to multiply each bar's value by to get its height.
        var barHeightMultiplier = graphHeight / maxData;

        //The actual Y position of every piece of text.
        var textYPosition = graphHeight + textYOffset;


        //Draw the bars.
        dataEnter.append("rect").attr("fill", "Turquoise").attr("x", function (d, i) {
            return i * horizontalBarDistance;
        }).attr("y", function (d) {
            return graphHeight - d * barHeightMultiplier;
        }).attr("width", function (d) {
            return barWidth;
        }).attr("height", function (d) {
            return d * barHeightMultiplier;
        });


        var aa = svg.selectAll("text").data(rounds).enter();

        //Draw the text.
        aa.append("text").text(function (d) {
            return d;
        }).attr("x", function (d, i) {
            return i * horizontalBarDistance + textXOffset;
        }).attr("y", textYPosition).attr("text-anchor", "middle");
    });
}
