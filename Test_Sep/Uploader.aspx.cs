using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.IO;
using System.Data.OleDb;
using System.Data.SqlClient;

public partial class Uploader : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string ExcelContentType = "application/vnd.ms-excel";
        string Excel2010ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
        if (FileUpload1.HasFile)
        {
            if (FileUpload1.PostedFile.ContentType == ExcelContentType || FileUpload1.PostedFile.ContentType == Excel2010ContentType)              //Check the Content Type of the file
            {
                try
                {
                    string path = string.Concat(Server.MapPath("~/Temp/"), FileUpload1.FileName);                                             //Save file path
                    FileUpload1.SaveAs(path);                                                                                                 //Save File as Temp then you can delete it if you want

                    string excelConnectionString = string.Format("Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=Excel 8.0", path);         //string path = @"C:\Users\Johnney\Desktop\ExcelData.xls";

                    using (OleDbConnection connection = new OleDbConnection(excelConnectionString))                                           // Create Connection to Excel Workbook
                    {
                        OleDbCommand command = new OleDbCommand("Select * FROM [Sheet1$]", connection);
                        connection.Open();

                        using (System.Data.Common.DbDataReader dr = command.ExecuteReader())                                      // Create DbDataReader to Data Worksheet
                        {
                            string sqlConnectionString = "Data Source=ISU-PC\\SQLEXPRESS;Initial Catalog=VisualAnalytic;Integrated Security=True";           // SQL Server Connection String

                            using (SqlBulkCopy bulkCopy = new SqlBulkCopy(sqlConnectionString))                                        // Bulk Copy to SQL Server
                            {
                                bulkCopy.DestinationTableName = "WORDNET";                                                   // provide destination table name
                                // addMessage("1",DateTime.Today);
                                bulkCopy.WriteToServer(dr);
                                lblMsg.Text = "The data has been exported succefuly ";
                            }
                        }
                    }
                }

                catch (Exception ex)
                {
                    lblMsg.Text = ex.Message;
                }
            }
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
         string ExcelContentType = "application/vnd.ms-excel";
        string Excel2010ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
        if (FileUpload1.HasFile)
        {
            if (FileUpload1.PostedFile.ContentType == ExcelContentType || FileUpload1.PostedFile.ContentType == Excel2010ContentType)              //Check the Content Type of the file
            {
                try
                {
                    string path = string.Concat(Server.MapPath("~/Temp/"), FileUpload1.FileName);                                             //Save file path
                    FileUpload1.SaveAs(path);                                                                                                 //Save File as Temp then you can delete it if you want

                    string excelConnectionString = string.Format("Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=Excel 8.0", path);         //string path = @"C:\Users\Johnney\Desktop\ExcelData.xls";

                    using (OleDbConnection connection = new OleDbConnection(excelConnectionString))                                           // Create Connection to Excel Workbook
                    {
                        OleDbCommand command = new OleDbCommand("Select * FROM [Sheet1$]", connection);
                        connection.Open();

                        using (System.Data.Common.DbDataReader dr = command.ExecuteReader())                                      // Create DbDataReader to Data Worksheet
                        {
                            string sqlConnectionString = "Data Source=ISU-PC\\SQLEXPRESS;Initial Catalog=VisualAnalytic;Integrated Security=True";           // SQL Server Connection String

                            using (SqlBulkCopy bulkCopy = new SqlBulkCopy(sqlConnectionString))                                        // Bulk Copy to SQL Server
                            {
                                bulkCopy.DestinationTableName = "Comments";                                                   // provide destination table name
                                // addMessage("1",DateTime.Today);
                                bulkCopy.WriteToServer(dr);
                                lblMsg.Text = "The data has been exported succefuly ";
                            }
                        }
                    }
                }

                catch (Exception ex)
                {
                    lblMsg.Text = ex.Message;
                }
            }
        }
    }
}