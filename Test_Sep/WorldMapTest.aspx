<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WorldMap.aspx.cs" Inherits="WorldMap" %>

<!DOCTYPE html>

<meta charset="utf-8">

<style>
    path {
        stroke: white;
        stroke-width: 0.25px;
        fill: #969696;
    }
</style>

<body>
    <script src="http://d3js.org/d3.v3.min.js"></script>
    <script src="http://d3js.org/topojson.v0.min.js"></script>

    <script>
        var width = 960,
        height = 500;

        var projection = d3.geo.mercator()
        .center([0, 5])
        .scale(150)
        .rotate([-180, 0]);

        var svg = d3.select("body").append("svg")
        .attr("width", width)
        .attr("height", height);

        var path = d3.geo.path()
        .projection(projection);

        var g = svg.append("g");
        // load and display the World
        d3.json("world-110m2.json", function (error, topology) {
            g.selectAll("path")
            .data(topojson.object(topology, topology.objects.countries)
            .geometries)
            .enter()
            .append("path")
            .attr("d", path)


            d3.csv("cities.csv", function (error, data) {
                g.selectAll("circle")
                .data(data)
                .enter()
                .append("circle")
                .attr("cx", function (d) {
                    return projection([d.lon, d.lat])[0];
                })
                .attr("cy", function (d) {
                    return projection([d.lon, d.lat])[1];
                })
                .attr("r", 5)
                .style("fill", "green");
            });


        });


        var zoom = d3.behavior.zoom()
        .on("zoom", function () {
            g.attr("transform", "translate(" +
            d3.event.translate.join(",") + ")scale(" + d3.event.scale + ")");
            g.selectAll("path")
            .attr("d", path.projection(projection));
        });

        svg.call(zoom);



        //Timeline


        function timeseries_chart(color) {
            var margin = { top: 5, right: 5, bottom: 40, left: 45 },
                width = 960 - margin.left - margin.right,
                height = 80;

            var x = d3.time.scale(),
                y = d3.scale.linear(),
                x_label = "X", y_label = "Y",
                brush = d3.svg.brush().x(x).on("brush", _brushmove);

            var get_x = no_op,
                get_y = no_op;

            function timeseries(selection) {
                selection.each(function (d) {
                    x.range([0, width]);
                    y.range([height, 0]);

                    var series = d3.select(this).append("svg").attr("id", "quake-timeseries")
                            .attr("width", width + margin.left + margin.right)
                            .attr("height", height + margin.top + margin.bottom)
                            .append("g").attr("id", "date-brush")
                            .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

                    var x_axis = series.append("g")
                            .attr("class", "x axis")
                            .attr("transform", "translate(0," + height + ")");

                    var y_axis = series.append("g")
                            .attr("class", "y axis");

                    x_axis.append("text")
                        .attr("class", "label")
                        .attr("x", width)
                        .attr("y", 30)
                        .style("text-anchor", "end")
                        .text(x_label);

                    y_axis.append("text")
                        .attr("class", "label")
                        .attr("transform", "rotate(-90)")
                        .attr("y", -40)
                        .attr("dy", ".71em")
                        .style("text-anchor", "end")
                        .text(y_label);

                    series.append("clipPath")
                        .attr("id", "clip")
                        .append("rect")
                        .attr("width", width - 1)
                        .attr("height", height - .25)
                        .attr("transform", "translate(1,0)");

                    series.append("g")
                            .attr("class", "brush")
                            .call(brush)
                            .selectAll("rect")
                            .attr("height", height)
                            .style("stroke-width", 1)
                            .style("stroke", color[color.length - 1])
                            .style("fill", color[2])
                            .attr("opacity", 0.4);

                    x.domain(d3.extent(d, get_x));
                    x_axis.call(d3.svg.axis().scale(x).orient("bottom"));

                    y.domain(d3.extent(d, get_y));
                    y_axis.call(d3.svg.axis().scale(y).orient("left"));

                    series.append("g").attr("class", "timeseries")
                        .attr("clip-path", "url(#clip)")
                        .selectAll("circle")
                        .data(d).enter()
                        .append("circle")
                        .style("stroke", color[color.length - 2])
                        .style("stroke-width", .5)
                        .style("fill", color[color.length - 1])
                        .attr("opacity", .4)
                        .attr("r", 2)
                        .attr("transform", function (d) {
                            return "translate(" + x(get_x(d)) + "," + y(get_y(d)) + ")";
                        });
                });
            }

            timeseries.x = function (accessor) {
                if (!arguments.length) return get_x;
                get_x = accessor;
                return timeseries;
            };

            timeseries.y = function (accessor) {
                if (!arguments.length) return get_y;
                get_y = accessor;
                return timeseries;
            };

            timeseries.xLabel = function (label) {
                if (!arguments.length) return x_label;
                x_label = label;
                return timeseries;
            }

            timeseries.yLabel = function (label) {
                if (!arguments.length) return y_label;
                y_label = label;
                return timeseries;
            }

            timeseries.brushmove = function (cb) {
                if (!arguments.length) return brushmove;
                brushmove = cb;
                return timeseries;
            };

            function _brushmove() {
                brushmove.call(null, brush);
            }

            function no_op() {}

            return timeseries;
        }
        }());



        </script>
</body>

