using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Windows.Forms;


public partial class AddCandidates : System.Web.UI.Page
{
    SqlConnection con = null;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
       
        Candidate candidate = new Candidate();
        
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

        try{
           
                bool x = candidate.addCandidates(txtFname.Text, drpSex.SelectedValue.ToString(), Convert.ToInt32(txtAge.Text), txtHometown.Text, serverPath, txtTwitterUrl.Text, Convert.ToInt32(drpTeam.SelectedValue.ToString()));

                if (x == true)
                {
                    pnlSuccess.Visible = true;
                }
                else
                    pnlError.Visible = true;
            
    }
      catch(Exception ex){
          MessageBox.Show(ex.Message);
            Console.WriteLine("Error: " + ex.Message);
      }
        
    }

    protected void btncancel_Click(object sender, EventArgs e)
    {
       
    }

}