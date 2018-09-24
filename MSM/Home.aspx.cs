using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MSM
{

    public partial class Home : System.Web.UI.Page
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
          totalmembar();
           totalmeal();
           totalcollection();
           totalcost();
           netAmount();
           perMalCost();
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session.Remove("name");
            Response.Redirect("~/Default.aspx");
        }

        double totalcolec=0;
        double totalc=0;
        double totalme=0;
        protected void totalmembar()
        {
            cmd = new SqlCommand("SELECT COUNT(*) FROM tbl_membar", con);
            con.Open();
            int count = (int)cmd.ExecuteScalar();
            con.Close();
            lbltotalmembar.Text = count.ToString();
        }
        protected void totalmeal()
        {
            cmd = new SqlCommand("select sum(p_meal) from tbl_meal", con);
            con.Open();
            totalme = (int)cmd.ExecuteScalar();
            con.Close();
            lbltotalmeal.Text = totalme.ToString();
        }
        protected void totalcollection()
        {
            cmd = new SqlCommand("select sum(amount) from tbl_paymnet", con);
            con.Open();
            totalcolec = (int)cmd.ExecuteScalar();
            con.Close();
            lbltotalcollection.Text = totalcolec.ToString();
        }
        protected void totalcost()
        {
            cmd = new SqlCommand("select sum(amount) from daily_cost", con);
            con.Open();
            totalc = (int)cmd.ExecuteScalar();
            con.Close();
            lbltotalcost.Text = totalc.ToString();
        }
        protected void netAmount()
        {
            double net = totalcolec - totalc;
            netamount.Text = net.ToString() ;
        }
        protected void perMalCost()
        {
            double net = totalc / totalme;
           // permealcost.Text = net.ToString();
            permealcost.Text = System.Math.Round(net, 2).ToString();
        }
    }
}