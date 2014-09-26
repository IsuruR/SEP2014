<%@ Page Title="" Language="C#" MasterPageFile="~/LoginMasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link rel="stylesheet" href="css/bootstrap.css"/>
     <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/bootstrap-responsive.min.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/main.css"/>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div  class="well">
         <div class="container">
             <asp:Table ID="Table1" runat="server">
                 <asp:TableRow>
                     <asp:TableCell HorizontalAlign="Center">
                         <asp:Label ID="Label1" runat="server" Text="Visual Analytic System" Font-Size="XX-Large" Font-Bold="true" ForeColor="#0066ff"></asp:Label>
                         <br />
                         <br />
                         <img src="images/b01nnfdd.jpg" width="500" height="400" />
                         <br /> 
                        
                         </asp:TableCell>

                     <asp:TableCell>
                         
	                    <div class=" col-md-offset-7" style="padding-left:400px" >
		                
			            <form >
			              <fieldset>
			                  <legen><a style="font-size:x-large">Login</a></legen>
                              <br/>
                              <br />
			    
                            <div class="control-group">
			                  <!-- Username -->
			                  <label class="control-label"  for="username">Username</label>
			                  <div class="controls">
			                    <input  type="text" name="username" class="form-control" placeholder="username"/>
			                  </div>
			                </div>
			                <div class="control-group">
			                  <!-- Password-->
			                  <label class="control-label" for="password">Password</label>
			                  <div class="controls">
			                    <input type="password" name="password" class="form-control" id="inputPassword" placeholder="Password"/>
			                  </div>
			                </div>
			                <div class="control-group">
                                <asp:Panel ID="Panel2" runat="server" BackColor="#F6CED8" ForeColor="#DF013A" 
                             Visible="False" Width="230px">
                             Invalid username or password</asp:Panel>
                            <br />
			                  <!-- Button -->
			                  <div class="controls" >
			                    <asp:Button id="loginbtn" onclick="Unnamed_Click"  Text="Login" runat="server"/>
                                <a href="ForgetPwd.aspx">Forgot Password?</a>
			                  </div>
			                </div>
			              </fieldset>
			            </form>

		                    </div>
	                     </div>
                   
                     </asp:TableCell>
                 </asp:TableRow>
             </asp:Table>

   
        </div>
    </div>
</asp:Content>

