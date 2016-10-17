using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Western_Sydney_Hotel
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.IsInRole("customers"))
            {
                CustomersDiv.Visible = true;
            }
            else if (HttpContext.Current.User.IsInRole("administrators"))
            {
                AdministratorsDiv.Visible = true;
            }
            else
            {
                AnonymousDiv.Visible = true;
            }
        }
    }
}