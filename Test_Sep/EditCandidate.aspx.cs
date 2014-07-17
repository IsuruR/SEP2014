using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditCandidate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtAge.Items.Add(new ListItem("", ""));
            for (int i = 1; i <= 100; i++)
            {
                txtAge.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }

        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        pnlAll.Visible = true;
        Candidate candi = new Candidate();
        GridViewRow row = GridView1.SelectedRow;
        string user = row.Cells[1].Text.ToString();
        DataSet ds = candi.profile(user);
        txtFname.Text = ds.Tables["profile"].Rows[0]["contestantName"].ToString();
        //txtLastName.Text =ds.Tables["profile"].Rows[0]["last_name"].ToString();
        //drpSex.Text = ds.Tables["profile"].Rows[0]["gender"].ToString();
        txtAge.Text = ds.Tables["profile"].Rows[0]["age"].ToString();
        txtHometown.Text = ds.Tables["profile"].Rows[0]["hometown"].ToString();
        //drpCountry.SelectedValue = ds.Tables["profile"].Rows[0]["country"].ToString();
        string src = ds.Tables["profile"].Rows[0]["image"].ToString();
        txtDescription.Text = ds.Tables["profile"].Rows[0]["description"].ToString();
        txtFb.Text = ds.Tables["profile"].Rows[0]["fbPageURL"].ToString();
        txtTw.Text = ds.Tables["profile"].Rows[0]["twitterPageURL"].ToString();
        //drpTeam.Text = ds.Tables["profile"].Rows[0]["teamID"].ToString();
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        GridViewRow row = GridView1.SelectedRow;
        int  user =Convert.ToInt32(row.Cells[1].Text.ToString());
        Candidate candi = new Candidate();
        string imageName = txtFname.Text;
        string serverPath = "";

        if (fileImage.HasFile)
        {
            String exten = System.IO.Path.GetExtension(fileImage.FileName);
            String path = Server.MapPath("~\\CandidateProfiles\\");
            fileImage.SaveAs(path + (imageName + exten));
            String getPath = Server.MapPath("~\\CandidateProfiles\\");
            serverPath = ("~\\CandidateProfiles\\") + (imageName + exten);
        }

        //bool update = candi.updateCandidate(user, txtFname.Text, drpSex.SelectedValue.ToString(), Convert.ToInt32(txtAge.SelectedValue.ToString()), txtHometown.Text, drpCountry.SelectedValue.ToString(), serverPath, txtDescription.Text, txtFb.Text, txtTw.Text, Convert.ToInt32(drpTeam.SelectedValue.ToString()));
        bool update = candi.updateCandidate(user, txtFname.Text, drpSex.SelectedValue.ToString(), Convert.ToInt32(txtAge.SelectedValue.ToString()), txtHometown.Text, drpCountry.SelectedValue.ToString(), serverPath, txtDescription.Text, txtFb.Text, txtTw.Text, Convert.ToInt32(drpTeam.SelectedValue.ToString()));
        
        if (update == true)
        {
            pnlSuccess.Visible = true;
        }
        else
            pnlError.Visible = true;
        
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {

    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        Candidate candi = new Candidate();
        
        GridViewRow row = GridView1.SelectedRow;
        int user = Convert.ToInt32(row.Cells[1].Text.ToString());
        DataSet ds = candi.profile(user.ToString());
        string src = ds.Tables["profile"].Rows[0]["image"].ToString();
        string imageName = ds.Tables["profile"].Rows[0]["contestantName"].ToString();
       // DeleteFileFromFolder(imageName);
  
        try
        {
            SqlConnection conn3 = new SqlConnection(ConfigurationManager.ConnectionStrings["VisualAnalyticConnectionString"].ConnectionString);
            conn3.Open();
            SqlCommand cmd2 = new SqlCommand("Delete from contestant where contestantID='" + Convert.ToInt32(user) + "'", conn3);
            cmd2.ExecuteScalar();
            conn3.Close();

            
            //string completePath = Server.MapPath("~/CandidateProfiles/" + Session["ID"].ToString()) + "SimpleTable" + index + ".pdf"; if (System.IO.File.Exists(completePath))
            //{

            //System.IO.File.Delete(completePath);

            //}
            Response.Redirect("EditCandidate.aspx");
        }
        catch (Exception ex)
        { 
            
        }

    }
    public void DeleteFileFromFolder(string StrFilename)
    {
        Candidate candi = new Candidate();
        GridViewRow row = GridView1.SelectedRow;
        int user = Convert.ToInt32(row.Cells[1].Text.ToString());
        DataSet ds = candi.profile(user.ToString());
        string src = ds.Tables["profile"].Rows[0]["image"].ToString();
        string imageName = ds.Tables["profile"].Rows[0]["contestantName"].ToString();
        // DeleteFileFromFolder(imageName);
        string file = src.Substring(20);
        try
        {
            FileInfo TheFile = new FileInfo(MapPath(".") + "\\" + file);
            if (TheFile.Exists)
            {
                File.Delete(MapPath(".") + "\\" + file);
            }
            else
            {
                throw new FileNotFoundException();
            }
        }

        catch (FileNotFoundException ex)
        {
            
        }
        catch (Exception ex)
        {
            
        }

    }
}