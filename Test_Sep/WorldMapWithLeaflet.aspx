<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WorldMapWithLeaflet.aspx.cs" Inherits="WorldMapWithLeaflet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Distribution of Twitter Followers around the World</title>
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/bootstrap-responsive.min.css"/>
    <link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.7/leaflet.css" />
    <script src="http://d3js.org/d3.v3.min.js"></script>
    <script src="http://cdn.leafletjs.com/leaflet-0.7/leaflet.js"></script>

    <style>

        .artist
        {
            display: inline-block;
        }

    </style>

    <%--<script src = "//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js">  </script>--%>
     <%--<script>
         $(function () {
             var obj = jQuery.parseJSON('[{"ArtistID":1,"FollowerID":1,"Name":"JAYAH-Paradiso","Location":"UK","Latitude":"51.5","Longitude":"0.1167","Date":"22/03/2014"},{"ArtistID":1,"FollowerID":2,"Name":"Yasmin Dan","Location":"London","Latitude":"51.5072","Longitude":"0.1275","Date":"22/03/2014"},{"ArtistID":1,"FollowerID":3,"Name":"Aaron Senior","Location":"London,UK","Latitude":"51.5072","Longitude":"0.1275","Date":"22/03/2014"},{"ArtistID":2,"FollowerID":1,"Name":"Daniel Sutka","Location":"London","Latitude":"51.5072","Longitude":"0.1275","Date":"22/03/2014"},{"ArtistID":2,"FollowerID":2,"Name":"Colton Brown","Location":"Moore Haven, Florida","Latitude":"26.8333","Longitude":"81.1","Date":"22/03/2014"},{"ArtistID":2,"FollowerID":3,"Name":"Thia Kirby","Location":"England","Latitude":"51.5","Longitude":"0.1167","Date":"22/03/2014"}]');

             var obj = eval(json);
             var newArray = obj.filter(function (el) { return ArtistID = 1 });

             console.log(obj);
             console.log(newArray);
         });
 </script>--%>

</head>

<body>
    <div class='alert alert-success'>
                        <p style="text-align:center;font-size:large"> <strong>Disbution of twitter followers around the world</strong></p>
         </div>
    <div id="map" style="width: 1350px; height: 500px;"></div>

    <script type="text/javascript">

        var round5 = new L.LayerGroup();
        var round6 = new L.LayerGroup();
        var round7 = new L.LayerGroup();

        var osmLink = '<a href="http://openstreetmap.org"></a>',
            thunLink = '<a href="http://thunderforest.com/"></a>';

        var osmUrl = 'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            osmAttrib = osmLink,
            landUrl = 'http://{s}.tile.thunderforest.com/landscape/{z}/{x}/{y}.png',
            thunAttrib = osmLink + thunLink;

        var osmMap = L.tileLayer(osmUrl, { attribution: osmAttrib }),
            landMap = L.tileLayer(landUrl, { attribution: thunAttrib });

        var map = L.map('map', {
            layers: [osmMap] // only add one!
        }).setView([0, 0], 2);

        var baseLayers = {
            "OpenStreetMap": osmMap,
            "Landscape": landMap
        };

        var overlays = {
            "05th April 2014": round7,
            "29th March 2014": round6,
            "22nd March 2014": round5
        };

        L.control.layers(baseLayers, overlays).addTo(map);

        mapLink =
        '<a href="http://openstreetmap.org"></a>';

        L.tileLayer(
        'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: mapLink,
            maxZoom: 18,
        }).addTo(map);

        // Initialize the SVG layer
        map._initPathRoot()

        // We pick up the SVG from the map object
        var svg = d3.select("#map").select("svg"),
        g = svg.append("g");

        start();

        var feature;
        
        function start() {
            d3.json("location.json", function (data) {

                //Add a LatLng object to each item in the dataset
                data.forEach(function (d) {
                        d.LatLng = new L.LatLng(d.Latitude, d.Longitude);
                        //console.log(d.Name + " : " + d.Latitude + "," + d.Longitude);
                })


                feature = g.selectAll("circle")
                    .data(data)
                    .enter().append("circle")
                    .attr("id", function (d) { return d.ArtistID + d.FollowerID; })
                    .style("stroke", "black")
                    .style("opacity", .6)
                    .style("fill", function (d) {
                        if (d.ArtistID == 1) { return "red" }
                        else if (d.ArtistID == 2) { return "blue" }
                        else if (d.ArtistID == 3) { return "purple" }
                        else if (d.ArtistID == 4) { return "lime" }
                        else if (d.ArtistID == 5) { return "yellow" }
                        else if (d.ArtistID == 6) { return "orangered" }
                        else if (d.ArtistID == 7) { return "aqua" }
                        else if (d.ArtistID == 8) { return "maroon" }
                        else if (d.ArtistID == 9) { return "magenta" }
                        else if (d.ArtistID == 10) { return "teal" }
                        else if (d.ArtistID == 11) { return "olive" }
                        else { return "green" }
                        ;
                    })
                    .attr("r", 10);


                map.on("viewreset", update);

                update();

                function update() {
                    feature.attr("transform",
                    function (d) {
                        return "translate(" +
                        map.latLngToLayerPoint(d.LatLng).x + "," +
                        map.latLngToLayerPoint(d.LatLng).y + ")";
                    }
                    )
                }
            });
        }

        var popup = L.popup();

        function onMapClick(e) {
            popup
                .setLatLng(e.latlng)
                .setContent("You clicked the map at " + e.latlng.toString())
                .openOn(map);
        }

        map.on('click', onMapClick);

        function onTestClick(img) {
            console.log("ID: " + img.id);

            var test = g.selectAll("circle")
                    .style("opacity", 0);

            replace(img.id);
        }

        

        var feature2;

        function replace(id) {
            if (id == 1) {
                var red = g.selectAll('circle')
                  .filter(function (d) { return d.ArtistID == 1; })
                  .style('fill', 'red');

                red.style("opacity", .6);
            }
            else if (id == 2) {
                var blue = g.selectAll('circle')
                  .filter(function (d) { return d.ArtistID == 2; })
                  .style('fill', 'blue');

                blue.style("opacity", .6);
            }
            else if (id == 3) {
                var purple = g.selectAll('circle')
                  .filter(function (d) { return d.ArtistID == 3; })
                  .style('fill', 'purple');

                purple.style("opacity", .6);
            }
            else if (id == 4) {
                var lime = g.selectAll('circle')
                  .filter(function (d) { return d.ArtistID == 4; })
                  .style('fill', 'lime');

                lime.style("opacity", .6);
            }
            else if (id == 5) {
                var yellow = g.selectAll('circle')
                  .filter(function (d) { return d.ArtistID == 5; })
                  .style('fill', 'yellow');

                yellow.style("opacity", .6);
            }
            else if (id == 6) {
                var orangered = g.selectAll('circle')
                  .filter(function (d) { return d.ArtistID == 6; })
                  .style('fill', 'orangered');

                orangered.style("opacity", .6);
            }
            else if (id == 7) {
                var aqua = g.selectAll('circle')
                  .filter(function (d) { return d.ArtistID == 7; })
                  .style('fill', 'aqua');

                aqua.style("opacity", .6);
            }
            else if (id == 8) {
                var maroon = g.selectAll('circle')
                  .filter(function (d) { return d.ArtistID == 8; })
                  .style('fill', 'maroon');

                maroon.style("opacity", .6);
            }
            else if (id == 9) {
                var magenta = g.selectAll('circle')
                  .filter(function (d) { return d.ArtistID == 9; })
                  .style('fill', 'magenta');

                magenta.style("opacity", .6);
            }
            else if (id == 10) {
                var teal = g.selectAll('circle')
                  .filter(function (d) { return d.ArtistID == 10; })
                  .style('fill', 'teal');

                teal.style("opacity", .6);
            }
            else if (id == 11) {
                var olive = g.selectAll('circle')
                  .filter(function (d) { return d.ArtistID == 11; })
                  .style('fill', 'olive');

                olive.style("opacity", .6);
            }
            else{
                var green = g.selectAll('circle')
                  .filter(function (d) { return d.ArtistID == 12; })
                  .style('fill', 'green');

                console.log("inside weekly status");

                green.style("opacity", .6);
            }
        }

        //22 / 03 / 2014 == qf
        //29 / 03 / 2014 == sf
        //05 / 04 / 2014 == f

        function onWeeklyClick(img) {
            console.log("ID: " + img.id);

            var test = g.selectAll("circle")
                    .style("opacity", 0);

            weeklyStatus(img.id);
        }

        function weeklyStatus(id) {
            if (id == 50) {
                var qf = g.selectAll('circle')
                      .filter(function (d) { return d.ArtistID == 12; })
                      .filter(function (d) { return d.Date == "22/03/2014"; })
                      .style('fill', 'grey');
                
                qf.style("opacity", .6);
            }
        }
        
    </script>

    <%--Image List--%>
    <div id="artists" style="width:1350px; height:100px; display:inline-flexbox; text-align:center;">
        <img id="1" style="display:flexbox; border:solid; border-color:black;" src="images/Contestants/Team%20Will/Jermain.jpg" alt="Artist" title="Jermain Jackman" width="80" height="100" onclick="onTestClick(this)" />
        <img id="2" style="display:flexbox; border:solid; border-color:black;" src="images/Contestants/Team%20Kylie/Jamie.jpg" alt="Artist" title="Jamie Johnson" width="80" height="100" onclick="onTestClick(this)" />
        <img id="3" style="display:flexbox; border:solid; border-color:black;" src="images/Contestants/Team%20Tom/Sally.jpg" alt="Artist" title="Sally Barker" width="80" height="100" onclick="onTestClick(this)" />
        <img id="4" style="display:flexbox; border:solid; border-color:black;" src="images/Contestants/Team%20Ricky/Christina.jpg" alt="Artist" title="Christina Marie" width="80" height="100" onclick="onTestClick(this)" />
        <img id="5" style="display:flexbox; border:solid; border-color:black;" src="images/Contestants/Team%20Kylie/Lee.jpg" alt="Artist" title="Lee Glasson" width="80" height="100" onclick="onTestClick(this)" />
        <img id="6" style="display:flexbox; border:solid; border-color:black;" src="images/Contestants/Team%20Ricky/Chris.jpg" alt="Artist" title="Chris Royal" width="80" height="100" onclick="onTestClick(this)" />
        <img id="7" style="display:flexbox; border:solid; border-color:black;" src="images/Contestants/Team%20Tom/Bizzi.jpg" alt="Artist" title="Bizzi Dixon" width="80" height="100" onclick="onTestClick(this)" />
        <img id="8" style="display:flexbox; border:solid; border-color:black;" src="images/Contestants/Team%20Will/Sophie.jpg" alt="Artist" title="Sophie May" width="80" height="100" onclick="onTestClick(this)" />
        <img id="9" style="display:flexbox; border:solid; border-color:black;" src="images/Contestants/Team%20Ricky/Emily.jpg" alt="Artist" title="Emily Adams" width="80" height="100" onclick="onTestClick(this)" />
        <img id="10" style="display:flexbox; border:solid; border-color:black;" src="images/Contestants/Team%20Tom/Georgia.jpg" alt="Artist" title="Georgia" width="80" height="100" onclick="onTestClick(this)" />
        <img id="11" style="display:flexbox; border:solid; border-color:black;" src="images/Contestants/Team%20Will/Iesher.jpg" alt="Artist" title="Iesher Haughton" width="80" height="100" onclick="onTestClick(this)" />
        <img id="12" style="display:flexbox; border:solid; border-color:black;" src="images/Contestants/Team%20Kylie/Rachael.jpg" alt="Artist" title="Rachael OConnor" width="80" height="100" onclick="onTestClick(this)" />
    </div>
    <div id="Div1" style="width:1350px; height:100px; display:inline-flexbox; text-align:center;">
        <img id="Img1" style="display:flexbox; border:thin; border-color:black; background-color:red;" width="85" height="10" />
        <img id="Img2" style="display:flexbox; border:thin; border-color:black; background-color:blue;" width="85" height="10" />
        <img id="Img3" style="display:flexbox; border:thin; border-color:black; background-color:purple;" width="85" height="10" />
        <img id="Img4" style="display:flexbox; border:thin; border-color:black; background-color:lime;" width="85" height="10" />
        <img id="Img5" style="display:flexbox; border:thin; border-color:black; background-color:yellow;" width="85" height="10" />
        <img id="Img6" style="display:flexbox; border:thin; border-color:black; background-color:orangered;" width="85" height="10" />
        <img id="Img7" style="display:flexbox; border:thin; border-color:black; background-color:aqua;" width="85" height="10" />
        <img id="Img8" style="display:flexbox; border:thin; border-color:black; background-color:maroon;" width="85" height="10" />
        <img id="Img9" style="display:flexbox; border:thin; border-color:black; background-color:magenta;" width="85" height="10" />
        <img id="Img10" style="display:flexbox; border:thin; border-color:black; background-color:teal;" width="85" height="10" />
        <img id="Img11" style="display:flexbox; border:thin; border-color:black; background-color:olive;" width="85" height="10" />
        <img id="Img12" style="display:flexbox; border:thin; border-color:black; background-color:green;" width="85" height="10" />
    </div>
    <div id="Div2" style="width:1350px; height:0px; display:inline-flexbox; text-align:center;">
        <%--<asp:Image ID="Image1" runat="server" onclick="weeklyStatus(this)" />--%>
        <%--<asp:Button ID="Button1" runat="server" Text="05 April 2014" onclick="weeklyStatus(this)"/>--%>
        <%--<img id="50" style="display:flexbox; border:solid; border-color:black;" src="images/Contestants/Team%20Kylie/Rachael.jpg" alt="Artist" title="Rachael OConnor" width="80" height="100" onclick="onWeeklyClick(this)" />--%>
    </div>
</body>
</html>
