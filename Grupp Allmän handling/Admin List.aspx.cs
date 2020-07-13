using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using EService_WebService;
using System.Web.Security;

namespace Grupp_Allmän_handling
{
    public partial class Admin_List : System.Web.UI.Page
    {
        ServiceReference1.EServiceClient client = new ServiceReference1.EServiceClient();
       

        protected void Page_Load(object sender, EventArgs e)
        {
            //Kollar om användaren är inloggad
            bool NotLoggedIn = (System.Web.HttpContext.Current.User != null) && System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
            if (NotLoggedIn == true)
            {
                Response.Redirect("Admin Login.aspx");
            }

            GridSearchResult.Visible = false;
            HeaderGridSearchResult.Visible = false;
            SearchMessage.Visible = false;
            HeaderGridSearchResultButton.Visible = false;

            //Hämta lista med ej påbörjade ärenden från databasen och visa i gridview
            GridNotStarted.DataSource = client.GetNonStartedCases().Select(o => new
            {
                ID = o.Id,
                Firstname = o.ApplicantsFirstName,
                Lastname = o.ApplicantsSurname,
                RefNumber = o.RefNumber,
                Country = o.CountryOfApplicants,
                Adress = o.ApplicantsAddress,
                Description = o.Description
            }).ToList();
            GridNotStarted.DataBind();

            //Hämta lista med pågående ärenden från databasen och visa i gridview
            gridOngoing.DataSource = client.GetStartedCases().Select(o => new
            {
                ID = o.Id,
                Firstname = o.ApplicantsFirstName,
                Lastname = o.ApplicantsSurname,
                RefNumber = o.RefNumber,
                Country = o.CountryOfApplicants,
                Adress = o.ApplicantsAddress,
                Description = o.Description
            }).ToList();
            gridOngoing.DataBind();

            //Hämta lista med asvlutade ärenden från databasen och visa i gridview
            gridFinished.DataSource = client.GetClosedCases().Select(o => new
            {
                ID = o.Id,
                Firstname = o.ApplicantsFirstName,
                Lastname = o.ApplicantsSurname,
                RefNumber = o.RefNumber,
                Country = o.CountryOfApplicants,
                Adress = o.ApplicantsAddress,
                Description = o.Description
            }).ToList();
            gridFinished.DataBind();


        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            //Tar bort listor vid sökning

            HeaderGridFinished.Visible = false;
            HeaderGridOngoing.Visible = false;
            gridOngoing.Visible = false;
            gridFinished.Visible = false;
            GridNotStarted.Visible = false;
            HeaderNotStarted.Visible = false;


            //Skicka användarens sökord till webb service
            string SearchWord = searchText.Text;
            GridSearchResult.DataSource = client.GetCasesFromSearchWord(SearchWord).Select(o => new
            {
                ID = o.Id,
                Firstname = o.ApplicantsFirstName,
                Lastname = o.ApplicantsSurname,
                RefNumber = o.RefNumber,
                Country = o.CountryOfApplicants,
                Adress = o.ApplicantsAddress,
                Description = o.Description
            }).ToList();
            GridSearchResult.DataBind();

            //Om det fanns några sökresultat eller inte för det sökta ordet
            if (GridSearchResult.Rows.Count == 0)
            {
                SearchMessage.InnerText = "Inga sökresultat, försök igen";
                SearchMessage.Visible = true;
                HeaderGridFinished.Visible = true;
                HeaderGridOngoing.Visible = true;
                gridOngoing.Visible = true;
                gridFinished.Visible = true;
                GridNotStarted.Visible = true;
                HeaderNotStarted.Visible = true;
            }
            else
            {
                HeaderGridSearchResultButton.Visible = true;
                SearchMessage.Visible = false;
                HeaderGridSearchResult.Visible = true;
                GridSearchResult.Visible = true;
            }



            
        }

        //Avbryt sökning
        protected void Avbryt_Click(object sender, EventArgs e)
        {
            HeaderGridFinished.Visible = true;
            HeaderGridOngoing.Visible = true;
            gridOngoing.Visible = true;
            gridFinished.Visible = true;
        }

        //Logga ut
        protected void LogOut_Click(object sender, EventArgs e)
        {
            
            FormsAuthentication.SignOut();
            Response.Redirect("Admin login.aspx");
        }
    }
}