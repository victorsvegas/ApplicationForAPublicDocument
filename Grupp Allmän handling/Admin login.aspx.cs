using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Grupp_Allmän_handling
{
    public partial class Admin_login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            
             ServiceReference1.EServiceClient client = new ServiceReference1.EServiceClient();

            //Kolla ifall användarnamn eller lösenord saknas
            if (string.IsNullOrWhiteSpace(buttonPassword.Text) || string.IsNullOrWhiteSpace(buttonUsername.Text))
            {
                felmeddelande.Text = "Användarnamn eller Lösenord saknas. Försök igen";
            }
            else
            {
                string username = buttonUsername.Text;
                string password = buttonPassword.Text;
                //Kolla med webbserven om login är korrekt
                if(client.ValidLogin(username, password) == true)
                {
                    //Skapa cookie och skicka vidare till nästa sida
                  FormsAuthentication.RedirectFromLoginPage(username, true);
                  Response.Redirect("Admin List.aspx");
                }
                else
                {
                    felmeddelande.Text = "Användarnamn och/eller Lösenord är fel. Försök igen";
                } 

            }
        }
    }
}