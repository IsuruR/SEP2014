using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void LoginClick(object sender, EventArgs e)
    {
     
    }
    protected void Unnamed_Click(object sender, EventArgs e)
    {
        String pwd = Request["password"];
        String user = Request["username"];
        String[] user1 = { "admin", "admin" };
        String[] user2 = { "umidu", "12345" };
        

        //if (pwd.Equals("admin") && user.Equals("admin"))
        //{
        //    Response.Redirect("storyPage1.aspx");
        //}
        //else if (pwd.Equals("umidu") && user.Equals("12345"))
        //{
        //    Response.Redirect("storyPage1.aspx");
        //}

        //else
        //{
        //    Response.Write("<script  type=\"text/javascript\">alert('Username and password not match. Try again!');</script>");
            
        //}

        if (isAuthenticated(user,pwd))
        {
            Response.Redirect("MainDashboard.aspx");

        }
        else
        {
            Panel2.Visible = true;
            Session.Clear();
        }   
    }


    private bool isAuthenticated(string username, string password)
    {
        SqlConnection conn;   //declare the sql connection
        conn = DB_Connect.GetConnection(); //using DB_Connect class, we make the connection.
        conn.Open();

        SqlCommand NewCmd = conn.CreateCommand();
        NewCmd.CommandType = CommandType.Text;
        NewCmd.CommandText = "select * from dbo.users where  username = '" + username + "' and Password = '" + password + "'";

        SqlDataReader dr = NewCmd.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                UserInfo ui = new UserInfo(dr["userName"].ToString(), dr["Password"].ToString(), dr["email"].ToString());

                Session["loggedUser"] = ui;
                Session["uname"] = ui.UserName;
                Session["email"] = ui.email;
            }
            NewCmd.Dispose();
            conn.Close();
            return true;
        }

        NewCmd.Dispose();
        conn.Close();
        return false;
    }
}