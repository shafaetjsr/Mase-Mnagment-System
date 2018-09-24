using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MSM.report
{
    public partial class TotalMeal : System.Web.UI.Page
    {
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
    }
}