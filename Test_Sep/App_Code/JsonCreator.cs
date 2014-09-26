using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Newtonsoft.Json;

/// <summary>
/// Summary description for JsonCreator
/// </summary>
public class JsonCreator
{
	SqlConnection con = null;

    public JsonCreator()
	{
        string conStr = ConfigurationManager.ConnectionStrings["VisualAnalyticConnectionString"].ConnectionString;
        con = new SqlConnection(conStr);

        DataSet ds = new DataSet();
        ds = readData();
        List<LocationClass> locationList = new List<LocationClass>();

        for (int x = 0; x < ds.Tables["Location"].Rows.Count; x++)
        {
            LocationClass l = new LocationClass();
            l.ArtistID = Convert.ToInt32(ds.Tables["Location"].Rows[x]["ArtistID"]);
            l.FollowerID = Convert.ToInt32(ds.Tables["Location"].Rows[x]["FollowerID"]);
            l.Name = ds.Tables["Location"].Rows[x]["Name"].ToString();
            l.Location = ds.Tables["Location"].Rows[x]["Location"].ToString();
            l.Latitude = ds.Tables["Location"].Rows[x]["Latitude"].ToString();
            l.Longitude = ds.Tables["Location"].Rows[x]["Longitude"].ToString();
            l.Date = ds.Tables["Location"].Rows[x]["Date"].ToString();
            locationList.Add(l);
        }

        string ans = JsonConvert.SerializeObject(locationList, Newtonsoft.Json.Formatting.Indented);

        try
        {
            System.IO.StreamWriter file = new System.IO.StreamWriter(@"c:\Users\Isu\Desktop\location.json");
            file.WriteLine(ans);

            file.Close();
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
        }
	}

    public DataSet readData()
    {
        DataSet ds = new DataSet();
        try
        {
            if (con.State.ToString() == "Closed")
                con.Open();
            string selection = "select * from  Location ";

            SqlCommand cmd = new SqlCommand(selection, con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds, "Location");

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

    public class LocationClass
    {
        public int ArtistID;
        public int FollowerID;
        public string Name;
        public string Location;
        public string Latitude;
        public string Longitude;
        public string Date;
    }
}