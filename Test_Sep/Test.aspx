<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>

body {
  font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
  margin: auto;
  padding-top: 40px;
  position: relative;
  width: 960px;
}

button {
  position: absolute;
  right: 10px;
  top: 10px;
}

.bullet { font: 10px sans-serif; }
.bullet .marker { stroke: #000; stroke-width: 2px; }
.bullet .tick line { stroke: #666; stroke-width: .5px; }
.bullet .range.s0 { fill: #ddd; }
.bullet .range.s1 { fill: #ccc; }
.bullet .range.s2 { fill: #bbb; }
.bullet .range.s3 { fill: #aaa; }
.bullet .range.s4 { fill: #999; }
.bullet .measure.s0 { fill: teal; }
.bullet .measure.s1 { fill: #33CCFF; }
.bullet .title { font-size: 14px; font-weight: bold; }
.bullet .subtitle { fill: #666; }

</style>
<script src="http://d3js.org/d3.v3.min.js"></script>
<script src="TeamPerformance.js"></script>
</head>

<body>
    <div id="div1" style="font-size:24px; text-decoration:underline; text-align: center;">Candidate Performance</div>

    

    <div id="div2" style="text-align:center">
        <br />
        <br />

        <form runat="server">
            <asp:RadioButtonList ID="rbl" class="radio" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" RepeatDirection="Horizontal">
                <asp:ListItem value="tk">Team Kylie</asp:ListItem>
                <asp:ListItem value="tr">Team Ricky</asp:ListItem>
                <asp:ListItem value="tt">Team Tom</asp:ListItem>
                <asp:ListItem Value="tw">Team Will</asp:ListItem>
             </asp:RadioButtonList>
         </form>

        <br />
        <br />
    </div>

    <div id="div4" style="text-align:center">
        <img src="performance.png" />
    </div>

    <div id="div3"></div>
    
</body>
</html>
