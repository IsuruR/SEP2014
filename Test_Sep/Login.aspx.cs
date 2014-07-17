using System;
using System.Collections.Generic;
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
        

        if (pwd.Equals("admin") && user.Equals("admin"))
        {
            Response.Redirect("storyPage1.aspx");
        }
        else if (pwd.Equals("umidu") && user.Equals("12345"))
        {
            Response.Redirect("storyPage1.aspx");
        }

        else
        {
            Response.Write("<script  type=\"text/javascript\">alert('Username and password not match. Try again!');</script>");
            
        }
    }
}