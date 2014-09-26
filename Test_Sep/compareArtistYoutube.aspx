<%@ Page Language="C#" AutoEventWireup="true" CodeFile="compareArtistYoutube.aspx.cs" Inherits="compareArtistYoutube" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
      <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/bootstrap-responsive.min.css"/>
    <style>
 
    img {
-webkit-filter: grayscale(100%);
z-index: -9999999999999999999999999px;
-webkit-transition: all 0.9s ease-in-out;
-moz-transition: all 0.9s ease-in-out;
-o-transition: all 0.9s ease-in-out;
-ms-transition: all 0.9s ease-in-out;
transition: all 0.9s ease-in-out;
}

img:hover {
-webkit-filter: grayscale(0%);
z-index: -9999999999999999999999999px;
-webkit-transition: all 0.9s ease-in-out;
-moz-transition: all 0.9s ease-in-out;
-o-transition: all 0.9s ease-in-out;
-ms-transition: all 0.9s ease-in-out;
transition: all 0.9s ease-in-out;
}

body { font: 12px Arial;}
 
path { 
	stroke: red;
	stroke-width: 2;
	fill: none;
}



.axis line {
	fill: none;
	stroke: grey;
	stroke-width: 1;
	shape-rendering: crispEdges;
}


div.tooltip {
    position: absolute;
    text-align: center;
    width: 60px;
    height: 100px;
    padding: 2px;
    font: 12px sans-serif;
    background: lightsteelblue;
    border: 0px;
    border-radius: 8px;
    pointer-events: none;
}
 
</style>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
    <script src="http://d3js.org/d3.v3.min.js"></script>
    <script type="text/javascript">

        function allowDrop(ev) {
            ev.preventDefault();


        }
        var u;
        function drag(ev) {
            var imgsrc = document.getElementById(ev.target.id).src;
            ev.dataTransfer.setData("Text", imgsrc);
            var data1 = ev.dataTransfer.getData("Text");

            // document.getElementById("btnback").click();
            $.ajax({
                type: "POST",
                dataType: 'json',
                contentType: "application/json; charset=utf-8",
                url: "compareArtistYoutube.aspx/getName",
                data: JSON.stringify({ val: data1 }), // parameters for method
                success: function (set) {

                    u = set.d;
                }, //all Ok
                error: function () { alert('error'); } // some error
            });
            console.log(u);



        }

        function drop(ev) {
            ev.preventDefault();
            //  var data1 = ev.dataTransfer.getData("Text");
            //document.getElementById("artistUrl.ClientID%>").value = data1;
            //  document.getElementById("btn1").click();
            btnclbk(u);


        }
    </script>
</head>
<body>
    
    <form id="form1" runat="server">
  <div style="text-align:center">
      <br />
    <asp:button type="button" id="btn1" runat="server" OnClick="btn1_Click" Text="Overall Popularity" CssClass="btn-success"/>
    <asp:button id="btn2" runat="server" OnClick="btn2_Click" Text="Twitter Popularity" CssClass="btn-success"/>
    <asp:button id="btn3" runat="server" OnClick="btn3_Click" Text="Youtube Popularity" CssClass="btn-success"/>
      <br />
      <br />
   </div>
        <label id="lbl1"></label>
          <div class='alert alert-success'>
                        <p style="text-align:center;font-size:large"> <strong>Drag and Drop Artist Image to the graph to Compare</strong></p>
         </div>
         <br />
    <div style="text-align:center" id="imgdiv" runat ="server">
    
      <br />
        <br />
    </div>
    
      <div id="drop" ondrop="drop(event)" ondragover="allowDrop(event)" ondragend="drop" class="well" style="text-align:center">
         
          
                   
    </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
           
        </asp:ScriptManager>
    </form>

    <script>


        // set up a colour variable
        var color = d3.scale.category10();
       

        var margin = { top: 30, right: 140, bottom: 30, left: 50 },
            width = 700 - margin.left - margin.right,
            height = 270 - margin.top - margin.bottom;

        var topic = d3.select("#drop").append("div").append("text")
                            .attr("x", (width / 2))
                            .attr("y", 0 - (margin.top / 2))
                            .attr("text-anchor", "middle")
                            .style("font-size", "16px")
                            .style("text-decoration", "underline")
                            .text("Youtube Popularity");//need to pass

        var parseDate = d3.time.format("%d/%m/%Y").parse;
        var formatTime = d3.time.format("%e %B");

        var x = d3.time.scale().range([0, width]);
        var y = d3.scale.linear().range([height, 0]);

        var xAxis = d3.svg.axis().scale(x)
            .orient("bottom").ticks(5);

        var yAxis = d3.svg.axis().scale(y)
            .orient("left").ticks(5);

        var valueline = d3.svg.line()
            .x(function (d) { return x(d.date); })
            .y(function (d) { return y(d.followers); });

        var valueline2 = d3.svg.line()
            .x(function (d) { return x(d.date); })
            .y(function (d) { return y(d.likes); });
        //need to add value line for the overrall pop

        //declaring a div tag for tooltips
        var div = d3.select("#drop").append("div")
            .attr("class", "tooltip")
            .style("opacity", 0);

        var svg = d3.select("#drop")
            .append("svg")
                .attr("width", width + margin.left + margin.right)
                .attr("height", height + margin.top + margin.bottom)
            .append("g")
                .attr("transform", "translate(" + margin.left + "," + margin.top + ")");





        // Get the data
        d3.csv("LineCompData2.csv", function (error, data) {
            data.forEach(function (d) {
                d.date = parseDate(d.date);
               // d.followers = +d.followers;
                d.likes = +d.likes;
                //overoll popularity need to add

            });

            //filtering data
            function datafilter(i) {


                var sec = i;
                data1 = data.filter(function (d) {
                    return d.artist == sec;
                });
                return data1;
            }


            // Scale the range of the data
            x.domain(d3.extent(data, function (d) { return d.date; }));
            y.domain([0, d3.max(data, function (d) { return Math.max(d.likes); })]);//need to changes


            // domainkeys = data.map(function (d) { return d.key });


            //var transpose = keyring.map(function (name) {
            //    return {
            //        name: name,
            //        values: data.map(function (d) {
            //            return { date: parseDate(d.date), followers: +d.followers };
            //        })
            //    };
            //});


            var path, path1;
            var label, label1;
            var dot, dot1, lbl;


            btnclbk = function (a) {

                //  lbl = document.getElementById("label1").textContent;
                /*  if (path || dot || label) {
                      path.remove();
                      dot.remove();
                      label.remove();
                      path = null;
                      dot = null;
                      label = null;
                  }*/


                var filtered = datafilter(a)//pass the selected artist name to filter
                // Nest the entries by artist
                var dataNest = d3.nest()
                    .key(function (d) { return d.artist; })
                    .entries(filtered)

                console.log(filtered);


                var artist = svg.selectAll(".artist")
                        .data(dataNest)
                        .enter().append("g")
                        .attr("class", "artist")
                    .attr("class", function (d) {
                        return d.artist
                    });

                path = artist.append("path")		// Add the valueline path.
                       .attr("class", "line")
                       .attr("id", "blueLine")
                       .attr("d", function (d) { return valueline2(d.values); });

                //Scatter Plot Drawing for Twitter graph
                dot = svg.selectAll("dot")
                       .data(filtered)
                       .attr("id", "blueDot")
                       .enter().append("circle")
                       .attr("id", "blueDots")
                       .attr("r", 5)
                       .attr("cx", function (d) { return x(d.date); })
                       .attr("cy", function (d) { return y(d.likes); })
                       .on("mouseover", function (d) {
                           div.transition()
                           .duration(200)
                           .style("opacity", .9);
                           div.html(d.likes + "<br/> likes for "+"<br/>"+d.artist+"'s song")
                           .style("left", (d3.event.pageX) + "px")
                           .style("top", (d3.event.pageY - 28) + "px");
                       })
                       .on("mouseout", function (d) {
                           div.transition()
                           .duration(500)
                           .style("opacity", 0);
                       });

                //getting the name of the artist 
                var name = dataNest.map(function (d) { return d.key });
                console.log(name);
                //text lable for the twitter graph
                label = svg.append("text")
                        .attr("transform", "translate(" + x(filtered[0].date) + "," + y(filtered[0].likes) + ")") //check y axis
                        .attr("dy", ".35em")
                        .attr("text-anchor", "start")
                        .style("fill", "steelblue")
                        .on("click", function () {
                            // Determine if current line is visible
                            var active = blueLine.active ? false : true,
                              newOpacity = active ? 0 : 1;
                            // Hide or show the elements
                            d3.select("#blueLine").style("opacity", newOpacity);
                            d3.select("#blueAxis").style("opacity", newOpacity);
                            d3.select("#dot").style("opacity", newOpacity);
                            // Update whether or not the elements are active
                            blueLine.active = active;
                        })
                        .text("" + name + "");

            }



            //button two

            clbtn = function (a) {


                if (path1 || dot1 || label1) {
                    path1.remove();
                    dot1.remove();
                    label1.remove();
                    path1 = null;
                    dot1 = null;
                    label1 = null;
                }

                else {
                    var filtered = datafilter(a)
                    // Nest the entries by artist
                    var dataNest = d3.nest()
                        .key(function (d) { return d.artist; })
                        .entries(filtered)




                    var artist = svg.selectAll(".artist")
                            .data(dataNest)
                            .enter().append("g")
                            .attr("class", "artist")
                        .attr("class", function (d) {
                            return d.artist
                        });

                    path1 = artist.append("path")		// Add the valueline path.
                           .attr("class", "line")
                           .attr("id", "blueLine")
                           .attr("d", function (d) { return valueline(d.values); });

                    //Scatter Plot Drawing for Twitter graph
                    dot1 = svg.selectAll("dot")
                           .data(filtered)
                           .attr("id", "blueDot")
                           .enter().append("circle")
                           .attr("id", "blueDots")
                           .attr("r", 5)
                           .attr("cx", function (d) { return x(d.date); })
                           .attr("cy", function (d) { return y(d.followers); })
                           .on("mouseover", function (d) {
                               div.transition()
                               .duration(200)
                               .style("opacity", .9);
                               div.html(d.followers + "<br/> Followers")
                               .style("left", (d3.event.pageX) + "px")
                               .style("top", (d3.event.pageY - 28) + "px");
                           })
                           .on("mouseout", function (d) {
                               div.transition()
                               .duration(500)
                               .style("opacity", 0);
                           });

                    //getting the name of the artist 
                    var name = dataNest.map(function (d) { return d.key });
                    console.log(name);
                    //text lable for the twitter graph
                    label1 = svg.append("text")
                            .attr("transform", "translate(" + (width + 6) + "," + y(filtered[0].followers) + ")")
                            .attr("dy", ".35em")
                            .attr("text-anchor", "start")
                            .style("fill", "steelblue")
                            .on("click", function () {
                                // Determine if current line is visible
                                var active = blueLine.active ? false : true,
                                  newOpacity = active ? 0 : 1;
                                // Hide or show the elements
                                d3.select("#blueLine").style("opacity", newOpacity);
                                d3.select("#blueAxis").style("opacity", newOpacity);
                                d3.select("#dot").style("opacity", newOpacity);
                                // Update whether or not the elements are active
                                blueLine.active = active;
                            })
                            .text("" + name + "");
                }
            }

          

            svg.append("g")			// Add the X Axis
                .attr("class", "x axis")
                .attr("transform", "translate(0," + height + ")")
                .call(xAxis);

            svg.append("text")      // text label for the x axis
                .attr("transform",
                        "translate(" + (width / 2) + " ," +
                        (height + margin.bottom) + ")")
                .style("text-anchor", "middle")
                .style("text-decoration", "bold")
                .text("Date");

            svg.append("g")			// Add the Y Axis of Blue Line
                .attr("class", "y axis")
                .attr("id", "blueAxis")
                .call(yAxis);

            svg.append("g")			// Add the Y Axis of Red Line
                .attr("class", "y axis")
                .attr("id", "redAxis")
                .call(yAxis);

            svg.append("text")      // text label for the y axis
                .attr("transform", "rotate(-90)")
                .attr("y", 0 - (margin.left))
                .attr("x", 0 - (height / 2))
                .attr("dy", "1em")
                .style("text-anchor", "middle")
                .text("Value");






            console.log(data.length - 1);
            console.log(data[data.length - 1].likes);
            console.log(data[0].likes);
            console.log(y(data[0].likes));
            console.log(y(data[0].followers));


            console.log(lbl);
        });

    </script>
</body>
</html>