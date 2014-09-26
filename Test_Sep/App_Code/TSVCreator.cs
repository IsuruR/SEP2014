﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for TSVCreator
/// </summary>
public class TSVCreator
{
	public TSVCreator()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    protected void ExportToTSV(int id, string filename)
    {
        //Get the data from database into datatable
        string strQuery = "select date,followers,likes from twitter where contestantID='" + id + "'";
        SqlCommand cmd = new SqlCommand(strQuery);
        DataTable dt = GetData(cmd);


        StringBuilder sb = new StringBuilder();
        for (int k = 0; k < dt.Columns.Count; k++)
        {
            //add separator
            sb.Append(dt.Columns[k].ColumnName + '\t');
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
        string tsvPath = "C:\\Users\\Isu\\Desktop\\Iteration04\\New\\Test_Sep\\" + filename + ".tsv";

        //Here we delete the exisitng file to avoid duplicate records.
        if (File.Exists(tsvPath))
        {
            File.Delete(tsvPath);
        }
        // Save or upload CSV format File (.csv)
        File.AppendAllText(tsvPath, sb.ToString());

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
}