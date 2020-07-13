using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EService_WebService;

namespace Grupp_Allmän_handling
{
    public partial class Admin_Editmode : System.Web.UI.Page
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

            //Hämtar ID från querystring som skicakts från Admin List
            int CurrentID = int.Parse(Request.QueryString["ID"]);


            HeaderEdit.InnerText = "Hantering av ärende ID " + CurrentID;

            //Beroende på status så visas olika knappar
            //En knapp för att avsluta och en för börja projektet
            if(client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.Status).FirstOrDefault() == "Pågående")
            {
                CloseCase.Visible = true;
                OpenCase.Visible = false;
            }
            if (client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.Status).FirstOrDefault() == "Ejstartad")
            {
                OpenCase.Visible = true;
                CloseCase.Visible = false;
            }
            if(client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.Status).FirstOrDefault() == "Avslutad")
            {
                CloseCase.Visible = false;
                OpenCase.Visible = true;
            }

            //Sätter formulär värden vid laddning av sidan
            //Går endast igenom förta gången sidan laddas
            if (!IsPostBack)
            {
                if (client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.Description).FirstOrDefault() != null)
                {
                    FormDescription.InnerText = client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.Description).FirstOrDefault();
                }

                if (client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.RequestMotivation).FirstOrDefault() != null)
                {
                    FormMotivation.InnerText = client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.RequestMotivation).FirstOrDefault();
                }

                if (client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.RefNumber).FirstOrDefault() != null)
                {
                    FormRefNumber.Value = client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.RefNumber).FirstOrDefault().ToString();
                }

                if (client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.Date).FirstOrDefault() != null)
                {
                    FormDate.Value = client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.Date).FirstOrDefault().ToString().TrimEnd('0', ':');
                }

                if (client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.CourtName).FirstOrDefault() != null)
                {
                    FormCourt.Value = client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.CourtName).FirstOrDefault().ToString();
                }

                if (client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.DeliveryOption).FirstOrDefault() != null)
                {
                    FormDeliveryoption.Value = client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.DeliveryOption).FirstOrDefault().ToString();
                }

                if (client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.ApplicantsFirstName).FirstOrDefault() != null)
                {
                    FormFirstname.Value = client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.ApplicantsFirstName).FirstOrDefault().ToString();
                }

                if (client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.ApplicantsSurname).FirstOrDefault() != null)
                {
                    FormLastname.Value = client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.ApplicantsSurname).FirstOrDefault().ToString();
                }

                if (client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.ApplicantsEmail).FirstOrDefault() != null)
                {
                    FormEmail.Value = client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.ApplicantsEmail).FirstOrDefault().ToString();
                }

                if (client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.ApplicantsPhoneNumber).FirstOrDefault() != null)
                {
                    FormPhoneNumber.Value = client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.ApplicantsPhoneNumber).FirstOrDefault().ToString();
                }

                if (client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.CountryOfApplicants).FirstOrDefault() != null)
                {
                    FormCountry.Value = client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.CountryOfApplicants).FirstOrDefault().ToString();
                }

                if (client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.CityOfApplicants).FirstOrDefault() != null)
                {
                    FormCity.Value = client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.CityOfApplicants).FirstOrDefault().ToString();
                }

                if (client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.ApplicantsAddress).FirstOrDefault() != null)
                {
                    FormAdress.Value = client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.ApplicantsAddress).FirstOrDefault().ToString();
                }

                if (client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.ApplicantsPostalNumber).FirstOrDefault() != null)
                {
                    FormPostalNumber.Value = client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.ApplicantsPostalNumber).FirstOrDefault().ToString();
                }
                
                if (client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.EmploymentDocumentsCategory).FirstOrDefault() == "True")
                {
                    FormCategory.Value = "EmploymentDocumentsCategory";
                }

                else if (client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.EmploymentOfEmployeesCategory).FirstOrDefault() == "True")
                {
                    FormCategory.Value = "EmploymentOfEmployeesCategory";
                }

                else if (client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.OccupationPensionCategory).FirstOrDefault() == "true")
                {
                    FormCategory.Value = "OccupationPensionCategory";
                }

                else if (client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.OtherCategory).FirstOrDefault() == "True")
                {
                    FormCategory.Value = "OtherCategory";
                }

                else if (client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.RetirementCategory).FirstOrDefault() == "true")
                {
                    FormCategory.Value = "RetirementCategory";
                }

                //Kollar vilken secrecy som är vald
                if (client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.FullySecrecy).FirstOrDefault() != null)
                {
                    if (client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.FullySecrecy).FirstOrDefault().ToString() == "True")
                    {
                        FormCaseSecrecy.Value = "Whole";
                    }
                }
                if (client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.PartlySecrecy).FirstOrDefault() != null)
                {
                    if (client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.PartlySecrecy).FirstOrDefault().ToString() == "True")
                        {
                            FormCaseSecrecy.Value = "Partly";
                        }
                }
                if (client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.NoneSecrecy).FirstOrDefault() != null)
                {
                    if (client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.NoneSecrecy).FirstOrDefault().ToString() == "True")
                        {
                            FormCaseSecrecy.Value = "Nothing";
                        }
                }

                if (client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.Comment).FirstOrDefault() != null)
                {
                    FormComment.Value = client.GetAllCases().Where(o => o.Id == CurrentID).Select(o => o.Comment).FirstOrDefault().ToString();
                }
            }
            

        }

        //Tillbaka till Admin list
        protected void BackToStart_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin list.aspx");
        }

        //sparar ner ändringar gjorda på sekretess och kommentar för ärendet
        protected void SaveChanges_Click(object sender, EventArgs e)
        {
            Case EditCase = new Case();
            EditCase.Id = int.Parse(Request.QueryString["ID"]);
            EditCase.Comment = FormComment.Value;
            if(FormCaseSecrecy.Value == "Whole")
            {
                EditCase.FullySecrecy = "True";
            }
            else if(FormCaseSecrecy.Value == "Nothing")
            {
                EditCase.NoneSecrecy = "True";
            }
            else if(FormCaseSecrecy.Value == "Partly")
            {
                EditCase.PartlySecrecy = "True";
            }

            client.EditCase(EditCase);
        }

        //Sätter status på ärendet till avslutad
        protected void CloseCase_Click(object sender, EventArgs e)
        {
            Case EditCase = new Case();
            EditCase.Id = int.Parse(Request.QueryString["ID"]);
            EditCase.Status = "Avslutad";

            client.EditCase(EditCase);
            CloseCase.Visible = false;
            OpenCase.Visible = true;
        }

        //sätter status på ärendet till pågående
        protected void OpenCase_Click(object sender, EventArgs e)
        {
            Case EditCase = new Case();
            EditCase.Id = 1;
            EditCase.Status = "Pågående";

            client.EditCase(EditCase);
            CloseCase.Visible = true;
            OpenCase.Visible = false;
        }


    }
}