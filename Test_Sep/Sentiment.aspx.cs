using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Sentiment : System.Web.UI.Page
{

    SqlConnection con = null;
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        string conStr = ConfigurationManager.ConnectionStrings["VisualAnalyticConnectionString"].ConnectionString;
        con = new SqlConnection(conStr);
    }
    protected void btnAnalyze_Click(object sender, EventArgs e)
    {
        //lblProgress.Text = "Please wait...";
        DataSet comments = getComments();
        int commentCount = comments.Tables["comments"].Rows.Count;
        for (int i = 0; i < commentCount; i++)
        {
            string status = "";
            double positive_count = 0.0;
            double negative_count = 0.0;
            double positive = 0.0;
            double negative = 0.0;
            int commentID = Convert.ToInt32(comments.Tables["comments"].Rows[i]["id"].ToString());
            string contestant = comments.Tables["comments"].Rows[i]["name"].ToString();
            string text = comments.Tables["comments"].Rows[i]["comment"].ToString();
            string lowerCaseText = text.ToLower();
            char[] delimiterChars = { ' ', ',', '.', ':', '\t', '?', '!' };
            string[] word = lowerCaseText.Split(delimiterChars);
            foreach (string words in word)
            {
                int wordnetID = 0;
                wordnetID = getWordnetId(words);
                positive = getPositive(words);
                negative = getNegative(words);

                positive_count += positive;
                negative_count += negative;

                if (positive_count > negative_count)
                    status = "p";
                else if (positive_count == negative_count)
                    status = "d";
                else
                    status = "n";
                if (con.State.ToString() == "Closed")
                {
                    con.Open();
                }

                if (wordnetID > 0)
                {
                    SqlCommand cmd = new SqlCommand("INSERT INTO" +
                                                           " wordCloud(commentId,wordnetid,name,word,positive,negative)" +
                                                     " VALUES" +
                                                          " (@commentId,@wordnetid,@name,@word,@positive,@negative)", con);
                    cmd.Parameters.Add(new SqlParameter("@commentId", commentID));
                    cmd.Parameters.Add(new SqlParameter("@wordnetid", wordnetID));
                    cmd.Parameters.Add(new SqlParameter("@name", contestant));
                    cmd.Parameters.Add(new SqlParameter("@word", words));
                    cmd.Parameters.Add(new SqlParameter("@positive", positive_count));
                    cmd.Parameters.Add(new SqlParameter("@negative", negative_count));

                    //Label1.Text += wordnetID.ToString() + "<br>";
                    cmd.ExecuteNonQuery();
                    con.Close();
                }

                if (con.State.ToString() == "Closed")
                {
                    con.Open();
                }

            }
            if (con.State.ToString() == "Closed")
            {
                con.Open();
            }

            SqlCommand cmd1 = new SqlCommand("Update Comments set sentiment=@sentiment where commentID=@commentID", con);
            cmd1.Parameters.Add(new SqlParameter("@commentID", comments.Tables["comments"].Rows[i]["commentId"].ToString()));
            cmd1.Parameters.Add(new SqlParameter("@sentiment", status));
            cmd1.ExecuteNonQuery();

            //lblProgress.Text = "successfully updated";
            //Label2.Text += "comment = " + i.ToString() + "postive values  = " + positive_count.ToString() + ": negative value =  " + negative_count.ToString() + " status == " + status + "<br>";
        }
    }

    public DataSet getComments()
    {
        DataSet com = new DataSet();
        try
        {
            if (con.State.ToString() == "Closed")
                con.Open();
            string selection = "select * from Comments";
            SqlCommand cmd = new SqlCommand(selection, con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(com, "comments");

        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
        }
        finally
        {
            con.Close();
        }
        return com;
    }

    public double getPositive(string word)
    {
        double positive = 0.0;
        try
        {
            if (con.State.ToString() == "Closed")
                con.Open();
            string selection = "select  word,avg(positive) as positive ,avg(negative) as negative from WORDNET where word='" + word + "' group by word";
            SqlCommand cmd = new SqlCommand(selection, con);
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    positive = Convert.ToDouble(reader["positive"].ToString());
                }
                cmd.Dispose();
                con.Close();
            }
            cmd.Dispose();
            con.Close();

        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);

        }
        finally
        {
            con.Close();
        }
        return positive;
    }
    public double getNegative(string word)
    {
        double negative = 0.0;
        try
        {
            if (con.State.ToString() == "Closed")
                con.Open();
            string selection = "select  word,avg(positive) as positive ,avg(negative) as negative from WORDNET where word='" + word + "' group by word";
            SqlCommand cmd = new SqlCommand(selection, con);
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    negative = Convert.ToDouble(reader["negative"].ToString());
                }
                cmd.Dispose();
                con.Close();
            }
            cmd.Dispose();
            con.Close();

        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);

        }
        finally
        {
            con.Close();
        }
        return negative;
    }
    public int getWordnetId(string word)
    {
        int id = 0;
        try
        {
            if (con.State.ToString() == "Closed")
                con.Open();
            string selection = "select min(id) as id from WORDNET where word='" + word + "'";
            SqlCommand cmd = new SqlCommand(selection, con);
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    id = Convert.ToInt32(reader["id"].ToString());
                }
                cmd.Dispose();
                con.Close();
            }
            cmd.Dispose();
            con.Close();

        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);

        }
        finally
        {
            con.Close();
        }
        return id;
    }
}