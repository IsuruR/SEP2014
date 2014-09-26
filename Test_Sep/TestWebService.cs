using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;

/// <summary>
/// Summary description for TestWebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class TestWebService : System.Web.Services.WebService {

    public TestWebService () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld() {
        return "Hello World";
    }
    [WebMethod]
    public string GetPopularityData()
    {
        List<Popularity1> popularities = new List<Popularity1>();
        string query = string.Format("SELECT * from Popularity");

        using (SqlConnection con =
             new SqlConnection(ConfigurationManager.ConnectionStrings["VisualAnalyticConnectionString"].ToString()))
        {
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Popularity1 popularity = new Popularity1();


                    popularity.candID = reader.GetString(0);
                    popularity.youtubeLikes = reader.GetInt32(1);
                    popularity.youtubeDislikes = reader.GetInt32(2);
                    popularity.fblikes = reader.GetInt32(3);
                    popularity.tweets = reader.GetInt32(4);
                    popularities.Add(popularity);
                }
                con.Close();
            }
        }
        //var json = "";
        var responseData = "";
        var pop = popularities.ToArray();

        JavaScriptSerializer jss = new JavaScriptSerializer();
        responseData = jss.Serialize(pop);
        return responseData;

    }

    [WebMethod]
    public string getTwitterPopularity(int round)
    {

        Popularity1 p = new Popularity1();
        List<double> list = p.getTwitterPopularity(round);

        var responseData = "";
        JavaScriptSerializer jss = new JavaScriptSerializer();
        responseData = jss.Serialize(list);
        return responseData;
    }

    [WebMethod]
    public string getYoutubePopularity(int round)
    {
        Popularity1 p = new Popularity1();
        List<double> list = p.getYoutubePopularity(round);

        var responseData = "";
        JavaScriptSerializer jss = new JavaScriptSerializer();
        responseData = jss.Serialize(list);
        return responseData;
    }

    [WebMethod]
    public string getOverallPopularity(int round)
    {
        Popularity1 p = new Popularity1();
        List<double> list = p.getOverallPopularity(round);

        var responseData = "";
        JavaScriptSerializer jss = new JavaScriptSerializer();
        responseData = jss.Serialize(list);
        return responseData;
    }

    [WebMethod]
    public string getYoutubeNames(int roundID)
    {
        Popularity1 p = new Popularity1();
        Candidate1 c=new Candidate1();
        List<string> namesList = c.getYoutubeNames(roundID);

        var responseData = "";
        JavaScriptSerializer jss = new JavaScriptSerializer();
        responseData = jss.Serialize(namesList);
        return responseData;
    }
    
}
