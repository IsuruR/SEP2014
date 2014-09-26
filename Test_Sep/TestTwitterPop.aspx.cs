using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

public partial class TestTwitterPop : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Popularity p = new Popularity();

      //  List<double> temp = new List<double>();
      ////  temp = p.getOverallPopularity(5);

      //  foreach (double t in temp)
      //  {
      //      MessageBox.Show(t.ToString());
      //  }
    }
}