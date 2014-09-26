using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;


/// <summary>
/// Summary description for Userinfo
/// </summary>

    public class UserInfo
    {
        private string _userName;
       private string _password;
       private string _userEmail;

       public UserInfo(string userName, string pwd, string email)
        {
            _userName = userName;
            _password = pwd;
            _userEmail = email;
        }
        public string UserName
        {
            get { return _userName; }
        }
      
        public string Password
        {
            get { return _password; }
        }
        public string email
        {
            get { return _userEmail; }
        }
    }

