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

/// <summary>
/// Summary description for Candidate
/// </summary>
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
        return status;
    }
}