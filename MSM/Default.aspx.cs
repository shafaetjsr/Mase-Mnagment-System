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
    public partial class Default : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["dbconn"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlParameter parameter = new SqlParameter("@name", txtUser.Text.Trim());
            SqlParameter parameter1 = new SqlParameter("@pass", txtpass.Text.Trim());
            SqlCommand cmd = new SqlCommand("sp_login", con);
            cmd.Parameters.Add(parameter);
            cmd.Parameters.Add(parameter1);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if(dr.Read())
            {
                Session["name"] = dr["name"];
                Response.Redirect("Home.aspx");
            }
            else
            {
                lblmsg.Text = "Incorrect user or password";
            }
            con.Close();
        }
    }
}