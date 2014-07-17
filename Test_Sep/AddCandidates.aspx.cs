using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;


public partial class AddCandidates : System.Web.UI.Page
{
    SqlConnection con = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        //if(!IsPostBack)
        //    {
        //        //txtAge.Items.Add(new ListItem("",""));
        //        //for(int i = 1; i <= 100; i++)
        //        //{
        //        //    txtAge.Items.Add(new ListItem(i.ToString(), i.ToString()));
        //        //}


    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
       
        Candidate candi = new Candidate();
        int count = 0;

        if (candi.isCountNull())
            count = 1;
        else
            count = Convert.ToInt32(generateCount());
        count++;
       
        //generate an image ID for candidate's profile
        //string imageName =count.ToString()+txtFname.Text+txtMiddleName.Text+txtLastName.Text ;
        string imageName = txtFname.Text;
        string serverPath="";
        
        if (fileImage.HasFile)
        {
            String exten = System.IO.Path.GetExtension(fileImage.FileName);
            String path = Server.MapPath("~\\CandidateProfiles\\");
            fileImage.SaveAs(path + (imageName + exten));
            String getPath = Server.MapPath("~\\CandidateProfiles\\");
             serverPath = ("~\\CandidateProfiles\\") + (imageName + exten);
        }

        try
        {
            bool x = candi.addCandidates(count, txtFname.Text, drpSex.SelectedValue.ToString(), Convert.ToInt32(txtAge.Text), txtHometown.Text, drpCountry.SelectedValue.ToString(), serverPath, txtDescription.Text, txtFacebookUrl.Text, txtTwitterUrl.Text, Convert.ToInt32(drpTeam.SelectedValue.ToString()));

            if (x == true)
            {
                pnlSuccess.Visible = true;
            }
            else
                pnlError.Visible = true;
        }
        catch(Exception ex){
            Console.WriteLine("Error: " + ex.Message);
        }
        
    }

    protected void btncancel_Click(object sender, EventArgs e)
    {
       
    }

    private bool isValidAge(int integerAge)
    {
        bool status = false;
        if (integerAge >= 0 || integerAge < 100)
            status = true;
        return status;
    }
   
    public string generateCount()
    {
        string conStr = ConfigurationManager.ConnectionStrings["VisualAnalyticConnectionString"].ConnectionString;
        con = new SqlConnection(conStr);
        string c = "";
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
}