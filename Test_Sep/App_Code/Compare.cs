using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for Compare
/// </summary>
public class Compare
{
    SqlConnection conn;   //declare the sql connection

	public Compare()
	{
		//
		// TODO: Add constructor logic here
		//
        conn = DB_Connect.GetConnection(); //using DB_Connect class, we make the connection.
	}

    public int getIDFromUrl(string url)
    {
        string name = url.Substring(url.LastIndexOf("/") + 1);
        string path = "~\\CandidateProfiles\\" + name;
        string query = "select ArtistID from Artist where image='"+path+"'";
        int id = 0;
        if (conn.State.ToString() == "Closed")
        {
            conn.Open();
        }

        SqlCommand cmd = new SqlCommand(query, conn);
        SqlDataReader reader = cmd.ExecuteReader();

        if (reader.HasRows)
        {
            while (reader.Read())
            {
                id = Convert.ToInt32(reader["ArtistID"]);
            }
            cmd.Dispose();
            conn.Close();
        }
        cmd.Dispose();
        conn.Close();

        return id;
     }

    public string getNameFromUrl(string url)
    {
        string name = url.Substring(url.LastIndexOf("/") + 1);
        string path = "~\\CandidateProfiles\\" + name;
        string query = "select Name from Artist where Image='" + path + "'";
        string artist = null;
        if (conn.State.ToString() == "Closed")
        {
            conn.Open();
        }

        SqlCommand cmd = new SqlCommand(query, conn);
        SqlDataReader reader = cmd.ExecuteReader();

        if (reader.HasRows)
        {
            while (reader.Read())
            {
                artist = reader["Name"].ToString();
            }
            cmd.Dispose();
            conn.Close();
        }
        cmd.Dispose();
        conn.Close();

        return artist;
    }

    //fix this method..artist name,followers,likes and date should export
    public void ExportToCSV()
    {
        //Get the data from database into datatable
       
      //  string strQuery = "select * from compareArtist";
        //SqlCommand cmd = new SqlCommand(strQuery);
        //DataTable dt = GetData(cmd);
        string[] columns = new string[3] {"artist","followers","date" };

        Popularity p = new Popularity();
       
        List<overalList> ol = new List<overalList>();
        ol = p.getTwitterPopularity();

        string csvPath = HttpContext.Current.Server.MapPath("~\\LineCompData.csv");
        
        //Here we delete the exisitng file to avoid duplicate records.
        if (File.Exists(csvPath))
        {
            File.Delete(csvPath);//change tis to update
        }
        StringBuilder sb = new StringBuilder();
        for (int k = 0; k < columns.Length; k++)
        {
            //add separator
            sb.Append(columns[k]+ ',');
        }
        //append new line
        sb.Append("\r\n");
      

        foreach (var r in ol)
        {
            
                sb.Append(r.artist.ToString()+','+r.overRate.ToString()+','+r.date.ToString());
                sb.Append("\r\n");
        }



        // Save or upload CSV format File (.csv)
        File.AppendAllText(csvPath, sb.ToString());

    }

    public void ExportToCSVForYoutube()
    {
        //Get the data from database into datatable

        //  string strQuery = "select * from compareArtist";
        //SqlCommand cmd = new SqlCommand(strQuery);
        //DataTable dt = GetData(cmd);
        string[] columns = new string[3] { "artist", "likes", "date" };

        Popularity p = new Popularity();

        List<overalList> ol = new List<overalList>();
        ol = p.getTwitterPopularity();

        string csvPath = HttpContext.Current.Server.MapPath("~\\LineCompData2.csv");

        //Here we delete the exisitng file to avoid duplicate records.
        if (File.Exists(csvPath))
        {
            File.Delete(csvPath);//change tis to update
        }
        StringBuilder sb = new StringBuilder();
        for (int k = 0; k < columns.Length; k++)
        {
            //add separator
            sb.Append(columns[k] + ',');
        }
        //append new line
        sb.Append("\r\n");


        foreach (var r in ol)
        {

            sb.Append(r.artist.ToString() + ',' + r.overRate.ToString() + ',' + r.date.ToString());
            sb.Append("\r\n");
        }



        // Save or upload CSV format File (.csv)
        File.AppendAllText(csvPath, sb.ToString());

    }


    public void ExportToCSVForOverall()
    {
        //Get the data from database into datatable

        //  string strQuery = "select * from compareArtist";
        //SqlCommand cmd = new SqlCommand(strQuery);
        //DataTable dt = GetData(cmd);
        string[] columns = new string[3] { "artist", "popularity", "date" };

        Popularity p = new Popularity();

        List<overalList> ol = new List<overalList>();
        ol = p.getTwitterPopularity();

        string csvPath = HttpContext.Current.Server.MapPath("~\\Popularity.csv");

        //Here we delete the exisitng file to avoid duplicate records.
        if (File.Exists(csvPath))
        {
            File.Delete(csvPath);//change tis to update
        }
        StringBuilder sb = new StringBuilder();
        for (int k = 0; k < columns.Length; k++)
        {
            //add separator
            sb.Append(columns[k] + ',');
        }
        //append new line
        sb.Append("\r\n");


        foreach (var r in ol)
        {

            sb.Append(r.artist.ToString() + ',' + r.overRate.ToString() + ',' + r.date.ToString());
            sb.Append("\r\n");
        }



        // Save or upload CSV format File (.csv)
        File.AppendAllText(csvPath, sb.ToString());

    }


    public DataSet getUrls()
    {
       // string name = url.Substring(url.LastIndexOf("/") + 1);
       // string path = "~\\CandidateProfiles\\" + name;
        string query = "select image from Artist";
        DataSet ds = new DataSet();
        if (conn.State.ToString() == "Closed")
        {
            conn.Open();
        }
        SqlCommand cmd = new SqlCommand(query, conn);

        cmd.CommandType = CommandType.Text;
        cmd.Connection = conn;
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
       
        try
        {

            
           
            sda.Fill(ds, "image");
        }
        catch (Exception ex)
        {

            throw ex;
        }
        finally
        {

            sda.Dispose();
            conn.Dispose();
            conn.Close();
        }
        return ds;
    }

    private DataTable GetData(SqlCommand cmd)
    {
        DataTable dt = new DataTable();
        if (conn.State.ToString() == "Closed")
        {
            conn.Open();
        }
        SqlDataAdapter sda = new SqlDataAdapter();
        cmd.CommandType = CommandType.Text;
        cmd.Connection = conn;
        try
        {
           
            sda.SelectCommand = cmd;
            sda.Fill(dt);
          
            return dt;
        }
        catch (Exception ex)
        {
         
            throw ex;
        }
        finally
        {
           
            sda.Dispose();
            conn.Dispose();
            conn.Close();
        }
        
    }
}