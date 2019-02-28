using ChartMarkWeb.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChartMarkWeb
{
    public partial class AdminLoginForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();
            //Admin admin = null;
            //AdminsController controller = new AdminsController();
            //admin = controller.GetAdmin(username, password);
            //if (admin != null)
            //{
            //    Session["ADMIN_USER"] = admin;
            //    Response.Redirect("HomeManager.aspx");
            //}
            //else
            //{
            //    this.lbInvalidLogin.ForeColor = System.Drawing.Color.Red;
            //    this.txtPassword.Text = "";
            //}
        }
    }
}