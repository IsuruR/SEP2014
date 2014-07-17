<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/> 
    <meta name="keywords" content="carousel, jquery, responsive, fluid, elastic, resize, thumbnail, slider" />
	<meta name="author" content="Codrops" />
     
	<link rel="shortcut icon" href="../favicon.ico"/>

    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/bootstrap-responsive.min.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/main.css"/>
    <link rel="stylesheet" href="css/collapsibleTree.css" />

 <link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/jquery.flexisel.js"></script>
  
  <script src="http://d3js.org/d3.v3.min.js"></script>


  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div style="display: block;margin-left:0%;color:black"  >
        
        <%--<div class="well" >--%>
        <ul id="flexiselDemo3"> 
             
               <li><asp:ImageButton ID="ImageButton1"  runat="server" ImageUrl="~/images/Small/barChart.png" OnClick="ImageButton1_Click" title="Sortable Bar Charts"/></li>
               <li><asp:ImageButton ID="ImageButton2"  runat="server" ImageUrl="~/images/Small/bowlsWithLiquid.png" OnClick="ImageButton2_Click" title="Bowls with liquid charts"/></li>
               <li><asp:ImageButton ID="ImageButton3"  runat="server" ImageUrl="~/images/Small/bubbleChart.png" OnClick="ImageButton3_Click" title="Bubble Charts"/></li>
               <li><asp:ImageButton ID="ImageButton4"  runat="server" ImageUrl="~/images/Small/bulletChart.png" OnClick="ImageButton4_Click" title="Bullet Charts"/></li>
               <li><asp:ImageButton ID="ImageButton5"  runat="server" ImageUrl="~/images/Small/dendogram.png" OnClick="ImageButton5_Click" title="Tree Layout Charts"/></li>
               <li><asp:ImageButton ID="ImageButton6"  runat="server" ImageUrl="~/images/Small/zoomablePackLayout.png" OnClick="ImageButton6_Click" title="Pack Layout Charts"/></li>
               <li><asp:ImageButton ID="ImageButton7"  runat="server" ImageUrl="~/images/Small/dualScaleBarChart.png" OnClick="ImageButton7_Click" title="Dual scale Bar Charts"/></li>
               <li><asp:ImageButton ID="ImageButton8"  runat="server" ImageUrl="~/images/Small/treeMap.png" OnClick="ImageButton8_Click" title="Tree Map Charts"/></li>
               <li><asp:ImageButton ID="ImageButton9"  runat="server" ImageUrl="~/images/Small/pieChart.png" OnClick="ImageButton9_Click" title="Pie Charts"/></li>
               <li><asp:ImageButton ID="ImageButton10"  runat="server" ImageUrl="~/images/Small/scatterPlot.png" OnClick="ImageButton10_Click" title="Scatter Plot"/></li>
               <li><asp:ImageButton ID="ImageButton11"  runat="server" ImageUrl="~/images/Small/donutChart.png" OnClick="ImageButton11_Click" title="Donut Charts"/></li>
                                                   
        </ul>
 
    <div class="clearout"></div>  
        
			
		

           
          </div>

        <%--</div>--%>

    <div class="row-fluid">

        <div class="span2 pull-left">
           <div class="well" style="background:repeating-linear-gradient(red,black)">
            


               <asp:Panel ID="Panel1" runat="server" Visible="False" Height="1000px" >
                     <asp:RadioButtonList ID="RadioButtonList1" class="radio" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" AutoPostBack="True">
                       <asp:ListItem>Teams</asp:ListItem>
                   </asp:RadioButtonList>
                    </asp:Panel>
                   <asp:Panel ID="Panel2" runat="server" Visible="False" Height="1000px" >
                           <asp:RadioButtonList ID="RadioButtonList2" class="radio"  runat="server" OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged" AutoPostBack="True">
                           <asp:ListItem>Teams &amp; Team Members participated in Blind Auditions</asp:ListItem>
                       </asp:RadioButtonList>
                   </asp:Panel>
                       <asp:Panel ID="Panel3" runat="server" Visible="False" Height="1000px">
                           <asp:RadioButtonList ID="RadioButtonList3" style="color:black" class="radio"  runat="server" OnSelectedIndexChanged="RadioButtonList3_SelectedIndexChanged" AutoPostBack="True">
                               <asp:ListItem>Popularity of each artist in Twitter</asp:ListItem>
                               <asp:ListItem>Popularity of each artist in Facebook</asp:ListItem>
                               <asp:ListItem>Popularity of each artist in Youtube</asp:ListItem>
                           </asp:RadioButtonList>
                       </asp:Panel>

                 <asp:Panel ID="Panel4" runat="server" Visible="False" Height="1000px">
                           <label style="font-size: x-large; color: black;">Select Chart Type</label>
                       </asp:Panel>
                   
                <asp:Panel ID="Panel5" runat="server" Visible="False" Height="1000px">
                           <asp:RadioButtonList ID="RadioButtonList4" class="radio"  runat="server" OnSelectedIndexChanged="RadioButtonList4_SelectedIndexChanged" AutoPostBack="True">
                              
                               <asp:ListItem>Popularity of Artists in Team Kylie in Twitter</asp:ListItem>
                               <asp:ListItem>Popularity of Artists in Team Tom in Twitter</asp:ListItem>
                               <asp:ListItem>Popularity of Artists in Team Will in Twitter</asp:ListItem>
                              
                               <asp:ListItem>Participants in each Rounds</asp:ListItem>
                              
                           </asp:RadioButtonList>
                       </asp:Panel>
                 
                    <asp:Panel ID="Panel6" runat="server" Visible="False" Height="1000px">
                           <asp:RadioButtonList ID="RadioButtonList5" class="radio"  runat="server" OnSelectedIndexChanged="RadioButtonList5_SelectedIndexChanged" AutoPostBack="True">
                              
                             
                              
                               <asp:ListItem>Team Arrangement </asp:ListItem>
                              
                             
                              
                           </asp:RadioButtonList>
                       </asp:Panel>

                <asp:Panel ID="Panel7" runat="server" Visible="False" Height="1000px">
                           <asp:RadioButtonList ID="RadioButtonList6" class="radio"  runat="server" OnSelectedIndexChanged="RadioButtonList6_SelectedIndexChanged" AutoPostBack="True">
                              
                             
                              
                             
                              
                               <asp:ListItem>Positive and Negative Feats</asp:ListItem>
                              
                             
                              
                             
                              
                           </asp:RadioButtonList>
                       </asp:Panel>
            
                 <asp:Panel ID="Panel8" runat="server" Visible="False" Height="1000px">
                           <asp:RadioButtonList ID="RadioButtonList7" class="radio"  runat="server" OnSelectedIndexChanged="RadioButtonList7_SelectedIndexChanged" AutoPostBack="True">
                              
                             
                              
                             
                              
                               <asp:ListItem>Contestants popularity in youtube </asp:ListItem>
                               <asp:ListItem>Number of participants in each rounds</asp:ListItem>
                               <asp:ListItem>Popularity of participants in Team Tom</asp:ListItem>
                              
                             
                              
                             
                              
                           </asp:RadioButtonList>
                       </asp:Panel>


        </div>
         
        </div>


        <div style="display: block;margin-left:15%">
           
               <div id="tree" ></div>
             
               <div id="div1"></div>
        
            
                   
            
               <%--<script type="text/javascript" src="js/bubble.js"></script>
            
                <script type="text/javascript" src="js/tree.js" ></script>   --%>
          
        
        </div>


        <div>  
        </div>
      
    </div>
      <div class="well">
         <label style="color:black">Recently Viewed Charts</label><br />
          <asp:ImageButton ID="bar1"  runat="server" ImageUrl="~/images/History/bar1.png" width="100" Height="100" OnClick="bar1_Click"/>
          <asp:ImageButton ID="bar2"  runat="server" ImageUrl="~/images/History/bar2.png" width="100" Height="100" OnClick="bar2_Click"/>
          <asp:ImageButton ID="bar3"  runat="server" ImageUrl="~/images/History/bar3.png" width="100" Height="100" OnClick="bar3_Click"/>
          <asp:ImageButton ID="bar4"  runat="server" ImageUrl="~/images/History/bar4.png" width="100" Height="100" OnClick="bar4_Click"/>
            <asp:ImageButton ID="bubble1"  runat="server" ImageUrl="~/images/History/bubble1.png" width="100" Height="100" OnClick="bubble1_Click"/>
            <asp:ImageButton ID="bubble2"  runat="server" ImageUrl="~/images/History/bubble2.png" width="100" Height="100" OnClick="bubble2_Click"/>
            <asp:ImageButton ID="bubble3"  runat="server" ImageUrl="~/images/History/bubble3.png" width="100" Height="100" OnClick="bubble3_Click"/>
            <asp:ImageButton ID="packlayout"  runat="server" ImageUrl="~/images/History/packlayout.png" width="100" Height="100" OnClick="packlayout_Click"/>
            <asp:ImageButton ID="treelayout"  runat="server" ImageUrl="~/images/History/treelayout.png" width="100" Height="100" OnClick="treelayout_Click"/>
            <asp:ImageButton ID="treemap"  runat="server" ImageUrl="~/images/History/treemap.png" width="100" Height="100" OnClick="treemap_Click"/>
          <asp:ImageButton ID="dua1Bar"  runat="server" ImageUrl="~/images/History/dual1.png" width="100" Height="100" OnClick="dua1Bar_Click"/>
            <asp:ImageButton ID="donutChart"  runat="server" ImageUrl="~/images/History/donut1.png" width="100" Height="100" OnClick="donutChart_Click"/>


        </div>
    <script>
       $("#flexiselDemo3").flexisel({
        visibleItems: 4,
        animationSpeed: 1200,
        autoPlay: true,
        autoPlaySpeed: 3000,            
        pauseOnHover: true,
        enableResponsiveBreakpoints: true,
        responsiveBreakpoints: { 
            portrait: { 
                changePoint:480,
                visibleItems: 1
            }, 
            landscape: { 
                changePoint:640,
                visibleItems: 2
            },
            tablet: { 
                changePoint:768,
                visibleItems: 3
            }
        }
       });

       
       //$("img").click(function ()
       //{
       //    var id = ($(this).attr('id'));
       //    alert(id);
         
       //})
   </script>
</asp:Content>

