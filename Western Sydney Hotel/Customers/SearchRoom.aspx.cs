using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

namespace Western_Sydney_Hotel.Customers
{
    public partial class SearchRoom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /* Submit to database */
        protected void submit_Click(object sender, EventArgs e)
        {

            if (IsValid)
            {
                SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"|DataDirectory|\\WesternHotel.mdf\";Integrated Security=True");

                String sql = "";
                if (orientation.Text == "-1")
                {
                    sql = "select rid, beds, orientation, price from rooms where beds = @num_bed and" +
                        " rooms.rid not in (select rooms.rid from rooms inner join bookings on" +
                        " rooms.beds = @num_bed and rooms.rid = bookings.rid and @checkin< bookings.checkout and" +
                        " @checkout > bookings.checkin)";
                } else
                {
                    sql = "select rid, beds, orientation, price from rooms where beds = @num_bed and orientation = @ori and" +
                        " rooms.rid not in (select rooms.rid from rooms inner join bookings on" +
                        " rooms.beds = @num_bed and rooms.orientation = @ori and" +
                        " rooms.rid = bookings.rid and @checkin< bookings.checkout and" +
                        " @checkout > bookings.checkin)";
                }

         
                SqlCommand cmd = new SqlCommand(sql, con);


                cmd.Parameters.AddWithValue("@num_bed", beds.Text);
                cmd.Parameters.AddWithValue("@ori", orientation.Text);
                cmd.Parameters.AddWithValue("@checkin", DateTime.Parse(checkin.Text).ToString("yyyy/MM/dd"));
                cmd.Parameters.AddWithValue("@checkout", DateTime.Parse(checkout.Text).ToString("yyyy/MM/dd"));

                using (con)
                {
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dataTable = new DataTable();
                    da.Fill(dataTable);
                    GridView1.DataSource = dataTable;
                    GridView1.DataBind();
                    con.Close();
                }

            }


        }


        /* Check-in Range validate */
        protected void checkinValidate(object source, ServerValidateEventArgs args)
        {
            DateTime checkinDate = DateTime.Parse(checkin.Text).Date;
            DateTime todayDate = DateTime.Now.Date;
            int result = DateTime.Compare(checkinDate, todayDate);

            if (result < 0)
            {
                args.IsValid = false;
            }

        }

        /* Check-out Range validate */
        protected void checkoutValidate(object source, ServerValidateEventArgs args)
        {
            DateTime checkinDate = DateTime.Parse(checkin.Text).Date;
            DateTime checkoutDate = DateTime.Parse(checkout.Text).Date;
            int result = DateTime.Compare(checkoutDate, checkinDate);

            if (result == 0 || result < 0)
            {
                args.IsValid = false;
            }

        }
    }
}