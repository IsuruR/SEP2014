using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PositiveNegativeFeats : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CSVForPNF cpn = new CSVForPNF();
        cpn.createCSV();
    }
}