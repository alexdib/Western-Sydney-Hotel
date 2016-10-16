using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using Western_Sydney_Hotel.Models;
using System.Data.SqlClient;

namespace Western_Sydney_Hotel.Account
{
    public partial class Register : Page
    {
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text };
            IdentityResult result = manager.Create(user, Password.Text);
            if (result.Succeeded)
            {
                // For more information on how to enable account confirmation and password reset please visit http://go.microsoft.com/fwlink/?LinkID=320771
                //string code = manager.GenerateEmailConfirmationToken(user.Id);
                //string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                //manager.SendEmail(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");

                SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"|DataDirectory|\\WesternHotel.mdf\";Integrated Security=True");
                string sql = "INSERT INTO [customers] ([username],[gname],[sname],[address],[suburb],[state],[postcode],[mobile])";
                sql += " VALUES (@User, @Gname, @Sname, @Suburb, @Address, @State, @Postcode, @Mobile)";
                SqlCommand cmd = new SqlCommand(sql, con);

                cmd.Parameters.AddWithValue("@User", Email.Text);
                cmd.Parameters.AddWithValue("@GName", Gname.Text);
                cmd.Parameters.AddWithValue("@SName", Sname.Text);
                cmd.Parameters.AddWithValue("@Address", Address.Text);
                cmd.Parameters.AddWithValue("@Suburb", Suburb.Text);
                cmd.Parameters.AddWithValue("@State", State.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Postcode", Postcode.Text);
                cmd.Parameters.AddWithValue("@Mobile", Mobile.Text);

                using (con)
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                IdentityResult resultAdd = manager.AddToRole(manager.FindByEmail(Email.Text).Id, "customers");
                signInManager.SignIn( user, isPersistent: false, rememberBrowser: false);
                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            }
            else 
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }
    }
}