using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MSM
{
    public partial class Result : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["dbconn"].ConnectionString);
        SqlCommand cmd = new SqlCommand();

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddDays(-1));
            Response.Cache.SetNoStore();

            if (!Page.IsPostBack)
            {
                if (Session["name"] == null)
                {
                    Response.Redirect("~/Default.aspx");
                }
                lbluser.Text = "Welcme to " + Session["name"].ToString();
            }
        }
        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session.Remove("name");
            Response.Redirect("~/Default.aspx");
        }

        protected void btnSearch_Click1(object sender, EventArgs e)
        {
            con.Open();
            cmd.CommandText = "sp_total_balance";
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@id", txtSearch.Text);
            cmd.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(dt);
            gvsearch.DataSource = dt;
            gvsearch.DataBind();
        }
    }
}