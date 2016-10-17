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
    public partial class BookRoom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getRooms();
            }
        }



        /* Submit to database */
        protected void submit_Click(object sender, EventArgs e)
        {

            if (IsValid)
            {

                SqlConnection connection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"|DataDirectory|\\WesternHotel.mdf\";Integrated Security=True");
                string sql = "INSERT INTO bookings (rid, username, checkin, checkout, cost, btime)"
                    + " VALUES (@rid, @username, @checkin, @checkout, @cost, @btime)";
                SqlCommand cmd = new SqlCommand(sql, connection);

                double price = getRoomCost(roomid.SelectedValue);
                DateTime StartDate = DateTime.Parse(checkin.Text);
                DateTime EndDate = DateTime.Parse(checkout.Text);

                double days = (EndDate - StartDate).TotalDays;
                double cost = Math.Round(price * days, 2);

                cmd.Parameters.AddWithValue("@rid", roomid.Text);
                cmd.Parameters.AddWithValue("@username", Context.User.Identity.Name);
                cmd.Parameters.AddWithValue("@checkin", DateTime.Parse(checkin.Text).ToString("yyyy/MM/dd"));
                cmd.Parameters.AddWithValue("@checkout", DateTime.Parse(checkout.Text).ToString("yyyy/MM/dd"));
                cmd.Parameters.AddWithValue("@cost", cost);
                cmd.Parameters.AddWithValue("@btime", DateTime.Now);

                using (connection)
                {
                    connection.Open();
                    cmd.ExecuteNonQuery();
                }

                String msg = "Booking was successfully made with the following details:\\n"
                    + "----------------------------------------------\\n"
                    + "Room booked: " + roomid.Text + "\\n"
                    + "Check-in: " + checkin.Text + "\\n"
                    + "Check-out: " + checkout.Text + "\\n"
                    + "Cost: " + cost + "\\n"
                    + "----------------------------------------------\\n";

                // Send alert message when submitted successfully and redirect to Book Room
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "'); window.location = 'BookRoom';", true);

            }
        }

        /* get room price */
        protected double getRoomCost(String roomid)
        {
            SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"|DataDirectory|\\WesternHotel.mdf\";Integrated Security=True");
            string sql = "SELECT price FROM rooms WHERE rid=@rid";

            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@rid", roomid);

            using (con)
            {
                con.Open();
                return (double)cmd.ExecuteScalar();
            }
        }


        /* get all room id's */
        protected void getRooms()
        {
            SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"|DataDirectory|\\WesternHotel.mdf\";Integrated Security=True");
            String sql = "SELECT rid FROM rooms";
            SqlCommand cmd = new SqlCommand(sql, con);

            using (con)
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dataTable = new DataTable();
                da.Fill(dataTable);
                roomid.DataSource = dataTable;
                roomid.DataTextField = "rid";
                roomid.DataValueField = "rid";
                roomid.DataBind();
                con.Close();
            }
        }

        /* Room validate */
        protected void roomValidate(object source, ServerValidateEventArgs args)
        {
            SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"|DataDirectory|\\WesternHotel.mdf\";Integrated Security=True");
            String sql = "select count(*) from bookings where rid=@rid and @checkin< bookings.checkout and @checkout > bookings.checkin";

            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@rid", roomid.Text);
            cmd.Parameters.AddWithValue("@checkin", DateTime.Parse(checkin.Text).ToString("yyyy/MM/dd"));
            cmd.Parameters.AddWithValue("@checkout", DateTime.Parse(checkout.Text).ToString("yyyy/MM/dd"));

            using (con)
            {
                con.Open();
                int rowCount = (int)cmd.ExecuteScalar();
                if (rowCount != 0)
                {
                    args.IsValid = false;
                }                
                con.Close();
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