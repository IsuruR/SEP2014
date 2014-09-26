using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class WorldMapWithLeaflet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        JsonCreator j2 = new JsonCreator();

        //Compare c = new Compare();
        ////get the images of artists
        //DataSet dt = c.getUrls();

        //ArrayList arrlst = new ArrayList();
        //string[] artist = new string[12];
        //int x = 0;
        //foreach (DataRow row in dt.Tables["image"].Rows)
        //{
        //    arrlst.Add(dt.Tables["image"].Rows[x]["image"].ToString());
        //    x++;
        //}



        //int i = 1;
        //foreach (var n in arrlst)
        //{

        //    HtmlImage h = new HtmlImage()
        //    {
        //        //  Src = "~/CandidateProfiles/Jamie.jpg",
        //        Src = n.ToString(),
        //        Width = 100,
        //        Height = 108,
        //        ID = "img12" + i
        //    };

        //    h.Attributes["draggable"] = "true";
        //    h.Attributes["ondragstart"] = "drag(event)";

        //    imgdiv.Controls.Add(h);
        //    i++;
        //}
    }
}