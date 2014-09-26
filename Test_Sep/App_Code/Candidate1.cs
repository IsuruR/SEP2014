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

/// <summary>
/// Summary description for Candidate1
/// </summary>
public class Candidate1
{
	public Candidate1()
	{
		 string conStr = ConfigurationManager.ConnectionStrings["VisualAnalyticConnectionString"].ConnectionString;
        con = new SqlConnection(conStr);
	}

     SqlConnection con = null;
    string codeID = "";
    string uName = "";
    bool status_update;
    int count = 0;
    bool status;
    bool status_pwd;
    string c = "";

	

    public bool addCandidates(int candID, string name, string gender, int age, string hometown, string country, string image, string description, string fbPageUrl, string twitterPageUrl, int teamID)
    {
        bool status = false;
        string conStr = ConfigurationManager.ConnectionStrings["VisualAnalyticConnectionString"].ConnectionString;
        con = new SqlConnection(conStr);
        try
        {

            if (con.State.ToString() == "Closed")

                con.Open();

            SqlCommand cmd2 = new SqlCommand("INSERT INTO contestant(contestantID , ContestantName , gender , age, hometown , country , image , description , fbPageURL, twitterPageURL, teamID) VALUES(@contestantID , @ContestantName , @gender , @age, @hometown , @country , @image , @description , @fbPageURL, @twitterPageURL, @teamID)", con);

            cmd2.Parameters.Add(new SqlParameter("@contestantID", (candID)));
            cmd2.Parameters.Add(new SqlParameter("@ContestantName", (name)));
            cmd2.Parameters.Add(new SqlParameter("@gender", (gender)));
            cmd2.Parameters.Add(new SqlParameter("@age", (age)));
            cmd2.Parameters.Add(new SqlParameter("@hometown", (hometown)));
            cmd2.Parameters.Add(new SqlParameter("@country", (country)));
            cmd2.Parameters.Add(new SqlParameter("@image", (image)));
            cmd2.Parameters.Add(new SqlParameter("@description", (description)));
            cmd2.Parameters.Add(new SqlParameter("@fbPageURL", (fbPageUrl)));
            cmd2.Parameters.Add(new SqlParameter("@twitterPageURL", (twitterPageUrl)));
            cmd2.Parameters.Add(new SqlParameter("@teamID", (teamID)));



            cmd2.ExecuteNonQuery();
            status = true;


        }



        catch (NullReferenceException ex)
        {
            Console.WriteLine("Error: " + ex.Message);
        }
        finally
        {

        }
        return status;

    }


    public DataSet profile(string candID)
    {
        DataSet ds = new DataSet();
        string conStr = ConfigurationManager.ConnectionStrings["VisualAnalyticConnectionString"].ConnectionString;
        con = new SqlConnection(conStr);
        try
        {
            if (con.State.ToString() == "Closed")
                con.Open();
            string selection = "select * from contestant where contestantID='" + candID + "'";
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
            String str = "SELECT Max(contestantID)as count FROM contestant ";

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
            String str = "SELECT count(contestantID)as count FROM contestant ";

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

    public bool updateCandidate(int candID, string name, string gender, int age, string hometown, string country, string image, string description, string fbPageURL, string twitterPageURL, int teamID)
    {
        string conStr = ConfigurationManager.ConnectionStrings["VisualAnalyticConnectionString"].ConnectionString;
        con = new SqlConnection(conStr);
        bool status = false;

        try
        {

            if (con.State.ToString() == "Closed")

                con.Open();

            SqlCommand cmd2 = new SqlCommand("UPDATE contestant SET contestantName=@name, gender=@gender, age=@age, hometown=@hometown, country=@country , image=@image, description=@description, fbPageURL=@fbPageURL, twitterPageURL=@twitterPageURL, teamID=@teamID  " + " where contestantID=@candID", con);

            cmd2.Parameters.Add(new SqlParameter("@candID", (candID)));
            cmd2.Parameters.Add(new SqlParameter("@name", (name)));
            cmd2.Parameters.Add(new SqlParameter("@gender", (gender)));
            cmd2.Parameters.Add(new SqlParameter("@age", (age)));
            cmd2.Parameters.Add(new SqlParameter("@hometown", (hometown)));
            cmd2.Parameters.Add(new SqlParameter("@country", (country)));
            cmd2.Parameters.Add(new SqlParameter("@image", (image)));
            cmd2.Parameters.Add(new SqlParameter("@description", (description)));
            cmd2.Parameters.Add(new SqlParameter("@fbPageURL", (fbPageURL)));
            cmd2.Parameters.Add(new SqlParameter("@twitterPageURL", (twitterPageURL)));
            cmd2.Parameters.Add(new SqlParameter("@teamID", (teamID)));



            cmd2.ExecuteNonQuery();
            status = true;


        }



        catch (NullReferenceException ex)
        {
            Console.WriteLine(ex.Message);
        }
        con.Close();
        return status;
    }

    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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
            MessageBox.Show("Error connecting to data");
        }
        con.Close();
        return myList;
        

    }

    //----------------------------------------
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
            MessageBox.Show(e.Message);
        }
        status = true;
        con.Close();
        return status;

    }

    //////////////////////////////////////////////////////////////////////////////////

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
            MessageBox.Show(e.Message);
        }
        con.Close();
        status = true;
        return status;
    }

    //////////////////////////////////GET DATA TO CALCULATE POPULARITIES//////////////////////////////////////////

    public List<string> getFollowersList(int roundID)
    {
        List<string> fList = new List<string>();
        
        // bool status = false;
        if (con.State.ToString() == "Closed")
        {
            con.Open();
        }

        SqlCommand newCmd1 = con.CreateCommand();

        newCmd1.Connection = con;
        newCmd1.CommandType = CommandType.Text;
        newCmd1.CommandText = "select ArtistID, Followers from Twitter where RoundID=" + roundID;
        newCmd1.ExecuteNonQuery();

        SqlDataReader dr = newCmd1.ExecuteReader();

        if (dr.HasRows)
        {
            while (dr.Read())
            {

                string column = dr["Followers"].ToString();
                fList.Add(column);
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

    public List<string> getYoutubeLikes(int roundID)
    {
        List<string> likesList = new List<string>();
        List<string> nameList = new List<string>();

        // bool status = false;
        if (con.State.ToString() == "Closed")
        {
            con.Open();
        }

        SqlCommand newCmd1 = con.CreateCommand();

        newCmd1.Connection = con;
        newCmd1.CommandType = CommandType.Text;
        //select y.likes, a.Name from Youtube y,Artist a where y.RoundID=5 AND a.ArtistID=y.ArtistID;
        newCmd1.CommandText = "select Likes,Name from Youtube,Artist where Youtube.RoundID=" + roundID + " AND Artist.ArtistID=Youtube.ArtistID";
        newCmd1.ExecuteNonQuery();

        SqlDataReader dr = newCmd1.ExecuteReader();

        if (dr.HasRows)
        {
            while (dr.Read())
            {
                string column = dr["Likes"].ToString();
                likesList.Add(column);

                string column2 = dr["Name"].ToString();
                nameList.Add(column2);
            }

            dr.Close();
        }
        else
        {
            dr.Close();
        }

        con.Close();
        List<string> newList = new List<string>();
        newList.Add(likesList.ToString());
        newList.Add(nameList.ToString());
       return likesList;
       // return newList;
    }
    /// <summary>
    ////////////////////////////////////////////////
    public List<string> getYoutubeNames(int roundID)
    {

        List<string> likesList = getYoutubeLikes(roundID);
        List<string> nameList = new List<string>();

        // bool status = false;
        if (con.State.ToString() == "Closed")
        {
            con.Open();
        }

        SqlCommand newCmd1 = con.CreateCommand();

        newCmd1.Connection = con;
        newCmd1.CommandType = CommandType.Text;
        //select y.likes, a.Name from Youtube y,Artist a where y.RoundID=5 AND a.ArtistID=y.ArtistID;

        foreach (var item in likesList)
        {
            newCmd1.CommandText = "select Name from Youtube,Artist where Youtube.Likes=" + item + " AND Artist.ArtistID=Youtube.ArtistID";
            newCmd1.ExecuteNonQuery();

            SqlDataReader dr = newCmd1.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    string column = dr["Name"].ToString();
                    nameList.Add(column);
                }

                dr.Close();
            }
            else
            {
                dr.Close();
            }

        }
        con.Close();
        return nameList;
    }


    //////////////////////////////////////////////
    public List<string> getYoutubeDislikes(int roundID)
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
        newCmd1.CommandText = "select Dislikes from Youtube where RoundID=" + roundID;
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