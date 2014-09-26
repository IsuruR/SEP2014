using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Text.RegularExpressions;
using System.Xml;
using System.IO;
using System.Text;

public partial class getYoutubeToDB : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Candidate c=new Candidate();
        List<string> list = new List<string>();
        list=c.getCandidateList();
        bool state = false;
        int likeCount = 0;
        int dislikeCount = 0;
        string commentLink = "";
        string title = "";
        string pubDate = "";
        string videoId = "";
        string pDate = "";
        int viewCount = 0;

        foreach (string cand in list)
        {
            XmlDocument xdoc = new XmlDocument();
            xdoc.Load("http://gdata.youtube.com/feeds/api/videos?q=" + cand + "performs+at+bbc+the+voice+uk+knockouts+2014&start-index=1&max-results=5&v=2");
            //xdoc.Save(@"D:\Year 3\SEP\VS\trial.xml");

            int i = 1;

            XmlNodeList xmlnode;
            xmlnode = xdoc.GetElementsByTagName("entry");

            

            //foreach(XmlNode n in xmlnode)
            //{
            if (xmlnode.Count != 0)
            {
                pubDate = xdoc.GetElementsByTagName("yt:uploaded").Item(i).InnerText;
                videoId = xdoc.GetElementsByTagName("yt:videoid").Item(i).InnerText;
                title = xdoc.GetElementsByTagName("media:title").Item(i).InnerText;

                viewCount = Convert.ToInt32(xdoc.GetElementsByTagName("yt:statistics").Item(i).Attributes["viewCount"].Value);
                likeCount = Convert.ToInt32(xdoc.GetElementsByTagName("yt:rating").Item(i).Attributes["numLikes"].Value);
                dislikeCount = Convert.ToInt32(xdoc.GetElementsByTagName("yt:rating").Item(i).Attributes["numDislikes"].Value);
                commentLink = xdoc.GetElementsByTagName("gd:feedLink").Item(i).Attributes["href"].Value;

                pDate = pubDate.Replace('T', ' ').Replace('-', '/');
                title = title.Replace('\'', ' ').Replace('-',' ');

                //MessageBox.Show(pubDate+"\n"+videoId+"\n"+title+"\n"+likeCount+"\n"+dislikeCount+"\n"+commentLink);

                state = c.storeYoutubeData(cand, videoId, title, pubDate, likeCount, dislikeCount, commentLink,viewCount);
                if (state)
                    Console.WriteLine("Success");
                else
                    Console.WriteLine("Not Success");

                XmlDocument xdoc2 = new XmlDocument();
                xdoc2.Load(commentLink);
                //xdoc2.Save(@"D:\Year 3\SEP\VS\comments.xml");
                XmlNodeList xmlnode2;
                xmlnode2 = xdoc2.GetElementsByTagName("entry");

                string commentId = "";
                string comment = "";
                string zzz = "";
                for(int j=0;j<xmlnode2.Count;j++)
                {
                    commentId = xdoc2.GetElementsByTagName("id").Item(j).InnerText;
                    comment = xdoc2.GetElementsByTagName("content").Item(j).InnerText;
                    comment = comment.Replace('\'', ' ');
                    c.storeComments(commentId, videoId, cand, comment);
                    zzz = "Pass";
                }
                //MessageBox.Show(zzz);

            }

        }

    }
}