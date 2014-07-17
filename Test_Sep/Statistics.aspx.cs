using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class js_Statistics : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string script = "<script type=\"text/javascript\" src=\"js/barchart1.js\"> </script>";
        ClientScript.RegisterStartupScript(this.GetType(), "bubble", script);
    }
}