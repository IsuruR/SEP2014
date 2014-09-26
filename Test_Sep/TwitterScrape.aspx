<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TwitterScrape.aspx.cs" Inherits="TwitterScrape" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Twitter Data</title>
    <style type="text/css">
        .twiteer-widget
        {
            width: 280px;
            padding: 10px 10px;
            border:1px solid;
        }
        .twiteer-widget .headr
        {
            float: left;
            width: 100%;
            border-bottom: 1px solid #c2c2c2;
            padding: 0 0 8px 0;
            color: #333333;
            margin: 0 0 4px 0;
        }
        .twiteer-widget .headr img, .follow-btn
        {
            float: left;
        }
        .follow-btn
        {
        	margin-right:45px;
            display: block;
            padding: 3px 0 0 7px;
            float:right;
        }
        .twiteer-widget ul
        {
            font-size: 11px;
            color: #333333;
            list-style-type: none;
            margin: 0;
            padding: 0;
        }
        .twiteer-widget ul li
        {
            border-width: 0 0 0 1px;
            display: inline-block;
            padding: 2px 4px;
            width: 48px;
            overflow: hidden;
        }
        .twiteer-widget span#lblTotalFollowers
        {
        	float:left;width:100%;
            font-family: Arial;
            font-size: 11px;
            color: #333333;
            display: block;
            padding: 0 0 7px 0;
        }
        .twiteer-widget ul li a
        {
            color: gray;
            text-decoration: none;
        }
        .twiteer-widget ul li span
        {
            width: 50px;
            display: block;
            font-family: arial;
            font-size: 10px;
            width: 50px;
            display: none;
        }
        .follow-btn a
        {
            color: #3B5998;
            cursor: pointer;
            text-decoration: none;
            font-family: Arial;
            font-size: 12px;
            font-weight: bold;
            display: block;
            padding: 0 0 7px 0;
        }
    </style>
</head>
<body>
    <div>
    <div style="float: left;" class="twiteer-widget">

        <div class="follow-btn">

            <script>
                !function (d, s, id) {
                    var js, fjs = d.getElementsByTagName(s)[0];

                    if (!d.getElementById(id)) {
                        js = d.createElement(s);
                        js.id = id;
                        js.src = "//platform.twitter.com/widgets.js";
                        fjs.parentNode.insertBefore(js, fjs);
                    }
                }(document, "script", "twitter-wjs");

            </script>

        </div>
        <asp:Label ID="lblTotalFollowers" runat="server"></asp:Label>
        <ul>
            <%=strTwiterFollowers%>
        </ul>
    </div>
    </div>
</body>
</html>
