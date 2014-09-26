using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ForgetPwd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            DataSet ds = new DataSet();
            SqlConnection con;   //declare the sql connection
            con = DB_Connect.GetConnection(); //using DB_Connect class, we make the connection.
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT UserName,Password FROM users Where Email= '" + txtEmail.Text.Trim() + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            con.Close();

            if (ds.Tables[0].Rows.Count > 0)
            {
                MailMessage Msg = new MailMessage();
                // Sender e-mail address.
                Msg.From = new MailAddress(txtEmail.Text);
                // Recipient e-mail address.
                Msg.To.Add(txtEmail.Text);
                Msg.Subject = "Your Password Details";
                Msg.Body = "Hi, <br/>Please check your Login Detailss<br/><br/>Your Username: " + ds.Tables[0].Rows[0]["UserName"] + "<br/><br/>Your Password: " + ds.Tables[0].Rows[0]["Password"] + "<br/><br/>";
                Msg.IsBodyHtml = true;
                // your remote SMTP server IP.
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new System.Net.NetworkCredential("yourusername@gmail.com", "yourpassword");
                smtp.EnableSsl = true;
                smtp.Send(Msg);
                //Msg = null;
                lbltxt.Text = "Your Password Details Sent to your mail";

                lbltxt.Visible = true;
                // Clear the textbox valuess
                txtEmail.Text = "";
            }
            else
            {
                lbltxt.Text = "The Email you entered not exists.";
                lbltxt.Visible = true;
            }
        }

        catch (Exception ex)
        {
            Console.WriteLine("{0} Exception caught.", ex);
            lbltxt.Text = "Connetion Problem Occurred.";
            lbltxt.Visible = true;
        }
    }
}