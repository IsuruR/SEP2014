using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;
using System.Windows.Forms;


public class Candidate
{
    SqlConnection con = null;
    string codeID = "";
    string uName = "";
    bool status_update;
    int count = 0;
    bool status;
    bool status_pwd;
    string c = "";

	public Candidate()
	{
        string conStr = ConfigurationManager.ConnectionStrings["VisualAnalyticConnectionString"].ConnectionString;
        con = new SqlConnection(conStr);
	}

    public bool addCandidates(string name, string gender, int age, string hometown, string image, string twitterUrl, int teamID)
    {
        bool status = false;
        string conStr = ConfigurationManager.ConnectionStrings["VisualAnalyticConnectionString"].ConnectionString;
        con = new SqlConnection(conStr);
        try
        {

            if (con.State.ToString() == "Closed")

                con.Open();

            SqlCommand cmd2 = new SqlCommand("INSERT INTO Artist(Name , Gender , Age, HomeTown , Image, TwitterURL, TeamID) VALUES(@name , @gender , @age, @hometown, @image , @twitterURL, @teamID)", con);

            //cmd2.Parameters.Add(new SqlParameter("@artistID", (artistID)));
            cmd2.Parameters.Add(new SqlParameter("@name", (name)));
            cmd2.Parameters.Add(new SqlParameter("@gender", (gender)));
            cmd2.Parameters.Add(new SqlParameter("@age", (age)));
            cmd2.Parameters.Add(new SqlParameter("@hometown", (hometown)));
            cmd2.Parameters.Add(new SqlParameter("@image", (image)));
            cmd2.Parameters.Add(new SqlParameter("@twitterURL", (twitterUrl)));
            cmd2.Parameters.Add(new SqlParameter("@teamID", (teamID)));



            cmd2.ExecuteNonQuery();
            status = true;


        }



        catch (Exception ex)
        {
            MessageBox.Show(ex.Message);
            Console.WriteLine("Error: " + ex.Message);
        }
        return status;

    }


    public DataSet profile(string artistID)
    {
        DataSet ds = new DataSet();
        string conStr = ConfigurationManager.ConnectionStrings["VisualAnalyticConnectionString"].ConnectionString;
        con = new SqlConnection(conStr);
        try
        {
            if (con.State.ToString() == "Closed")
                con.Open();
            string selection = "select * from Artist where ArtistID='" + artistID + "'";
            SqlCommand cmd = new SqlCommand(selection, con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds, "profile");

        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
        }
        finally
        {
            con.Close();
        }
        return ds;
    }


    public string generateCount()
    {

        try
        {
            con.Open();
            String str = "SELECT Max(ArtistID)as count FROM Artist ";

            SqlCommand cmd = new SqlCommand(str, con);
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    c = reader["count"].ToString();
                }
                cmd.Dispose();
                con.Close();
            }
            cmd.Dispose();
            con.Close();
            //Label4.Text = c;
        }
        catch
        {
            //Label4.Text = "error";
        }
        return c;
    }

    public bool isCountNull()
    {
        bool status = false;
        try
        {
            con.Open();
            String str = "SELECT count(ArtistID)as count FROM Artist ";

            SqlCommand cmd = new SqlCommand(str, con);
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    c = reader["count"].ToString();
                }
                cmd.Dispose();
                con.Close();
            }
            cmd.Dispose();
            con.Close();
            //Label4.Text = c;
        }
        catch
        {
            //Label4.Text = "error";
        }

        if (Convert.ToInt32(c) == 0)
            status = true;

        return status;
    }

    public bool updateCandidate(int artistID, string name, string gender, int age, string hometown, string image, string twitterURL, int teamID)
    {
        string conStr = ConfigurationManager.ConnectionStrings["VisualAnalyticConnectionString"].ConnectionString;
        con = new SqlConnection(conStr);
        bool status = false;

        try
        {

            if (con.State.ToString() == "Closed")

                con.Open();

            SqlCommand cmd2 = new SqlCommand("UPDATE Artist SET Name=@name, Gender=@gender, Age=@age, HomeTown=@hometown, Image=@image, TwitterURL=@twitterURL, TeamID=@teamID  " + " where ArtistID=@artistID", con);

            cmd2.Parameters.Add(new SqlParameter("@artistID", (artistID)));
            cmd2.Parameters.Add(new SqlParameter("@name", (name)));
            cmd2.Parameters.Add(new SqlParameter("@gender", (gender)));
            cmd2.Parameters.Add(new SqlParameter("@age", (age)));
            cmd2.Parameters.Add(new SqlParameter("@hometown", (hometown)));
            cmd2.Parameters.Add(new SqlParameter("@image", (image)));
            cmd2.Parameters.Add(new SqlParameter("@twitterURL", (twitterURL)));
            cmd2.Parameters.Add(new SqlParameter("@teamID", (teamID)));



            cmd2.ExecuteNonQuery();
            status = true;


        }



        catch (Exception ex)
        {
            MessageBox.Show("Error2  "+ex.Message);

            Console.WriteLine(ex.Message);
        }
        con.Close();
        return status;
    }

    

    //Youtube Scraping

    public List<string> getCandidateList()
    {
        List<string> myList = new List<string>();
        string conStr = ConfigurationManager.ConnectionStrings["VisualAnalyticConnectionString"].ConnectionString;
        con = new SqlConnection(conStr);
       // bool status = false;
        if (con.State.ToString() == "Closed")
        {
            con.Open();
        }
        SqlCommand newCmd1 = con.CreateCommand();
        newCmd1.Connection = con;
        newCmd1.CommandType = CommandType.Text;
        newCmd1.CommandText = "select candid from knockouts";
        newCmd1.ExecuteNonQuery();
        SqlDataReader dr = newCmd1.ExecuteReader();
        if (dr.HasRows)
        {
            string names = null;
            while (dr.Read())
            {

                string column = dr["candid"].ToString();
                myList.Add(column);
            }

            foreach (string c in myList) // Loop through List with foreach
            {
                names = names + c + "\n";
            }
            //MessageBox.Show(names);
            
                
            dr.Close();
        }
        else
        {
            dr.Close();
            //MessageBox.Show("Error connecting to data");
        }
        con.Close();
        return myList;
        

    }


    public bool storeYoutubeData(string name, string videoId, string title, string pubDate, int likes, int dislikes, string commentLink,int uviews)
    {
        bool status = false;
        string conStr = ConfigurationManager.ConnectionStrings["VisualAnalyticConnectionString"].ConnectionString;
        con = new SqlConnection(conStr);
        if (con.State.ToString() == "Closed")
        {
            con.Open();
        }

        SqlCommand newCmd1 = con.CreateCommand();
        newCmd1.Connection = con;
        newCmd1.CommandType = CommandType.Text;
        newCmd1.CommandText = "insert into youtube(name,videoId,title,pubDate,likes,dislikes,commentLink,uviews) values('" + name + "','" + videoId + "','" + title + "','" + pubDate + "', " + likes + " , " + dislikes + ",'"+commentLink+"','"+uviews+"')";
        try
        {
            newCmd1.ExecuteNonQuery();
        }
        catch (Exception e)
        {
            //MessageBox.Show(e.Message);
        }
        status = true;
        con.Close();
        return status;

    }


    public bool storeComments(string commentId, string videoId, string cand, string comment)
    {
        bool status = false;
        string conStr = ConfigurationManager.ConnectionStrings["VisualAnalyticConnectionString"].ConnectionString;
        con = new SqlConnection(conStr);
        if (con.State.ToString() == "Closed")
        {
            con.Open();
        }

        SqlCommand newCmd1 = con.CreateCommand();
        newCmd1.Connection = con;
        newCmd1.CommandType = CommandType.Text;
        newCmd1.CommandText = "insert into Comments(commentId,videoId,name,comment) values('" + commentId + "','" + videoId + "','" + cand + "','" + comment + "')";
        try
        {
            newCmd1.ExecuteNonQuery();
        }
        catch (Exception e)
        {
            //MessageBox.Show(e.Message);
        }
        con.Close();
        status = true;
        return status;
    }


    //GET DATA TO CALCULATE POPULARITIES

    public List<twitterList> getFollowersList()
    {
        List<twitterList> fList = new List<twitterList>();
        
        // bool status = false;
        if (con.State.ToString() == "Closed")
        {
            con.Open();
        }

        SqlCommand newCmd1 = con.CreateCommand();

        newCmd1.Connection = con;
        newCmd1.CommandType = CommandType.Text;
        newCmd1.CommandText = "select artist, Followers,date from compareArtist";
        newCmd1.ExecuteNonQuery();

        SqlDataReader dr = newCmd1.ExecuteReader();

        if (dr.HasRows)
        {
            while (dr.Read())
            {
                twitterList t = new twitterList();
                t.followers = Convert.ToInt32(dr["Followers"]);
                t.artist = dr["artist"].ToString();
                t.date = dr["date"].ToString();

                fList.Add(t);
            }

            dr.Close();
        }
        else
        {
            dr.Close();
        }

        con.Close();
        return fList ;
    }

    public List<youTubeList> getYoutubeLikes()
    {
        List<youTubeList> likesList = new List<youTubeList>();

        // bool status = false;
        if (con.State.ToString() == "Closed")
        {
            con.Open();
        }

        SqlCommand newCmd1 = con.CreateCommand();

        newCmd1.Connection = con;
        newCmd1.CommandType = CommandType.Text;
        newCmd1.CommandText = "select Likes,dislikes,date,artist from compareArtist";
        newCmd1.ExecuteNonQuery();

        SqlDataReader dr = newCmd1.ExecuteReader();

        if (dr.HasRows)
        {
            while (dr.Read())
            {
                youTubeList y = new youTubeList();

                y.artist = dr["artist"].ToString();
                y.date = dr["date"].ToString();
                y.likes = Convert.ToInt32(dr["likes"]);
                y.dislikes = Convert.ToInt32(dr["dislikes"]);
                likesList.Add(y);
            }

            dr.Close();
        }
        else
        {
            dr.Close();
        }

        con.Close();
        return likesList;
    }

    public List<string> getYoutubeDislikes()
    {
        List<string> dislikesList = new List<string>();

        // bool status = false;
        if (con.State.ToString() == "Closed")
        {
            con.Open();
        }

        SqlCommand newCmd1 = con.CreateCommand();

        newCmd1.Connection = con;
        newCmd1.CommandType = CommandType.Text;
        newCmd1.CommandText = "select Dislikes from Youtube";
        newCmd1.ExecuteNonQuery();

        SqlDataReader dr = newCmd1.ExecuteReader();

        if (dr.HasRows)
        {
            while (dr.Read())
            {

                string column = dr["Dislikes"].ToString();
                dislikesList.Add(column);
            }

            dr.Close();
        }
        else
        {
            dr.Close();
        }

        con.Close();
        return dislikesList;
    }
}