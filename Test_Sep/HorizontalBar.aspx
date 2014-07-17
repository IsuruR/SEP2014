<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="HorizontalBar.aspx.cs" Inherits="HorizontalBar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style >
        html, body {
            width:100%;
            height:100%;
               
        }
        #leftcolumn { width: 45%; border: 1px solid red; float: left}
        #rightcolumn {
            width: 45%;
            border: 1px solid red;
            float: left;
            margin-left:5%;
        }
        .clear { clear: both;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script runat="server">

    protected int getCandOne_likes()
    {
        int likecount=0;
        //int candid = Convert.ToInt16(DropDownList1.SelectedValue.ToString());
        string candid = DropDownList1.SelectedValue.ToString();
        System.Data.SqlClient.SqlConnection connection = null;
        try
        {
            string conn = ConfigurationManager.ConnectionStrings["VisualAnalyticConnectionString"].ConnectionString;
            connection = new System.Data.SqlClient.SqlConnection(conn);
            connection.Open();
            String str = "SELECT * from popularity where candid= '" + candid + "' ";

            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(str, connection);
            System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    likecount =Convert.ToInt16( reader["youtubeLikes"].ToString());
                }
                cmd.Dispose();
                connection.Close();
            }
            cmd.Dispose();
            connection.Close();
            //Label4.Text = c;
        }
        catch
        {
            //Label4.Text = "error";
        }
        finally
        {
            connection.Close();
        }
        return likecount/20;
    }
    protected int getCandTwo_likes()
    {
        int likecount = 0;
        //int candid = Convert.ToInt16(DropDownList2.SelectedValue.ToString());
        string candid = DropDownList2.SelectedValue.ToString();
        
        System.Data.SqlClient.SqlConnection connection = null;
        try
        {
            string conn = ConfigurationManager.ConnectionStrings["VisualAnalyticConnectionString"].ConnectionString;
            connection = new System.Data.SqlClient.SqlConnection(conn);
            connection.Open();
            String str = "SELECT * from popularity where candid= '" + candid + "' ";

            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(str, connection);
            System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    likecount = Convert.ToInt16(reader["youtubeLikes"].ToString());
                }
                cmd.Dispose();
                connection.Close();
            }
            cmd.Dispose();
            connection.Close();
            //Label4.Text = c;
        }
        catch
        {
            //Label4.Text = "error";
        }
        finally
        {
            connection.Close();
        }
        return likecount/20;
    }
    protected int getCandOne_dislikes()
    {
        int dislikecount = 0;
        //int candid = Convert.ToInt16(DropDownList1.SelectedValue.ToString());
        string candid = DropDownList1.SelectedValue.ToString();
        
        System.Data.SqlClient.SqlConnection connection = null;
        try
        {
            string conn = ConfigurationManager.ConnectionStrings["VisualAnalyticConnectionString"].ConnectionString;
            connection = new System.Data.SqlClient.SqlConnection(conn);
            connection.Open();
            String str = "SELECT * from popularity where candid= '" + candid + "' ";

            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(str, connection);
            System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    dislikecount = Convert.ToInt16(reader["youtubeDislikes"].ToString());
                }
                cmd.Dispose();
                connection.Close();
            }
            cmd.Dispose();
            connection.Close();
            //Label4.Text = c;
        }
        catch
        {
            //Label4.Text = "error";
        }
        finally
        {
            connection.Close();
        }
        return dislikecount/20;
    }

    protected int getCandTwo_dislikes()
    {
        int dislikecount = 0;
        //int candid = Convert.ToInt16(DropDownList2.SelectedValue.ToString());
        string candid = DropDownList2.SelectedValue.ToString();
        
        System.Data.SqlClient.SqlConnection connection = null;
        try
        {
            string conn = ConfigurationManager.ConnectionStrings["VisualAnalyticConnectionString"].ConnectionString;
            connection = new System.Data.SqlClient.SqlConnection(conn);
            connection.Open();
            String str = "SELECT * from popularity where candid= '" + candid + "' ";

            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(str, connection);
            System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    dislikecount = Convert.ToInt16(reader["youtubeDislikes"].ToString());
                }
                cmd.Dispose();
                connection.Close();
            }
            cmd.Dispose();
            connection.Close();
            //Label4.Text = c;
        }
        catch
        {
            //Label4.Text = "error";
        }
        finally
        {
            connection.Close();
        }
        return dislikecount/20;
    }
    
    protected int getCandOne_tweets()
    {
        int tweetcount = 0;
        //int candid = Convert.ToInt16(DropDownList1.SelectedValue.ToString());
        string candid = DropDownList1.SelectedValue.ToString();
        
        System.Data.SqlClient.SqlConnection connection = null;
        try
        {
            string conn = ConfigurationManager.ConnectionStrings["VisualAnalyticConnectionString"].ConnectionString;
            connection = new System.Data.SqlClient.SqlConnection(conn);
            connection.Open();
            String str = "SELECT * from popularity where candid= '" + candid + "' ";

            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(str, connection);
            System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    tweetcount = Convert.ToInt16(reader["tweets"].ToString());
                }
                cmd.Dispose();
                connection.Close();
            }
            cmd.Dispose();
            connection.Close();
            //Label4.Text = c;
        }
        catch
        {
            //Label4.Text = "error";
        }
        finally
        {
            connection.Close();
        }
        return tweetcount/20;
    }
    protected int getCandTwo_tweets()
    {
        int tweetcount = 0;
        //int candid = Convert.ToInt16(DropDownList2.SelectedValue.ToString());
        string candid = DropDownList2.SelectedValue.ToString();
        
        System.Data.SqlClient.SqlConnection connection = null;
        try
        {
            string conn = ConfigurationManager.ConnectionStrings["VisualAnalyticConnectionString"].ConnectionString;
            connection = new System.Data.SqlClient.SqlConnection(conn);
            connection.Open();
            String str = "SELECT * from popularity where candid= '" + candid + "' ";

            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(str, connection);
            System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    tweetcount = Convert.ToInt16(reader["tweets"].ToString());
                }
                cmd.Dispose();
                connection.Close();
            }
            cmd.Dispose();
            connection.Close();
            //Label4.Text = c;
        }
        catch
        {
            //Label4.Text = "error";
        }
        finally
        {
            connection.Close();
        }
        return tweetcount/20;
    }

    protected int getCandOne_fb()
    {
        int fbcount = 0;
        //int candid = Convert.ToInt16(DropDownList2.SelectedValue.ToString());
        string candid = DropDownList2.SelectedValue.ToString();

        System.Data.SqlClient.SqlConnection connection = null;
        try
        {
            string conn = ConfigurationManager.ConnectionStrings["VisualAnalyticConnectionString"].ConnectionString;
            connection = new System.Data.SqlClient.SqlConnection(conn);
            connection.Open();
            String str = "SELECT * from popularity where candid= '" + candid + "' ";

            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(str, connection);
            System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    fbcount = Convert.ToInt16(reader["fblikes"].ToString());
                }
                cmd.Dispose();
                connection.Close();
            }
            cmd.Dispose();
            connection.Close();
            //Label4.Text = c;
        }
        catch
        {
            //Label4.Text = "error";
        }
        finally
        {
            connection.Close();
        }
        return fbcount / 20;
    }
    protected int getCandTwo_fb()
    {
        int fbcount = 0;
        //int candid = Convert.ToInt16(DropDownList2.SelectedValue.ToString());
        string candid = DropDownList2.SelectedValue.ToString();

        System.Data.SqlClient.SqlConnection connection = null;
        try
        {
            string conn = ConfigurationManager.ConnectionStrings["VisualAnalyticConnectionString"].ConnectionString;
            connection = new System.Data.SqlClient.SqlConnection(conn);
            connection.Open();
            String str = "SELECT * from popularity where candid= '" + candid + "' ";

            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(str, connection);
            System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    fbcount = Convert.ToInt16(reader["fblikes"].ToString());
                }
                cmd.Dispose();
                connection.Close();
            }
            cmd.Dispose();
            connection.Close();
            //Label4.Text = c;
        }
        catch
        {
            //Label4.Text = "error";
        }
        finally
        {
            connection.Close();
        }
        return fbcount / 20;
    }
</script>

    <%--<form id="form1" runat="server">--%>
           <div style="width: 100%;">
               <br />
               <br />
               <div style="width: 33%; text-align:left;">
         <asp:Label ID="Label6" runat="server" Text="Compare Candidates" Font-Size="XX-Large" Font-Bold="True" Font-Italic="True" style="text-align: left"></asp:Label>
        </div>
                   
                   <div id="Div1" style="float: left; width: 33%; text-align: center;margin-top:50px">
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="candid" DataValueField="candid" Height="29px" Width="246px" AutoPostBack="True">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="Data Source=(local);Initial Catalog=VisualAnalytic;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [candid] FROM [popularity]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=(local);Initial Catalog=VisualAnalytic;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [candid] FROM [likes]"></asp:SqlDataSource>
        </div>
     <div id="Div2" style="float: left; width: 33%; text-align: center;margin-top:50px">
         <asp:Label ID="Label3" runat="server" Text="Candidates" Font-Size="X-Large" Font-Bold="True"></asp:Label></div>
     <div id="Div3" style="float: left; width: 33%; text-align: center;margin-top:50px">
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="candid" DataValueField="candid" Height="29px" Width="246px" AutoPostBack="True"></asp:DropDownList>
        </div>
     <br style="clear: left;" />
    </div>
<br />

    <div id="container" style="width: 100%;">
     <div id="left" style="border: 2px solid #020202; float: left; width: 33%;margin-top:20px">
        <div id="likes_conOne" style="width:<% =getCandOne_likes()%>%;height:20px;border:1px solid #020202; background:#020202; float: right; "></div>
        </div>
     <div id="middle" style="float: left; width:25%; text-align: center; margin-left: 29px;margin-top:20px">
         <% =getCandOne_likes()%><asp:Label ID="Label2" runat="server" Text="       Youtube Likes      " Font-Bold="True" Font-Size="Larger"></asp:Label>
         <% =getCandTwo_likes()%>
     </div>
     <div id="right" style="border: 2px solid #020202;float: left; width: 33%;margin-top:20px">
        <div id="likes_contwo" style="width:<% =getCandTwo_likes()%>%;height:20px;background:#020202"></div>
        </div>
     <br style="clear: left;" />
    </div>

        <div>

        </div>

     <div id="Div4" style="width: 100%;">
     <div id="Div5" style="border: 2px solid #020202; float: left; width: 33%;margin-top:20px;">
        <div id="Div6" style="width:<% =getCandOne_dislikes()%>%;height:20px;border:1px solid #020202; background:#020202; float: right; "></div>
        </div>
     <div id="Div7" style="float: left; width:25%; text-align: center; margin-left: 29px;margin-top:20px">
         <% =getCandOne_dislikes()%><asp:Label ID="Label1" runat="server" Text="    Youtube Dislikes    " Font-Bold="True" Font-Size="Larger"></asp:Label>
         <% =getCandTwo_dislikes()%>
     </div>
     <div id="Div8" style="border: 2px solid #020202;float: left; width: 33%;margin-top:20px">
        <div id="Div9" style="width:<% =getCandTwo_dislikes()%>%;height:20px;background:#020202"></div>
        </div>
     <br style="clear: left;" />
    </div>

        <div id="Div10" style="width: 100%;">
     <div id="Div11" style="border: 2px solid #020202; float: left; width: 33%;margin-top:20px">
        <div id="Div12" style="width:<% =getCandOne_tweets()%>%;height:20px;border:1px solid #020202; background:#020202; float: right; "></div>
        </div>
     <div id="Div13" style="float: left; width:25%; text-align: center; margin-left: 29px;margin-top:20px">
         <% =getCandOne_tweets()%><asp:Label ID="Label4" runat="server" Text="          Tweets          " Font-Bold="True" Font-Size="Larger"></asp:Label>
         <% =getCandTwo_tweets()%>
     </div>
     <div id="Div14" style="border: 2px solid #020202;float: left; width: 33%;margin-top:20px">
        <div id="Div15" style="width:<% =getCandTwo_tweets()%>%;height:20px;background:#020202"></div>
        </div>
     <br style="clear: left;" />
    </div>


     <div id="Div16" style="width: 100%;">
     <div id="Div17" style="border: 2px solid #020202; float: left; width: 33%;margin-top:20px">
        <div id="Div18" style="width:<% =getCandOne_fb()%>%;height:20px;border:1px solid #020202; background:#020202; float: right; "></div>
        </div>
     <div id="Div19" style="float: left; width:25%; text-align: center; margin-left: 29px;margin-top:20px">
         <% =getCandOne_fb()%><asp:Label ID="Label5" runat="server" Text="     Facebook Likes     " Font-Bold="True" Font-Size="Larger"></asp:Label>
         <% =getCandTwo_fb()%>
     </div>
     <div id="Div20" style="border: 2px solid #020202;float: left; width: 33%;margin-top:20px">
        <div id="Div21" style="width:<% =getCandTwo_fb()%>%;height:20px;background:#020202"></div>
        </div>
     <br style="clear: left;" />
    </div>

       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VisualAnalyticConnectionString %>" SelectCommand="SELECT * FROM [Persons]"></asp:SqlDataSource>

    </form>
</asp:Content>

