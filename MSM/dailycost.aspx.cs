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
    public partial class dailycost : System.Web.UI.Page
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

        protected void btnpayment_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("sp_daily_cost", con);
            cmd.Parameters.Add("@c_date", SqlDbType.VarChar).Value = txtdate.Text;
            cmd.Parameters.Add("@amount", SqlDbType.VarChar).Value = txttk.Text;
            cmd.Parameters.Add("@comment", SqlDbType.VarChar).Value = txtcom.Text;
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
             cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/dailycost.aspx");
        }
    }
}