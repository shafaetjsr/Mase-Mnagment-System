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
    public partial class mealentry : System.Web.UI.Page
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
            cmd = new SqlCommand("sp_meal_entry", con);
            cmd.Parameters.Add("@m_date", SqlDbType.VarChar).Value = txtdate.Text;
            cmd.Parameters.Add("@membar_id", SqlDbType.VarChar).Value = txtid.Text;
            cmd.Parameters.Add("@p_meal", SqlDbType.VarChar).Value = txtamount.Text;
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/mealentry.aspx");
        }
    }
}