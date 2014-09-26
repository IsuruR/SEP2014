<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgetPwd.aspx.cs" Inherits="ForgetPwd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Visual Analytic System-BBC One</title>
        <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width"/>

    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/bootstrap-responsive.min.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/main.css"/>
     <link href="css/circle-menu.css" rel="stylesheet" />


  
</head>

<body>
<div class="nabar navbar-inverse navbar-fixed-top" >
    <div class="navbar">
        <div class="navbar-inner">
            <div class="container-fluid">
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <span class="brand">The Voice UK</span>

                <div class="nav-collapse collapse">

                    

                    <ul class="nav pull-right settings">
                       
                        <li><a href="Login.aspx" class="tip icon logout" data-original-title="Back" data-placement="bottom"><i
                           class="icon-large icon-off"></i></a></li>
                    </ul>

                    <ul class="nav pull-right settings">
                        <li class="divider-vertical"></li>
                    </ul>

                    <p class="navbar-text pull-right">
                        <asp:Label ID="lblWelcome" runat="server" Text="Reset Your Password"></asp:Label>
                    </p>

                    <ul class="nav pull-right settings">
                        <li class="divider-vertical"></li>
                    </ul>

                

                </div>
                <!--/.nav-collapse -->
            </div>
        </div>
    </div>
</div>

    
    <form id="form1" runat="server">
      
<div class="row-fluid">
    <!--/.well -->
    <!--/span3-->
    <div style="display: block;margin-left:0%" >

        <div class="well" >
           
   <div style="margin-left: 40px;text-align:center">
        <asp:Label ID="Label1" runat="server" Text="Your Email"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtEmail" runat="server" Width="365px"></asp:TextBox>
          <asp:RequiredFieldValidator ID="EmailRequiredFieldValidator" runat="server"
                     ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red"
                     ErrorMessage="Email Required" SetFocusOnError="True">
          </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="EmailRegularExpressionValidator" runat="server"
                       ForeColor="Red" ControlToValidate="txtEmail" Display="Dynamic"
                       ErrorMessage="Provide Valid Email Address"
                               ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                    </asp:RegularExpressionValidator>
        <br />
        &nbsp;<asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
        <br />
    <asp:Label ID="lbltxt" runat="server" Text="" Visible="false"  BackColor="#F6CED8" ForeColor="#DF013A" ></asp:Label>
    </div>
           
        </div>

    </div>

    <!--/span9-->

</div>
<!--/row-fluid-->

<hr>

<footer align="center">
    <p>Copyright &copy; 2014 <strong>BBC One</strong></p>
</footer>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>window.jQuery || document.write('<script src="js/vendor/jquery-1.8.3.min.js"><\/script>')</script>
<script src="js/vendor/bootstrap.min.js"></script>
<script>
    // enable tooltips
    $(".tip").tooltip();
</script>


    <div>
    </div>
    </form>
</body>
</html>
