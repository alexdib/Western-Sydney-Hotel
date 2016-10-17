using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Western_Sydney_Hotel.Customers
{
    public partial class MyBookings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Set My Bookings Gridview SQL Data Source username from logged in identity name
            SqlDataSource1.SelectParameters["username"].DefaultValue = Context.User.Identity.Name;
        }
    }
}