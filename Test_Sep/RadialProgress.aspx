<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RadialProgress.aspx.cs" Inherits="RadialProgress" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script src="js/vendor/jquery-1.8.3.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=EmulateIE9" />
    <script type="text/javascript" src="http://d3js.org/d3.v3.min.js"></script>
    <script type="text/javascript" src="scripts/radialProgress.js"></script>
    <script type="text/javascript" src="js/radial.js"></script>
 
    <link href="styles/styles.css" rel="stylesheet" media="screen" />
    <script>











        $(function () {
            var urlVal;
            var radio = "<%Response.Write(RadioButtonList1.SelectedValue.ToString());%>";
            if (radio == "Twitter Popularity")
                var urlVal = "/TestWebService.asmx/getTwitterPopularity"
            else if (radio == "Youtube Popularity")
                var urlVal = "/TestWebService.asmx/getYoutubePopularity";
            else if (radio == "Overall Popularity")
                var urlVal = "/TestWebService.asmx/getOverallPopularity";

            $.ajax({
                type: "POST",
                url: urlVal,
                data: "{round:5}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                error: function (xhr, status, error) {
                    $("#result").html("Sorry there is an error: " + xhr.responseText);
                },
                success: function (responseData) {
                    start(responseData.d);
                    document.getElementById("result").innerHTML = responseData.d;
                }
            });
        });

    </script>
    <style type="text/css">
        #test .arc2 {
            stroke-weight: 0.1;
            fill: #3660b0;
        }

        #outer {
            background: #FFFFFF;
            border-radius: 5px;
            color: #000;
        }

      


        .selectedRadial {
            border-radius: 3px;
            background: #f4f4f4;
            color: #000;
            box-shadow: 0 1px 5px rgba(0,0,0,0.4);
            -moz-box-shadow: 0 1px 5px rgba(0,0,0,0.4);
            border: 1px solid rgba(200,200,200,0.85);
        }

        .radial {
            border-radius: 3px;
            background: #FFFFFF;
            color: #000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="text-align:center">
        <h1>Popularities of Top 12</h1>
        <div title="Choose Filter Type" style="text-align:center">
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" BorderColor="Black" Font-Bold="True" Font-Size="X-Large">
                <asp:ListItem Text="Twitter Popularity" Selected="True">Twitter Popularity</asp:ListItem>
                <asp:ListItem>Youtube Popularity</asp:ListItem>
                <asp:ListItem>Overall Popularity</asp:ListItem>
            </asp:RadioButtonList>
        </div>
    </form>
    <div id="result" style="text-align:center">
        

    </div>
    <div id='outer' style="width: 1000px; height: 800px; margin: 0px auto; margin-top: 20px; padding: 10px">
        <div id="main" style="width: 1000px; height: 200px; margin: 0px auto;text-align:center;">

            <div id="div1" style="text-align: center; background-color: #FFFFFF;border-width:thick;border-color:#000; display: block; float: left; width: 33%"><h3>Jermain Jackman</h3></div>
            <div id="div2" style="text-align: center; background-color: #FFFFFF;border-width:thick;border-color:#000; display: block; float: left; width: 33%"><h3>Jamie Jamson</h3></div>
            <div id="div3" style="text-align: center; background-color: #FFFFFF;border-width:thin;border-color:#000; display: block; float: left; width: 33%"><h3>Sally Barker</h3></div>
            <div id="div4" style="text-align: center; background-color: #FFFFFF;border-width:thin;border-color:#000; display: block; float: left; width: 33%"><h3>Christina Marie</h3></div>
            <div id="div5" style="text-align: center; background-color: #FFFFFF;border-width:thin;border-color:#000; display: block; float: left; width: 33%"><h3>Lee Glasson</h3></div>
            <div id="div6" style="text-align: center; background-color: #FFFFFF;border-width:thin;border-color:#000; display: block; float: left; width: 33%"><h3>Chris Royal</h3></div>
            <div id="div7" style="text-align: center; background-color: #FFFFFF;border-width:thin;border-color:#000; display: block; float: left; width: 33%"><h3>Bizzie Dixon</h3></div>
            <div id="div8" style="text-align: center; background-color: #FFFFFF;border-width:thin;border-color:#000; display: block; float: left; width: 33%"><h3>Sophie May</h3></div>
            <div id="div9" style="text-align: center; background-color: #FFFFFF;border-width:thin;border-color:#000; display: block; float: left; width: 33%"><h3>Emily Adams</h3></div>
            <div id="div10" style="text-align: center; background-color: #FFFFFF;border-width:thin;border-color:#000; display: block; float: left; width: 33%"><h3>Georgia</h3></div>
            <div id="div11" style="text-align: center; background-color: #FFFFFF;border-width:thin;border-color:#000; display: block; float: left; width: 33%"><h3>Iesher Houghton</h3></div>
            <div id="div12" style="text-align: center; background-color: #FFFFFF;border-width:thin;border-color:#000; display: block; float: left; width: 33%"><h3>Rachel O'Connor</h3></div>
        </div>
    </div>


        




    <script id="id1" type="text/javascript">

        var div1 = d3.select(document.getElementById('div1'));
        var div2 = d3.select(document.getElementById('div2'));
        var div3 = d3.select(document.getElementById('div3'));
        var div4 = d3.select(document.getElementById('div4'));
        var div5 = d3.select(document.getElementById('div'));
        var div6 = d3.select(document.getElementById('div6'));
        var div7 = d3.select(document.getElementById('div7'));
        var div8 = d3.select(document.getElementById('div8'));
        var div9 = d3.select(document.getElementById('div9'));
        var div10 = d3.select(document.getElementById('div10'));
        var div11 = d3.select(document.getElementById('div11'));
        var div12 = d3.select(document.getElementById('div12'));


        function onClick1() {
            deselect();
            div1.attr("class", "selectedRadial");
        }

        function onClick2() {
            deselect();
            div2.attr("class", "selectedRadial");
        }

        function onClick3() {
            deselect();
            div3.attr("class", "selectedRadial");
        }
        function onClick4() {
            deselect();
            div4.attr("class", "selectedRadial");
        }
        function onClick5() {
            deselect();
            div5.attr("class", "selectedRadial");
        }

        function onClick6() {
            deselect();
            div6.attr("class", "selectedRadial");
        }

        function onClick7() {
            deselect();
            div7.attr("class", "selectedRadial");
        }
        function onClick8() {
            deselect();
            div8.attr("class", "selectedRadial");
        }
        function onClick9() {
            deselect();
            div9.attr("class", "selectedRadial");
        }

        function onClick10() {
            deselect();
            div10.attr("class", "selectedRadial");
        }

        function onClick11() {
            deselect();
            div11.attr("class", "selectedRadial");
        }
        function onClick12() {
            deselect();
            div12.attr("class", "selectedRadial");
        }
        function deselect() {
            div1.attr("class", "radial");
            div2.attr("class", "radial");
            div3.attr("class", "radial");
            div4.attr("class", "radial");
            div5.attr("class", "radial");
            div6.attr("class", "radial");
            div7.attr("class", "radial");
            div8.attr("class", "radial");
            div9.attr("class", "radial");
            div10.attr("class", "radial");
            div11.attr("class", "radial");
            div12.attr("class", "radial");
        }



        //var divid_1 = d3.select(document.getElementById('div1'));
        //var d1 = document.getElementById('div1');
        function start(response) {
            var d = document.getElementById('main');
            var twitterPopList = JSON.parse(response);
            var i = 0, j;

            ///////

            //////


            while (i < 12) {
                var rp1 = radialProgress(document.getElementById('div' + (i + 1)))
                   .onClick(innerFx(i))
                   .diameter(150)
                   .value(twitterPopList[i])
                   .render();

                i++;
            }
            //for (i = 0; i < twitterPopList.length; i++) {
            //}

        }


        function method(res) {

        }

        function innerF(x) {
            var click = "onClick" + (x + 1);
        }
        function innerFx(x) {
            if (x == 0)
                return onClick1;
            else if (x == 1)
                return onClick2;
            else if (x == 2)
                return onClick3;
            else if (x == 3)
                return onClick4;
            else if (x == 4)
                return onClick5;
            else if (x == 5)
                return onClick6;
            else if (x == 6)
                return onClick7;
            else if (x == 7)
                return onClick8;
            else if (x == 8)
                return onClick9;
            else if (x == 9)
                return onClick10;
            else if (x == 10)
                return onClick11;
            else if (x == 11)
                return onClick12;

        }

    </script>


</body>
</html>
