using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PositiveNegative : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string script1 = "<script type=\"text/javascript\" src=\"positive.js\"> </script>";
        ClientScript.RegisterStartupScript(this.GetType(), "pf", script1);

        //string script2 = "<script type=\"text/javascript\" src=\"negative.js\"> </script>";
        //ClientScript.RegisterStartupScript(this.GetType(), "nf", script2);
    }
}