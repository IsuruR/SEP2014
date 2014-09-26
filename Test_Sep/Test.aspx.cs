using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

public partial class Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbl.SelectedItem.Value == "tk")
        {
            string script = "<script type=\"text/javascript\" src=\"Kylie.js\"> </script>";
            ClientScript.RegisterStartupScript(this.GetType(), "kylie", script);
        }
        else if (rbl.SelectedItem.Value == "tr")
        {
            string script = "<script type=\"text/javascript\" src=\"Ricky.js\"> </script>";
            ClientScript.RegisterStartupScript(this.GetType(), "ricky", script);
        }
        else if (rbl.SelectedItem.Value == "tt")
        {
            string script = "<script type=\"text/javascript\" src=\"Tom.js\"> </script>";
            ClientScript.RegisterStartupScript(this.GetType(), "tom", script);
        }
        else if (rbl.SelectedItem.Value == "tw")
        {
            string script = "<script type=\"text/javascript\" src=\"Will.js\"> </script>";
            ClientScript.RegisterStartupScript(this.GetType(), "will", script);
        }
        else
        {
            
        }
    }
}