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
using System.Windows.Forms;

public partial class EditCandidate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            pnlAll.Visible = true;
            Candidate candidate = new Candidate();
            GridViewRow row = GridView1.SelectedRow;
            string user = row.Cells[0].Text.ToString();
            //MessageBox.Show("User:  " + user);
            DataSet ds = candidate.profile(user);

            txtFname.Text = ds.Tables["profile"].Rows[0]["Name"].ToString();
            txtAge.Text = ds.Tables["profile"].Rows[0]["Age"].ToString();
            txtHometown.Text = ds.Tables["profile"].Rows[0]["HomeTown"].ToString();
            string src = ds.Tables["profile"].Rows[0]["Image"].ToString();
            txtTw.Text = ds.Tables["profile"].Rows[0]["TwitterURL"].ToString();
            ArtistImage.ImageUrl = src;
        }
        catch (Exception ex)
        {
            MessageBox.Show("Error1   "+ex.Message);
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        
            GridViewRow row = GridView1.SelectedRow;
            int user = Convert.ToInt32(row.Cells[0].Text.ToString());
            Candidate candidate = new Candidate();
            string imageName = txtFname.Text;
            string serverPath = "";

            if (fileImage.HasFile)
            {
                String exten = System.IO.Path.GetExtension(fileImage.FileName);
                String path = Server.MapPath("~\\CandidateProfiles\\");
                fileImage.SaveAs(path + (imageName + exten));
                String getPath = Server.MapPath("~\\CandidateProfiles\\");
                serverPath = ("~\\CandidateProfiles\\") + (imageName + exten);
                ArtistImage.ImageUrl = serverPath;
            }
       try
       {

            bool update = candidate.updateCandidate(user, txtFname.Text, drpSex.SelectedValue.ToString(), Convert.ToInt32(txtAge.Text), txtHometown.Text, serverPath, txtTw.Text, Convert.ToInt32(drpTeam.SelectedValue.ToString()));

            if (update == true)
            {
                pnlSuccess.Visible = true;
            }
            else
            {
                pnlError.Visible = true;
            }
        }
        catch (Exception er)
        {
            //MessageBox.Show("zzzzzzzzzzzzz     " + er.Message);
        }
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("EditCandidate.aspx");
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        Candidate candi = new Candidate();
        
        GridViewRow row = GridView1.SelectedRow;
        int user = Convert.ToInt32(row.Cells[0].Text.ToString());
        DataSet ds = candi.profile(user.ToString());
        string src = ds.Tables["profile"].Rows[0]["Image"].ToString();
        string imageName = ds.Tables["profile"].Rows[0]["Name"].ToString();
        bool deleteStatus = false;
  
        try
        {
            SqlConnection conn3 = new SqlConnection(ConfigurationManager.ConnectionStrings["VisualAnalyticConnectionString"].ConnectionString);
            conn3.Open();
            SqlCommand cmd2 = new SqlCommand("Delete from Artist where ArtistID='" + Convert.ToInt32(user) + "'", conn3);
            cmd2.ExecuteScalar();
            conn3.Close();

           // deleteStatus = true;

            //if (deleteStatus == true)
            //{
            //    PanelDeleteSuccess.Visible = true;
            //}
            //else
            //{
            //    PanelDeleteError.Visible = true;
            //}
            
            Response.Redirect("EditCandidate.aspx");

            
        }
        catch (Exception ex)
        {
            MessageBox.Show("zzzzzzzzzzzzz     " + ex.Message);
        }

    }
    public void DeleteFileFromFolder(string StrFilename)
    {
        Candidate candi = new Candidate();
        GridViewRow row = GridView1.SelectedRow;
        int user = Convert.ToInt32(row.Cells[1].Text.ToString());
        DataSet ds = candi.profile(user.ToString());
        string src = ds.Tables["profile"].Rows[0]["Image"].ToString();
        string imageName = ds.Tables["profile"].Rows[0]["Name"].ToString();
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
    protected void txtTw_TextChanged(object sender, EventArgs e)
    {

    }
    protected void txtHometown_TextChanged(object sender, EventArgs e)
    {

    }
}