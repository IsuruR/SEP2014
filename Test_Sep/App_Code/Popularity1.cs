using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Popularity
/// </summary>
public class Popularity1
{
    public string candID { get; set; }
    public int youtubeLikes { get; set; }
    public int youtubeDislikes { get; set; }
    public int fblikes { get; set; }
    public int tweets { get; set; }

    Candidate1 c;

    double weight = 0.5;

    //for twitter
    List<string> fList;
    List<double> pList;

    //for youtube
    List<string> likes;
    List<string> dislikes;
    List<double> totalList;
    List<double> yList;

    //for overall
    List<double> ovList;
    List<double> overallList;
    List<double> youtubeList = new List<double>();
    List<double> twitterList = new List<double>();

    public Popularity1()
    {
        c = new Candidate1();
    }

    public List<double> getTwitterPopularity(int round)
    {
        fList = new List<string>();
        fList = c.getFollowersList(round);

        int sum = 0;

        foreach (string s in fList)
        {
            sum = sum + Convert.ToInt32(s);
        }

        pList = new List<double>();
        double popularity = 0;

        foreach (string s in fList)
        {
            double n = Convert.ToDouble(s);

            popularity = n / Convert.ToDouble(sum) * 100.0;
            popularity = Math.Round(popularity, 2);
            pList.Add(popularity);
        }

        return pList;
    }

    public List<double> getYoutubePopularity(int round)
    {

        likes = new List<string>();
        dislikes = new List<string>();

        likes = c.getYoutubeLikes(round);
        dislikes = c.getYoutubeDislikes(round);

        totalList = new List<double>();

        var likesAndDislikes = likes.Zip(dislikes, (l, d) => new { Likes = l, Dislikes = d });

        foreach (var ld in likesAndDislikes)
        {
            double total = Convert.ToDouble(ld.Likes) - Convert.ToDouble(ld.Dislikes);
            totalList.Add(total);
        }

        double sum = 0.0;

        foreach (double n in totalList)
        {
            sum = sum + n;
        }

        yList = new List<double>();
        double y = 0;

        foreach (double s in totalList)
        {
            double n = s;

            y = n / sum * 100.0;
            y = Math.Round(y, 2);
            yList.Add(y);
        }




        return yList;
    }



    public List<double> getOverallPopularity(int round)
    {
        List<double> temp1 = this.getTwitterPopularity(round);

        //foreach (double n in temp1)
        //{
        //    MessageBox.Show("T : " + n.ToString());
        //}

        List<double> temp2 = this.getYoutubePopularity(round);

        //foreach (double n in temp2)
        //{
        //    MessageBox.Show("Y : " + n.ToString());
        //}

        var Overall = temp2.Zip(temp1, (y, t) => new { youtube = y, twitter = t });
        ovList = new List<double>();

        foreach (var o in Overall)
        {
            double overallValue = o.youtube + (o.twitter * weight);
            overallValue = Math.Round(overallValue, 2);
            ovList.Add(overallValue);
            //MessageBox.Show("O :" + overallValue.ToString());
        }

        double sum = 0.0;

        foreach (double n in ovList)
        {
            sum = sum + n;
        }

        //MessageBox.Show("Sum : " + sum);
        overallList = new List<double>();
        double overall = 0.0;

        foreach (double o in ovList)
        {
            overall = o / sum * 100.0;
            overall = Math.Round(overall, 2);
            overallList.Add(overall);
        }

        return overallList;
    }
}