﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WorldMap.aspx.cs" Inherits="WorldMap" %>

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

        svg.call(zoom)
    
        </script>
</body>

