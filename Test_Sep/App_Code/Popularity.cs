using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Windows.Forms;


public class Popularity
{
    Candidate c;

    double weight = 0.5;

    //for twitter
    List<twitterList> fList;
    List<overalList> pList;

    //for youtube
    List<youTubeList> likes;
    List<youTubeList> dislikes;
    List<overalList> totalList;
    List<overalList> yList;

    //for overall
    List<overalList> ovList;
    List<overalList> overallList;
    List<double> youtubeList = new List<double>();
    List<double> twitterList = new List<double>();

	public Popularity()
	{
        c = new Candidate();
	}

    public List<overalList> getTwitterPopularity()
    {
        fList = new List<twitterList>();
        fList = c.getFollowersList();

        int sum = 0;

        foreach (var s in fList)
        {
            sum = sum + Convert.ToInt32(s.followers);
        }

        pList = new List<overalList>();
        double popularity = 0;

        foreach (var s in fList)
        {
            double n = Convert.ToDouble(s.followers);

            popularity = n / Convert.ToDouble(sum) * 100.0;
            popularity = Math.Round(popularity, 2);
            overalList t = new overalList();
            t.artist = s.artist;
            t.date = s.date;
            t.overRate = popularity;
            pList.Add(t);
        }

        return pList;
    }

    public List<overalList> getYoutubePopularity()
    {
        likes = new List<youTubeList>();
        dislikes = new List<youTubeList>();

        likes = c.getYoutubeLikes();
       // dislikes = c.getYoutubeDislikes(round);

        totalList = new List<overalList>();

        var likesAndDislikes = likes.Zip(dislikes, (l, d) => new { Likes = l, Dislikes = d });

        foreach (var ld in likes)
        {
            double total = Convert.ToDouble(ld.likes) - Convert.ToDouble(ld.dislikes);
            overalList l = new overalList();
            l.artist = ld.artist;
            l.date = ld.date;
            l.overRate = total;
            totalList.Add(l);
        }

        double sum = 0.0;

        foreach (var n in totalList)
        {
            sum = sum + n.overRate;
        }

        yList = new List<overalList>();
        double y = 0;

        foreach (var s in totalList)
        {
            double n = s.overRate;

            y = n / sum * 100.0;
            y = Math.Round(y, 2);
            overalList l = new overalList();
            l.artist = s.artist;
            l.date = s.date;
            l.overRate = y;
            yList.Add(l);
        }

        return yList;
    }

    public List<overalList> getOverallPopularity()
    {
        List<overalList> temp1 = this.getTwitterPopularity();

        //foreach (double n in temp1)
        //{
        //    MessageBox.Show("T : " + n.ToString());
        //}

        List<overalList> temp2 = this.getYoutubePopularity();

        //foreach (double n in temp2)
        //{
        //    MessageBox.Show("Y : " + n.ToString());
        //}

        var Overall = temp2.Zip(temp1, (y, t) => new { youtube = y, twitter = t });
        ovList = new List<overalList>();

        foreach (var o in Overall)
        {
            double overallValue = o.youtube.overRate + (o.twitter.overRate*weight);
            overallValue = Math.Round(overallValue, 2);
            overalList l = new overalList();
            l.artist = o.twitter.artist;
            l.date = o.twitter.date;
            l.overRate = overallValue;
            ovList.Add(l);
            //MessageBox.Show("O :" + overallValue.ToString());
        }

        double sum = 0.0;

        foreach (var n in ovList)
        {
            sum = sum + n.overRate;
        }

        //MessageBox.Show("Sum : " + sum);

        overallList = new List<overalList>();
        double overall = 0.0;

        foreach (var o in ovList)
        {
            overall = o.overRate / sum * 100.0;
            overall = Math.Round(overall, 2);
            overalList l = new overalList();
            l.artist = o.artist;
            l.date = o.date;
            l.overRate = overall;
            overallList.Add(l);
        }

        return overallList;
    }
}