using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

public partial class Dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Panel4.Visible = true;
        bar1.Visible = false;
        bar2.Visible = false;
        bar3.Visible = false;
        bar4.Visible = false;
        bubble1.Visible = false;
        bubble2.Visible = false;
        bubble3.Visible = false;
        treelayout.Visible = false;
        packlayout.Visible = false;
        treemap.Visible = false;
        dua1Bar.Visible = false;
        donutChart.Visible = false;       
    }

      
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = false;
        Panel3.Visible = false;
        Panel4.Visible = false;
        Panel5.Visible = true;
        Panel6.Visible = false;
        Panel7.Visible = false;
        Panel8.Visible = false;
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = false;
        Panel3.Visible = false;
        Panel4.Visible = false;
        Panel5.Visible = false;
        Panel6.Visible = false;
        Panel7.Visible = false;
        Panel8.Visible = false;
      
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        Panel3.Visible = true;
        Panel1.Visible = false;
        Panel2.Visible = false;
        Panel4.Visible = false;
        Panel5.Visible = false;
        Panel6.Visible = false;
        Panel7.Visible = false;
        Panel8.Visible = false;
      
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = false;
        Panel3.Visible = false;
        Panel4.Visible = false;
        Panel5.Visible = false;
        Panel6.Visible = false;
        Panel7.Visible = false;
        Panel8.Visible = false;
    }
    protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
    {
        Panel1.Visible = true;
        Panel2.Visible = false;
        Panel3.Visible = false;
        Panel4.Visible = false;
        Panel5.Visible = false;
        Panel6.Visible = false;
        Panel7.Visible = false;
        Panel8.Visible = false;
    }
    protected void ImageButton6_Click(object sender, ImageClickEventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = false;
        Panel3.Visible = false;
        Panel4.Visible = false;
        Panel5.Visible = false;
        Panel6.Visible = true;
        Panel7.Visible = false;
        Panel8.Visible = false;

    }
    protected void ImageButton7_Click(object sender, ImageClickEventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = false;
        Panel3.Visible = false;
        Panel4.Visible = false;
        Panel5.Visible = false;
        Panel6.Visible = false;
        Panel7.Visible = true;
        Panel8.Visible = false;
    }
    protected void ImageButton8_Click(object sender, ImageClickEventArgs e)
    {
         Panel2.Visible = true;
         Panel1.Visible = false;
         Panel3.Visible = false;
         Panel4.Visible = false;
         Panel5.Visible = false;
         Panel6.Visible = false;
         Panel7.Visible = false;
         Panel8.Visible = false;
    }
    
    protected void ImageButton9_Click(object sender, ImageClickEventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = false;
        Panel3.Visible = false;
        Panel4.Visible = false;
        Panel5.Visible = false;
        Panel6.Visible = false;
        Panel7.Visible = false;
        Panel8.Visible = false;
    }
    protected void ImageButton10_Click(object sender, ImageClickEventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = false;
        Panel3.Visible = false;
        Panel4.Visible = false;
        Panel5.Visible = false;
        Panel6.Visible = false;
        Panel7.Visible = false;
        Panel8.Visible = false;
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {

        string script = "<script type=\"text/javascript\" src=\"js/CollapsibleTree.js\"> </script>";
        ClientScript.RegisterStartupScript(this.GetType(), "bubble", script);
        RadioButtonList1.ClearSelection();
        Panel4.Visible = false;
        bar4.Visible = true;
        bubble1.Visible = true;
        bubble2.Visible = true;
        bubble3.Visible = true;
    }
    protected void RadioButtonList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList3.SelectedIndex == 0)
        {
            string script = "<script type=\"text/javascript\" src=\"js/BubbleChart2Twitter.js\"> </script>";
            ClientScript.RegisterStartupScript(this.GetType(), "bubble", script);
            RadioButtonList3.ClearSelection();
            Panel4.Visible = false;
            bar1.Visible = true;
            bar2.Visible = true;
            bar3.Visible = true;
            bar4.Visible = true;
        }
        else if(RadioButtonList3.SelectedIndex == 1)
        {
            string script = "<script type=\"text/javascript\" src=\"js/BubbleChart2Facebook.js\"> </script>";
            ClientScript.RegisterStartupScript(this.GetType(), "bubble", script);
            RadioButtonList3.ClearSelection();
            Panel4.Visible = false;
            bar2.Visible = true;
            bar3.Visible = true;
            bar4.Visible = true;
            bubble1.Visible = true;
           
        }
        else if (RadioButtonList3.SelectedIndex == 2)
        {
            string script = "<script type=\"text/javascript\" src=\"js/BubbleChart2Youtube.js\"> </script>";
            ClientScript.RegisterStartupScript(this.GetType(), "bubble", script);
            RadioButtonList3.ClearSelection();
            Panel4.Visible = false;
            bar3.Visible = true;
            bar4.Visible = true;
            bubble1.Visible = true;
            bubble2.Visible = true;
        }
        else
        {
            RadioButtonList3.ClearSelection();
            Panel4.Visible = false;
        }
        
    }
 
protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
{
    string script = "<script type=\"text/javascript\" src=\"js/TreeMap.js\"> </script>";
            ClientScript.RegisterStartupScript(this.GetType(), "bubble", script);
            RadioButtonList2.ClearSelection();
            Panel4.Visible = false;
            bubble3.Visible = true;
            treelayout.Visible = true;
            packlayout.Visible = true;
            dua1Bar.Visible = true;
}
protected void RadioButtonList4_SelectedIndexChanged(object sender, EventArgs e)
{
    if (RadioButtonList4.SelectedIndex == 0)
    {
        string script = "<script type=\"text/javascript\" src=\"js/SortableBarChart.js\"> </script>";
        ClientScript.RegisterStartupScript(this.GetType(), "bubble", script);
        RadioButtonList4.ClearSelection();
        Panel4.Visible = false;
    }
    else if(RadioButtonList4.SelectedIndex == 1)
    {
        string script = "<script type=\"text/javascript\" src=\"js/SortableBarChartTT.js\"> </script>";
        ClientScript.RegisterStartupScript(this.GetType(), "bubble", script);
        RadioButtonList4.ClearSelection();
        Panel4.Visible = false;
        bar1.Visible = true;
    }
    else if (RadioButtonList4.SelectedIndex == 2)
    {
        string script = "<script type=\"text/javascript\" src=\"js/SortableBarChartTW.js\"> </script>";
        ClientScript.RegisterStartupScript(this.GetType(), "bubble", script);
        RadioButtonList4.ClearSelection();
        Panel4.Visible = false;
        bar1.Visible = true;
        bar2.Visible = true;
    }
    else if (RadioButtonList4.SelectedIndex == 3)
    {
        string script = "<script type=\"text/javascript\" src=\"js/ParticipantsBarChart.js\"> </script>";
        ClientScript.RegisterStartupScript(this.GetType(), "bubble", script);
        RadioButtonList4.ClearSelection();
        Panel4.Visible = false;
        bar1.Visible = true;
        bar2.Visible = true;
        bar3.Visible = true;
    }
    else
    {
        RadioButtonList4.ClearSelection();
        Panel4.Visible = false;
    }
}
protected void RadioButtonList5_SelectedIndexChanged(object sender, EventArgs e)
{
    string script = "<script type=\"text/javascript\" src=\"js/PackLayout.js\"> </script>";
    ClientScript.RegisterStartupScript(this.GetType(), "bubble", script);
    RadioButtonList5.ClearSelection();
    Panel4.Visible = false;
    bubble1.Visible = true;
    bubble2.Visible = true;
    bubble3.Visible = true;
    treelayout.Visible = true;
}
protected void bar1_Click(object sender, ImageClickEventArgs e)
{
    string script = "<script type=\"text/javascript\" src=\"js/SortableBarChart.js\"> </script>";
    ClientScript.RegisterStartupScript(this.GetType(), "bubble", script);
    Panel1.Visible = false;
    Panel2.Visible = false;
    Panel3.Visible = false;
    Panel4.Visible = false;
    Panel5.Visible = true;
    Panel6.Visible = false;
    Panel7.Visible = false;
    Panel8.Visible = false;

}
protected void bar2_Click(object sender, ImageClickEventArgs e)
{
    string script = "<script type=\"text/javascript\" src=\"js/SortableBarChartTT.js\"> </script>";
    ClientScript.RegisterStartupScript(this.GetType(), "bubble", script);
    Panel1.Visible = false;
    Panel2.Visible = false;
    Panel3.Visible = false;
    Panel4.Visible = false;
    Panel5.Visible = true;
    Panel6.Visible = false;
    Panel7.Visible = false;
    Panel8.Visible = false;
}
protected void bar3_Click(object sender, ImageClickEventArgs e)
{
    string script = "<script type=\"text/javascript\" src=\"js/SortableBarChartTW.js\"> </script>";
    ClientScript.RegisterStartupScript(this.GetType(), "bubble", script);
    Panel1.Visible = false;
    Panel2.Visible = false;
    Panel3.Visible = false;
    Panel4.Visible = false;
    Panel5.Visible = true;
    Panel6.Visible = false;
    Panel7.Visible = false;
    Panel8.Visible = false;
}
protected void bar4_Click(object sender, ImageClickEventArgs e)
{
    string script = "<script type=\"text/javascript\" src=\"js/ParticipantsBarChart.js\"> </script>";
    ClientScript.RegisterStartupScript(this.GetType(), "bubble", script);
    Panel1.Visible = false;
    Panel2.Visible = false;
    Panel3.Visible = false;
    Panel4.Visible = false;
    Panel5.Visible = true;
    Panel6.Visible = false;
    Panel7.Visible = false;
    Panel8.Visible = false;
}
protected void bubble1_Click(object sender, ImageClickEventArgs e)
{
    string script = "<script type=\"text/javascript\" src=\"js/BubbleChart2Twitter.js\"> </script>";
    ClientScript.RegisterStartupScript(this.GetType(), "bubble", script);
    Panel3.Visible = true;
    Panel1.Visible = false;
    Panel2.Visible = false;
    Panel4.Visible = false;
    Panel5.Visible = false;
    Panel6.Visible = false;
    Panel7.Visible = false;
    Panel8.Visible = false;
}
protected void bubble2_Click(object sender, ImageClickEventArgs e)
{
    string script = "<script type=\"text/javascript\" src=\"js/BubbleChart2Facebook.js\"> </script>";
    ClientScript.RegisterStartupScript(this.GetType(), "bubble", script);
    Panel3.Visible = true;
    Panel1.Visible = false;
    Panel2.Visible = false;
    Panel4.Visible = false;
    Panel5.Visible = false;
    Panel6.Visible = false;
    Panel7.Visible = false;
    Panel8.Visible = false;
}

protected void bubble3_Click(object sender, ImageClickEventArgs e)
{
    string script = "<script type=\"text/javascript\" src=\"js/BubbleChart2Youtube.js\"> </script>";
    ClientScript.RegisterStartupScript(this.GetType(), "bubble", script);
    Panel3.Visible = true;
    Panel1.Visible = false;
    Panel2.Visible = false;
    Panel4.Visible = false;
    Panel5.Visible = false;
    Panel6.Visible = false;
    Panel7.Visible = false;
    Panel8.Visible = false;
}
protected void packlayout_Click(object sender, ImageClickEventArgs e)
{
    string script = "<script type=\"text/javascript\" src=\"js/PackLayout.js\"> </script>";
    ClientScript.RegisterStartupScript(this.GetType(), "bubble", script);
    Panel1.Visible = false;
    Panel2.Visible = false;
    Panel3.Visible = false;
    Panel4.Visible = false;
    Panel5.Visible = false;
    Panel6.Visible = true;
    Panel7.Visible = false;
    Panel8.Visible = false;
}
protected void treelayout_Click(object sender, ImageClickEventArgs e)
{
    string script = "<script type=\"text/javascript\" src=\"js/CollapsibleTree.js\"> </script>";
    ClientScript.RegisterStartupScript(this.GetType(), "bubble", script);
    Panel1.Visible = true;
    Panel2.Visible = false;
    Panel3.Visible = false;
    Panel4.Visible = false;
    Panel5.Visible = false;
    Panel6.Visible = false;
    Panel7.Visible = false;
    Panel8.Visible = false;

}
protected void treemap_Click(object sender, ImageClickEventArgs e)
{
    string script = "<script type=\"text/javascript\" src=\"js/TreeMap.js\"> </script>";
    ClientScript.RegisterStartupScript(this.GetType(), "bubble", script);
    Panel2.Visible = true;
    Panel1.Visible = false;
    Panel3.Visible = false;
    Panel4.Visible = false;
    Panel5.Visible = false;
    Panel6.Visible = false;
    Panel7.Visible = false;
    Panel8.Visible = false;
}
protected void RadioButtonList6_SelectedIndexChanged(object sender, EventArgs e)
{
    string script = "<script type=\"text/javascript\" src=\"js/doubleBarChart.js\"> </script>";
    ClientScript.RegisterStartupScript(this.GetType(), "bubble", script);
    RadioButtonList6.ClearSelection();
    Panel4.Visible = false;
    bubble2.Visible = true;
    bubble3.Visible = true;
    treelayout.Visible = true;
    packlayout.Visible = true;
}
protected void dua1Bar_Click(object sender, ImageClickEventArgs e)
{
    string script = "<script type=\"text/javascript\" src=\"js/doubleBarChart.js\"> </script>";
    ClientScript.RegisterStartupScript(this.GetType(), "bubble", script);
    Panel1.Visible = false;
    Panel2.Visible = false;
    Panel3.Visible = false;
    Panel4.Visible = false;
    Panel5.Visible = false;
    Panel6.Visible = false;
    Panel7.Visible = true;
    Panel8.Visible = false;
}
protected void ImageButton11_Click(object sender, ImageClickEventArgs e)
{
    Panel1.Visible = false;
    Panel2.Visible = false;
    Panel3.Visible = false;
    Panel4.Visible = false;
    Panel5.Visible = false;
    Panel6.Visible = false;
    Panel7.Visible = false;
    Panel8.Visible = true;
}
protected void RadioButtonList7_SelectedIndexChanged(object sender, EventArgs e)
{
    if (RadioButtonList7.SelectedIndex == 0)
    {
        string script = "<script type=\"text/javascript\" src=\"js/DonutChart.js\"> </script>";
        ClientScript.RegisterStartupScript(this.GetType(), "bubble", script);
        RadioButtonList7.ClearSelection();
        Panel4.Visible = false;
        bubble2.Visible = true;
        bubble3.Visible = true;
        treelayout.Visible = true;
        packlayout.Visible = true;
    }
    else if (RadioButtonList7.SelectedIndex == 1)
    {
        string script = "<script type=\"text/javascript\" src=\"js/ParticipantsDonutChart.js\"> </script>";
        ClientScript.RegisterStartupScript(this.GetType(), "bubble", script);
        RadioButtonList7.ClearSelection();
        Panel4.Visible = false;
        bubble3.Visible = true;
        treelayout.Visible = true;
        packlayout.Visible = true;
        donutChart.Visible = true;
    }
    else if (RadioButtonList7.SelectedIndex == 2)
    {
        string script = "<script type=\"text/javascript\" src=\"js/DonutFollowers.js\"> </script>";
        ClientScript.RegisterStartupScript(this.GetType(), "bubble", script);
        RadioButtonList7.ClearSelection();
        Panel4.Visible = false;
        bubble3.Visible = true;
        treelayout.Visible = true;
        packlayout.Visible = true;
        donutChart.Visible = true;
    }
}
protected void donutChart_Click(object sender, ImageClickEventArgs e)
{
    string script = "<script type=\"text/javascript\" src=\"js/DonutChart.js\"> </script>";
    ClientScript.RegisterStartupScript(this.GetType(), "bubble", script);
    Panel1.Visible = false;
    Panel2.Visible = false;
    Panel3.Visible = false;
    Panel4.Visible = false;
    Panel5.Visible = false;
    Panel6.Visible = false;
    Panel7.Visible = false;
    Panel8.Visible = true;
}
}