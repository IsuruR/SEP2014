using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class socialMediaRating : System.Web.UI.Page
{
    string c;
    bool scraping = true;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (scraping == true)
        {
            string today = DateTime.Today.ToString("dd/MM/yyyy");

            string dayOfWeek = DateTime.Today.DayOfWeek.ToString().ToLower();

            int offSet = 0;

            switch (dayOfWeek)
            {
                case "sunday": offSet = 6;
                    break;
                case "monday": offSet = 7;
                    break;
                case "tuesday": offSet = 8;
                    break;
                case "wednesday": offSet = 9;
                    break;
                case "thursday": offSet = 10;
                    break;
                case "friday": offSet = 11;
                    break;
                case "saturday": offSet = 12;
                    break;
            }

            DateTime startWeek = DateTime.Now.AddDays(-offSet);
            string startWeek2 = "30/03/2014";
            string endWeek2 = "05/04/2014";

            DateTime endWeek = startWeek.AddDays(6);
            // this.calcRate(endWeek.ToShortDateString());
            this.calcRate(endWeek2);
            //  this.sortViews(endWeek.ToShortDateString());

            week.Text = "30" + " " + "Sunday" + " " + "March" + " TO " + 5 + " " + "Saturday" + " " + "April" + " " + startWeek.ToString("yyyy");

            Label2.Text = "30" + " " + "Sunday" + " " + "March" + " TO " + 5 + " " + "Saturday" + " " + "April" + " " + startWeek.ToString("yyyy");
            //---------------------------------------------------------------------
            this.sortViews(endWeek2);
        }

        else
        {
            string today = DateTime.Today.ToString("dd/MM/yyyy");
            //string today = "8/08/2014";
            string dayOfWeek = DateTime.Today.DayOfWeek.ToString().ToLower();

            int offSet = 0;

            switch (dayOfWeek)
            {
                case "sunday": offSet = 6;
                    break;
                case "monday": offSet = 7;
                    break;
                case "tuesday": offSet = 8;
                    break;
                case "wednesday": offSet = 9;
                    break;
                case "thursday": offSet = 10;
                    break;
                case "friday": offSet = 11;
                    break;
                case "saturday": offSet = 12;
                    break;
            }

            DateTime startWeek = DateTime.Now.AddDays(-offSet);
            DateTime endWeek = startWeek.AddDays(6);
            this.calcRate2(endWeek.ToShortDateString());
            this.sortViews2(endWeek.ToShortDateString());

            week.Text = startWeek.DayOfWeek.ToString() + " " + startWeek.Day.ToString("d") + " " + startWeek.ToString("MMM") + " TO " + endWeek.DayOfWeek.ToString() + " " + endWeek.Day.ToString("d") + " " + endWeek.ToString("MMM") + " " + startWeek.ToString("yyyy");

            Label2.Text = startWeek.DayOfWeek.ToString() + " " + startWeek.Day.ToString("d") + " " + startWeek.ToString("MMM") + " TO " + endWeek.DayOfWeek.ToString() + " " + endWeek.Day.ToString("d") + " " + endWeek.ToString("MMM") + " " + startWeek.ToString("yyyy");
            //---------------------------------------------------------------------

        }
    }


    public int GetWeekNo(DateTime date)
    {
        System.Globalization.CultureInfo cult_info = System.Threading.Thread.CurrentThread.CurrentCulture; ;
        System.Globalization.Calendar cal = cult_info.Calendar;
        int weekNo = cal.GetWeekOfYear(date, cult_info.DateTimeFormat.CalendarWeekRule, cult_info.DateTimeFormat.FirstDayOfWeek);
        return weekNo;
    }


    public void calcRate(string today)
    {
        //-------------------------------Date------------------------------------------
        string dayOfWeek = DateTime.Today.DayOfWeek.ToString().ToLower();

        int offSet = 0;

        switch (dayOfWeek)
        {
            case "sunday": offSet = 6;
                break;
            case "monday": offSet = 7;
                break;
            case "tuesday": offSet = 8;
                break;
            case "wednesday": offSet = 9;
                break;
            case "thursday": offSet = 10;
                break;
            case "friday": offSet = 11;
                break;
            case "saturday": offSet = 12;
                break;
        }

        DateTime startWeek = DateTime.Now.AddDays(-offSet);
        DateTime endWeek = startWeek.AddDays(6);
        string endWeek2 = "05/04/2014";
        string prevwee2 = "29/03/2014";
        DateTime prevWeek = startWeek.AddDays(-1);
        //-----------------------------------------------------------------------------


        this.generateCount(endWeek2);
        int count = Convert.ToInt32(c);
        String[] contestants = new String[count];
        int[] tweets = new int[count]; 
        int temptwt;
        string tempCont;
        SqlConnection con = null;

        string conStr = ConfigurationManager.ConnectionStrings["VisualAnalyticConnectionString"].ConnectionString;
        con = new SqlConnection(conStr);
        con.Open();

       // string query = "Select * from twitter where date='" + endWeek.ToShortDateString() + "'";
       string query = "Select * from twitter where rdate='05/04/2014'";
        SqlCommand cmd1 = new SqlCommand(query, con);

        SqlDataReader reader = cmd1.ExecuteReader();

        if (reader.HasRows)
        {
           
            // while(reader.Read())
            for (int i = 0; i < count; i++)
            {
                reader.Read();
                //Label4.Text = count.ToString();
                contestants[i] = reader["artistID"].ToString();
            
            }
            reader.Close();
            con.Close();

        }

        reader.Close();
        con.Close();

        //getting tweets for all contestants in order
        for (int i = 0; i < count; i++)
        {
            tweets[i] = getTweets(Convert.ToInt32(contestants[i]), today);
        }

        //sort using bubblesort
        for (int k = 0; k < count; k++) 
        {
            for (int sort = 0; sort < count - 1; sort++)
            {
                if (tweets[sort] < tweets[sort + 1])
                {
                    temptwt = tweets[sort];
                    tempCont = contestants[sort];
                    tweets[sort] = tweets[sort+1];
                    contestants[sort] = contestants[sort+1];
                    tweets[sort+1] = temptwt;
                    contestants[sort+1] = tempCont;
                }
            }
        }

        //select contestants names and images

        

        //-----------------------------------------------------------------------------

        DataTable dt = new DataTable();
       dt.Columns.Add("Name", Type.GetType("System.String"));
       dt.Columns.Add("Followers", Type.GetType("System.String"));
       dt.Columns.Add("Image", Type.GetType("System.String"));
       dt.Columns.Add("Rank", Type.GetType("System.String"));
       dt.Columns.Add("increasedBy", Type.GetType("System.String"));
       dt.Columns.Add("Percentage", Type.GetType("System.String"));
      
        for (int i = 0; i < count; i++)
        {
            dt.Rows.Add();
            dt.Rows[dt.Rows.Count - 1]["Name"] = getName(Convert.ToInt32(contestants[i]));
            dt.Rows[dt.Rows.Count - 1]["Followers"] = tweets[i];
            dt.Rows[dt.Rows.Count - 1]["Image"] = ResolveUrl(getImage(Convert.ToInt32(contestants[i])));
            dt.Rows[dt.Rows.Count - 1]["Rank"] = (i+1)+"#";
            dt.Rows[dt.Rows.Count - 1]["increasedBy"] = "Increased by "+getDiff(Convert.ToInt32(contestants[i]), endWeek2, prevwee2);
            dt.Rows[dt.Rows.Count - 1]["Percentage"] = getPercentage(Convert.ToInt32(contestants[i]), endWeek2, prevwee2)+"%";
    
        }
      
        GridView1.DataSource = dt;
        GridView1.DataBind();
    
        
    }


 

    public int getTweets(int id,string date)
    {
        string str = "select followers from twitter where artistID='"+id+"' and rdate='"+date+"'";
        int tweets=0;
        SqlConnection con = null;

        string conStr = ConfigurationManager.ConnectionStrings["VisualAnalyticConnectionString"].ConnectionString;
        con = new SqlConnection(conStr);
        con.Open();

        SqlCommand cmd = new SqlCommand(str, con);
        SqlDataReader reader = cmd.ExecuteReader();

        if (reader.HasRows)
        {
            while (reader.Read())
            {
                tweets = Convert.ToInt32(reader["followers"]);
            }
            cmd.Dispose();
            con.Close();
        }
        cmd.Dispose();
        con.Close();

        return tweets;

    }

    public void generateCount(string date)
    {
        SqlConnection connection = null;
        try
        {
            string conn = ConfigurationManager.ConnectionStrings["VisualAnalyticConnectionString"].ConnectionString;
            connection = new SqlConnection(conn);
            connection.Open();
            String str = "SELECT count(artistID)as count FROM twitter where rdate='"+date+"'";

            SqlCommand cmd = new SqlCommand(str, connection);
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    c = reader["count"].ToString();
                }
                cmd.Dispose();
                connection.Close();
            }
            cmd.Dispose();
            connection.Close();
            //Label4.Text = c;
        }
        catch
        {
            //Label4.Text = "error";
        }
        finally
        {
            connection.Close();
        }
    }

    public void generateCount2(string date)
    {
        SqlConnection connection = null;
        try
        {
            string conn = ConfigurationManager.ConnectionStrings["VisualAnalyticConnectionString"].ConnectionString;
            connection = new SqlConnection(conn);
            connection.Open();
            String str = "SELECT count(artistID)as count FROM youtube where rdate='" + date + "'";

            SqlCommand cmd = new SqlCommand(str, connection);
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    c = reader["count"].ToString();
                }
                cmd.Dispose();
                connection.Close();
            }
            cmd.Dispose();
            connection.Close();
            //Label4.Text = c;
        }
        catch
        {
            //Label4.Text = "error";
        }
        finally
        {
            connection.Close();
        }
    }

    //increased by count
    public int getDiff(int id,string thiswk, string lastwk)
    {
       int up = getTweets(id, thiswk);
        int down = getTweets(id,lastwk);

        int dif = (up)-(down);
        return dif;
        
        
    }
    
    //select contestants names
    public string getName(int id)
    {
        string str = "select name from artist where artistID='" + id + "'";
        string names="";
        SqlConnection con = null;

        string conStr = ConfigurationManager.ConnectionStrings["VisualAnalyticConnectionString"].ConnectionString;
        con = new SqlConnection(conStr);
        con.Open();

        SqlCommand cmd = new SqlCommand(str, con);
        SqlDataReader reader = cmd.ExecuteReader();

        if (reader.HasRows)
        {
            while (reader.Read())
            {
                names = reader["name"].ToString();
            }
            cmd.Dispose();
            con.Close();
        }
        cmd.Dispose();
        con.Close();

        return names;

    }
    //get images
    public string getImage(int id)
    {
        string str = "select image from artist where artistID='" + id + "'";
        string image = "";
        SqlConnection con = null;

        string conStr = ConfigurationManager.ConnectionStrings["VisualAnalyticConnectionString"].ConnectionString;
        con = new SqlConnection(conStr);
        con.Open();

        SqlCommand cmd = new SqlCommand(str, con);
        SqlDataReader reader = cmd.ExecuteReader();

        if (reader.HasRows)
        {
            while (reader.Read())
            {
                image = reader["image"].ToString();
            }
            cmd.Dispose();
            con.Close();
        }
        cmd.Dispose();
        con.Close();

        return image;

    }

    //growth by percentage
    public double getPercentage(int id, string thiswk, string lastwk)
    {
        double up = getTweets(id,thiswk);
        double down = getTweets(id, lastwk);
        
        double p = Convert.ToDouble(((getDiff(id, thiswk, lastwk)) /up))*100;
        return (p= Math.Round(p,2));
        
    }

/*------------------------------------------------------------------------------------------
  =                                                                                        =
  =                          You Tube Views                                                =
 -------------------------------------------------------------------------------------------*/
    public int getUViews(int id, string date)
    {
        string str = "select views from youtube where artistID='" + id + "' and pubDate='" + date + "'";
        int views = 0;
        SqlConnection con = null;

        string conStr = ConfigurationManager.ConnectionStrings["VisualAnalyticConnectionString"].ConnectionString;
        con = new SqlConnection(conStr);
        con.Open();

        SqlCommand cmd = new SqlCommand(str, con);
        SqlDataReader reader = cmd.ExecuteReader();

        if (reader.HasRows)
        {
            while (reader.Read())
            {
                views = Convert.ToInt32(reader["views"]);
            }
            cmd.Dispose();
            con.Close();
        }
        cmd.Dispose();
        con.Close();

        return views;

    }


    public void sortViews(string today)
    {
        //-------------------------------Date------------------------------------------
        string dayOfWeek = DateTime.Today.DayOfWeek.ToString().ToLower();

        int offSet = 0;

        switch (dayOfWeek)
        {
            case "sunday": offSet = 6;
                break;
            case "monday": offSet = 7;
                break;
            case "tuesday": offSet = 8;
                break;
            case "wednesday": offSet = 9;
                break;
            case "thursday": offSet = 10;
                break;
            case "friday": offSet = 11;
                break;
            case "saturday": offSet = 12;
                break;
        }

        DateTime startWeek = DateTime.Now.AddDays(-offSet);
        DateTime endWeek = startWeek.AddDays(6);
        DateTime prevWeek = startWeek.AddDays(-1);
        string endWeek2 = "05/04/2014";
        //-----------------------------------------------------------------------------


        this.generateCount2(endWeek2);
        int count = Convert.ToInt32(c);
        String[] contestants = new String[count];
        int[] views = new int[count];
        int tempviews;
        string tempCont;
        SqlConnection con = null;

        string conStr = ConfigurationManager.ConnectionStrings["VisualAnalyticConnectionString"].ConnectionString;
        con = new SqlConnection(conStr);
        con.Open();

        SqlCommand cmd1 = new SqlCommand("Select * from artist", con);

        SqlDataReader reader = cmd1.ExecuteReader();

        if (reader.HasRows)
        {

            // while(reader.Read())
            for (int i = 0; i < count; i++)
            {
                reader.Read();
                //Label4.Text = count.ToString();
                contestants[i] = reader["artistID"].ToString();

            }
            reader.Close();
            con.Close();

        }

        reader.Close();
        con.Close();

        //getting views for all contestants in order
        for (int i = 0; i < count; i++)
        {
            views[i] = getUViews(Convert.ToInt32(contestants[i]), endWeek2);
        }

        //sort using bubblesort
        for (int k = 0; k < count; k++)
        {
            for (int sort = 0; sort < count - 1; sort++)
            {
                if (views[sort] < views[sort + 1])
                {
                    tempviews = views[sort];
                    tempCont = contestants[sort];
                    views[sort] = views[sort + 1];
                    contestants[sort] = contestants[sort + 1];
                    views[sort + 1] = tempviews;
                    contestants[sort + 1] = tempCont;
                }
            }
        }

        //select contestants names and images



        //-----------------------------------------------------------------------------

        DataTable dt = new DataTable();
        dt.Columns.Add("Name", Type.GetType("System.String"));
        dt.Columns.Add("Views", Type.GetType("System.String"));
        dt.Columns.Add("utubeimage", Type.GetType("System.String"));
       

        for (int i = 0; i < count; i++)
        {
            dt.Rows.Add();
            dt.Rows[dt.Rows.Count - 1]["Name"] = getName(Convert.ToInt32(contestants[i]));
            dt.Rows[dt.Rows.Count - 1]["views"] = views[i];
            dt.Rows[dt.Rows.Count - 1]["utubeimage"] = ResolveUrl(getImage(Convert.ToInt32(contestants[i])));
        }
        GridView2.DataSource = dt;
        GridView2.DataBind();




    }

    protected void GridView1_RowCommand(object sender,
     System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {

        string currentCommand = e.CommandName;
        int currentRowIndex = Int32.Parse(e.CommandArgument.ToString());
        
        GridViewRow row = GridView1.Rows[currentRowIndex];
        string name = row.Cells[2].Text.ToString();
        //Label2.Text = name.ToString();
        int id1=getID(name);
        
        this.ExportToCSV(id1);

        Response.Redirect("past3weeksChart.aspx");
      
    }

    //select contestants names
    public int getID(string name)
    {
        string str = "select artistID from artist where name='" + name + "'";
        int id = 0;
        SqlConnection con = null;

        string conStr = ConfigurationManager.ConnectionStrings["VisualAnalyticConnectionString"].ConnectionString;
        con = new SqlConnection(conStr);
        con.Open();

        SqlCommand cmd = new SqlCommand(str, con);
        SqlDataReader reader = cmd.ExecuteReader();

        if (reader.HasRows)
        {
            while (reader.Read())
            {
                id = Convert.ToInt32(reader["artistID"]);
            }
            cmd.Dispose();
            con.Close();
        }
        cmd.Dispose();
        con.Close();

        return id;

    }

    protected void ExportToCSV(int id)
    {
        //Get the data from database into datatable
        string strQuery = "select rdate,followers from twitter where artistID='" + id + "'";
        SqlCommand cmd = new SqlCommand(strQuery);
        DataTable dt = GetData(cmd);

        string csvPath = HttpContext.Current.Server.MapPath("~\\BarData.csv");
        
        //Here we delete the exisitng file to avoid duplicate records.
        if (File.Exists(csvPath))
        {
            File.Delete(csvPath);
        }
        StringBuilder sb = new StringBuilder();
        for (int k = 0; k < dt.Columns.Count; k++)
        {
            //add separator
            sb.Append(dt.Columns[k].ColumnName + ',');
        }
        //append new line
        sb.Append("\r\n");
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            for (int k = 0; k < dt.Columns.Count; k++)
            {
                //add separator
                sb.Append(dt.Rows[i][k].ToString().Replace(",", ";") + ',');
            }
            //append new line
            sb.Append("\r\n");
        }
       

       
        // Save or upload CSV format File (.csv)
        File.AppendAllText(csvPath, sb.ToString());

    }

    private DataTable GetData(SqlCommand cmd)
    {
        DataTable dt = new DataTable();
        String strConnString = System.Configuration.ConfigurationManager.
             ConnectionStrings["VisualAnalyticConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlDataAdapter sda = new SqlDataAdapter();
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        try
        {
            con.Open();
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
            con.Close();
            sda.Dispose();
            con.Dispose();
        }
    }

    //-----------------------------------------------------------------------------------------------------------------

    public void calcRate2(string today)
    {
        //-------------------------------Date------------------------------------------
        string dayOfWeek = DateTime.Today.DayOfWeek.ToString().ToLower();

        int offSet = 0;

        switch (dayOfWeek)
        {
            case "sunday": offSet = 6;
                break;
            case "monday": offSet = 7;
                break;
            case "tuesday": offSet = 8;
                break;
            case "wednesday": offSet = 9;
                break;
            case "thursday": offSet = 10;
                break;
            case "friday": offSet = 11;
                break;
            case "saturday": offSet = 12;
                break;
        }

        DateTime startWeek = DateTime.Now.AddDays(-offSet);
        DateTime endWeek = startWeek.AddDays(6);
        DateTime prevWeek = startWeek.AddDays(-1);
        //-----------------------------------------------------------------------------


        this.generateCount(endWeek.ToShortDateString());
        int count = Convert.ToInt32(c);
        String[] contestants = new String[count];
        int[] tweets = new int[count];
        int temptwt;
        string tempCont;
        SqlConnection con = null;

        string conStr = ConfigurationManager.ConnectionStrings["VisualAnalyticConnectionString"].ConnectionString;
        con = new SqlConnection(conStr);
        con.Open();

        string query = "Select * from twitter where date='" + endWeek.ToShortDateString() + "'";
        SqlCommand cmd1 = new SqlCommand(query, con);

        SqlDataReader reader = cmd1.ExecuteReader();

        if (reader.HasRows)
        {

            // while(reader.Read())
            for (int i = 0; i < count; i++)
            {
                reader.Read();
                //Label4.Text = count.ToString();
                contestants[i] = reader["artistID"].ToString();

            }
            reader.Close();
            con.Close();

        }

        reader.Close();
        con.Close();

        //getting tweets for all contestants in order
        for (int i = 0; i < count; i++)
        {
            tweets[i] = getTweets(Convert.ToInt32(contestants[i]), today);
        }

        //sort using bubblesort
        for (int k = 0; k < count; k++)
        {
            for (int sort = 0; sort < count - 1; sort++)
            {
                if (tweets[sort] < tweets[sort + 1])
                {
                    temptwt = tweets[sort];
                    tempCont = contestants[sort];
                    tweets[sort] = tweets[sort + 1];
                    contestants[sort] = contestants[sort + 1];
                    tweets[sort + 1] = temptwt;
                    contestants[sort + 1] = tempCont;
                }
            }
        }

        //select contestants names and images



        //-----------------------------------------------------------------------------

        DataTable dt = new DataTable();
        dt.Columns.Add("Name", Type.GetType("System.String"));
        dt.Columns.Add("Followers", Type.GetType("System.String"));
        dt.Columns.Add("Image", Type.GetType("System.String"));
        dt.Columns.Add("Rank", Type.GetType("System.String"));
        dt.Columns.Add("increasedBy", Type.GetType("System.String"));
        dt.Columns.Add("Percentage", Type.GetType("System.String"));

        for (int i = 0; i < count; i++)
        {
            dt.Rows.Add();
            dt.Rows[dt.Rows.Count - 1]["Name"] = getName(Convert.ToInt32(contestants[i]));
            dt.Rows[dt.Rows.Count - 1]["Followers"] = tweets[i];
            dt.Rows[dt.Rows.Count - 1]["Image"] = ResolveUrl(getImage(Convert.ToInt32(contestants[i])));
            dt.Rows[dt.Rows.Count - 1]["Rank"] = (i + 1) + "#";
            dt.Rows[dt.Rows.Count - 1]["increasedBy"] = "Increased by " + getDiff(Convert.ToInt32(contestants[i]), endWeek.ToShortDateString(), prevWeek.ToShortDateString());
            dt.Rows[dt.Rows.Count - 1]["Percentage"] = getPercentage(Convert.ToInt32(contestants[i]), endWeek.ToShortDateString(), prevWeek.ToShortDateString()) + "%";

        }

        GridView1.DataSource = dt;
        GridView1.DataBind();


    }


    public void sortViews2(string today)
    {
        //-------------------------------Date------------------------------------------
        string dayOfWeek = DateTime.Today.DayOfWeek.ToString().ToLower();

        int offSet = 0;

        switch (dayOfWeek)
        {
            case "sunday": offSet = 6;
                break;
            case "monday": offSet = 7;
                break;
            case "tuesday": offSet = 8;
                break;
            case "wednesday": offSet = 9;
                break;
            case "thursday": offSet = 10;
                break;
            case "friday": offSet = 11;
                break;
            case "saturday": offSet = 12;
                break;
        }

        DateTime startWeek = DateTime.Now.AddDays(-offSet);
        DateTime endWeek = startWeek.AddDays(6);
        DateTime prevWeek = startWeek.AddDays(-1);
        //-----------------------------------------------------------------------------


        this.generateCount2(endWeek.ToShortDateString());
        int count = Convert.ToInt32(c);
        String[] contestants = new String[count];
        int[] views = new int[count];
        int tempviews;
        string tempCont;
        SqlConnection con = null;

        string conStr = ConfigurationManager.ConnectionStrings["VisualAnalyticConnectionString"].ConnectionString;
        con = new SqlConnection(conStr);
        con.Open();

        SqlCommand cmd1 = new SqlCommand("Select * from artist", con);

        SqlDataReader reader = cmd1.ExecuteReader();

        if (reader.HasRows)
        {

            // while(reader.Read())
            for (int i = 0; i < count; i++)
            {
                reader.Read();
                //Label4.Text = count.ToString();
                contestants[i] = reader["artistID"].ToString();

            }
            reader.Close();
            con.Close();

        }

        reader.Close();
        con.Close();

        //getting views for all contestants in order
        for (int i = 0; i < count; i++)
        {
            views[i] = getUViews(Convert.ToInt32(contestants[i]), today);
        }

        //sort using bubblesort
        for (int k = 0; k < count; k++)
        {
            for (int sort = 0; sort < count - 1; sort++)
            {
                if (views[sort] < views[sort + 1])
                {
                    tempviews = views[sort];
                    tempCont = contestants[sort];
                    views[sort] = views[sort + 1];
                    contestants[sort] = contestants[sort + 1];
                    views[sort + 1] = tempviews;
                    contestants[sort + 1] = tempCont;
                }
            }
        }

        //select contestants names and images



        //-----------------------------------------------------------------------------

        DataTable dt = new DataTable();
        dt.Columns.Add("Name", Type.GetType("System.String"));
        dt.Columns.Add("Views", Type.GetType("System.String"));
        dt.Columns.Add("utubeimage", Type.GetType("System.String"));


        for (int i = 0; i < count; i++)
        {
            dt.Rows.Add();
            dt.Rows[dt.Rows.Count - 1]["Name"] = getName(Convert.ToInt32(contestants[i]));
            dt.Rows[dt.Rows.Count - 1]["views"] = views[i];
            dt.Rows[dt.Rows.Count - 1]["utubeimage"] = ResolveUrl(getImage(Convert.ToInt32(contestants[i])));
        }
        GridView2.DataSource = dt;
        GridView2.DataBind();




    }
}