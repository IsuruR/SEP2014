using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewCandidate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Candidate candi = new Candidate();
        string s = Request.QueryString["id"];
        DataSet ds = candi.profile(s);
        lblFullName.Text = ds.Tables["profile"].Rows[0]["contestantName"].ToString();
        lblSex.Text = ds.Tables["profile"].Rows[0]["gender"].ToString();
        lblAge.Text = ds.Tables["profile"].Rows[0]["age"].ToString();
        lblAddress.Text = ds.Tables["profile"].Rows[0]["hometown"].ToString();
        lblCountry.Text = ds.Tables["profile"].Rows[0]["country"].ToString();
        lblTwitter.Text = ds.Tables["profile"].Rows[0]["twitterPageURL"].ToString();
        string src = ds.Tables["profile"].Rows[0]["image"].ToString();

        if (ds.Tables["profile"].Rows[0]["teamID"].ToString().Equals("1"))
        {
            lblTeam.Text = "Team Kylie";
        }
        else if (ds.Tables["profile"].Rows[0]["teamID"].ToString().Equals("2"))
        {
            lblTeam.Text = "Team Ricky";
        }
        else if (ds.Tables["profile"].Rows[0]["teamID"].ToString().Equals("3"))
        {
            lblTeam.Text = "Team Tom";
        }
        else
        {
            lblTeam.Text = "Team Will";
        }
       
        Image1.ImageUrl = src;
        if (src == "")
            Image1.ImageUrl = "~/CandidateProfiles/male-avatar-icon-614x460.png";
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Candidates.aspx");
    }
}