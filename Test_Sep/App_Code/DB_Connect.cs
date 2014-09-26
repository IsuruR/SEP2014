using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Summary description for DB_Connect
/// </summary>
public class DB_Connect
{
	public DB_Connect()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static SqlConnection NewCon;
    public static string ConStr =
        ConfigurationManager.ConnectionStrings["VisualAnalyticConnectionString"].ConnectionString;
    public static SqlConnection GetConnection()
    {
        NewCon = new SqlConnection(ConStr);
        return NewCon;
    }
}
