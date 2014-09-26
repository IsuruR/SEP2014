using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class compareArtist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
            Compare c = new Compare();
            c.ExportToCSVForOverall();



           //get the images of artists
           DataSet dt = c.getUrls();

           ArrayList arrlst = new ArrayList();
           string[] artist = new string[12];
           int x = 0;
           foreach (DataRow row in dt.Tables["image"].Rows)
           {
               arrlst.Add(dt.Tables["image"].Rows[x]["image"].ToString());
               x++;
           }



           int i = 1;
           foreach (var n in arrlst)
           {

               HtmlImage h = new HtmlImage()
               {
                   //  Src = "~/CandidateProfiles/Jamie.jpg",
                   Src = n.ToString(),
                   Width = 100,
                   Height = 108,
                   ID = "img12" + i
               };

               h.Attributes["draggable"] = "true";
               h.Attributes["ondragstart"] = "drag(event)";

               imgdiv.Controls.Add(h);
               i++;
           }
        //-----------------------------------------------------------------------------------


     // Newlist here.
          //List<double> l = new List<double>();
          // l= p.getOverallPopularity(1)
          // System.Diagnostics.Debug.WriteLine(l);
          /* Compare c = new Compare();
           DataSet dt = c.getUrls();


           for (int i = 1; i <= 12; i++)
           {

               HtmlImage h = new HtmlImage()
                 {
                     Src = "~/CandidateProfiles/Jamie.jpg",
                     Width = 100,
                     Height = 108,
                     ID = "img12" + i
                 };

               h.Attributes["draggable"] = "true";
               h.Attributes["ondragstart"] = "drag(event)";

               imgdiv.Controls.Add(h);
           }*/
        
    }

    [System.Web.Services.WebMethod]
    public static string getName(string val)
    {
        //  string val = artistUrl.Value;
        string text = val;
        string name = text.Substring(text.LastIndexOf("/") + 1);
        string path = "~\\CandidateProfiles\\" + name;
        //Label1.Text = path;
        Compare c = new Compare();
      string set= (c.getNameFromUrl(text));
      return set;
    }
 
    protected void btn1_Click(object sender, EventArgs e)
    {
        Response.Redirect("compareArtist.aspx");
    }
    protected void btn2_Click(object sender, EventArgs e)
    {
        Response.Redirect("compareArtistTwitter.aspx");
    }
    protected void btn3_Click(object sender, EventArgs e)
    {
        Response.Redirect("compareArtistYoutube.aspx");
    }

    //public static double getPopularity()
    //{
    //    Popularity p = new Popularity();
    //    // Newlist here.
    //    List<double> l = new List<double>();
    //     l= p.getOverallPopularity(1);

    //    double[] s;

    //}
}