using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Newtonsoft.Json;

public class RoundJson
{
    SqlConnection con = null;

	public RoundJson()
	{
        string conStr = ConfigurationManager.ConnectionStrings["VisualAnalyticConnectionString"].ConnectionString;
        con = new SqlConnection(conStr);

        DataSet ds = new DataSet();
        ds = readData();
        List<Round> roundsList = new List<Round>();

        //Console.WriteLine(ds);
        //Console.WriteLine(ds.Tables["Round"].Rows.Count);

        for (int x = 0; x < ds.Tables["Round"].Rows.Count; x++)
        {
            Round r = new Round();
            r.id = Convert.ToInt32(ds.Tables["Round"].Rows[x]["roundId"]);
            r.episode = Convert.ToInt32(ds.Tables["Round"].Rows[x]["episode"]);
            r.name = ds.Tables["Round"].Rows[x]["roundName"].ToString();
            r.participants = Convert.ToInt32(ds.Tables["Round"].Rows[x]["noOfParticipants"]);
            r.eliminations = Convert.ToInt32(ds.Tables["Round"].Rows[x]["noOfEliminations"]);
            roundsList.Add(r);
        }

        string ans = JsonConvert.SerializeObject(roundsList, Newtonsoft.Json.Formatting.Indented);

        try
        {
            //System.IO.StreamWriter file = new System.IO.StreamWriter(@"c:\Users\Isu\Desktop\VAS\JsonTest\ttt.json");
            System.IO.StreamWriter file = new System.IO.StreamWriter(@"c:\Users\Isu\Desktop\Test\rr.json");
            file.WriteLine(ans);

            file.Close();
            //Label2.Text = "File Successfully Created";
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
            string selection = "select * from  Round ";

            SqlCommand cmd = new SqlCommand(selection, con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds, "Round");

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

    public class Round
    {
        public int id;
        public int episode;
        public string name;
        public int participants;
        public int eliminations;
    }
}