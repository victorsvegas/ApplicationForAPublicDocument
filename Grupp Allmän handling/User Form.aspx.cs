using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EService_WebService;

namespace Grupp_Allmän_handling
{
    public partial class User_Form : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int ApplicantsPostalNumber;
            int RefNumber;
            string EmploymentDocumentsCategory = "";
            string EmploymentOfEmployeesCategory = "";
            string OccupationPensionCategory = "";
            string RetirementCategory = "";
            string OtherCategory = "";

            if (anonymousCheck.Checked == true)
            {
                anonymousCheck.Value = "True";
            }
            else
            {
                anonymousCheck.Value = "False";

            }

            //Kategorier
            string kategori = categoriSelect.Value.ToString();
            if (kategori == "EmploymentDocumentsCategory")
            {
                EmploymentDocumentsCategory = "True";
                EmploymentOfEmployeesCategory = "False";
                OccupationPensionCategory = "False";
                RetirementCategory = "False";
                OtherCategory = "False";
            }
            else if (kategori == "EmploymentOfEmployeesCategory")
            {
                EmploymentDocumentsCategory = "False";
                EmploymentOfEmployeesCategory = "True";
                OccupationPensionCategory = "False";
                RetirementCategory = "False";
                OtherCategory = "False";
            }
            else if (kategori == "OccupationPensionCategory")
            {
                EmploymentDocumentsCategory = "False";
                EmploymentOfEmployeesCategory = "False";
                OccupationPensionCategory = "True";
                RetirementCategory = "False";
                OtherCategory = "False";
            }
            else if (kategori == "RetirementCategory")
            {
                EmploymentDocumentsCategory = "False";
                EmploymentOfEmployeesCategory = "False";
                OccupationPensionCategory = "False";
                RetirementCategory = "True";
                OtherCategory = "False";
            }
            else if (kategori == "OtherCategory")
            {
                EmploymentDocumentsCategory = "False";
                EmploymentOfEmployeesCategory = "False";
                OccupationPensionCategory = "False";
                RetirementCategory = "False";
                OtherCategory = "True";
            }

            //Leverans
            string LeveransMetod = "";
            if (RadioKommunhuset.Checked == true)
            {
                LeveransMetod = RadioKommunhuset.Value.ToString();
            }
            else if (RadioEmail.Checked == true)
            {
                LeveransMetod = RadioEmail.Value.ToString();
            }
            else if (RadioPosten.Checked == true)
            {
                LeveransMetod = RadioPosten.Value.ToString();
            }


            //Kopplar till webbservice
            ServiceReference1.EServiceClient client = new ServiceReference1.EServiceClient();

            //ger variabler värden
            string ApplicantsFirstName = Firstname.Value.ToString();
            string ApplicantsSurname = Lastname.Value.ToString();

            if (FormRefNumber.Value.Length == 0)
            {
                RefNumber = 0;
            }
            else
            {
                RefNumber = int.Parse(FormRefNumber.Value.ToString());

            }

            string CourtName = courtSelect.Value.ToString();
            string CountryOfApplicants = Country.Value.ToString();
            string CityOfApplicants = City.Value.ToString();
            DateTime Date = Convert.ToDateTime(FormDate.Value.ToString());
            string Description = FormDescription.Value.ToString();
            string DeliveryOption = LeveransMetod;
            string ApplicantsAddress = Adress.Value.ToString();
            string ApplicantsPhoneNumber = PhoneNumber.Value.ToString();
            

            if (PostalNumber.Value.Length == 0)
            {
                ApplicantsPostalNumber = 0;
            }
            else
            {
                ApplicantsPostalNumber = int.Parse(PostalNumber.Value.ToString());


            }
            string RequestMotivation = Motivation.Value.ToString();
            string ApplicantsEmail = Email.Value.ToString();
            string Anonymous = anonymousCheck.Value.ToString();
            DateTime DateOfCreatedCase = DateTime.Now;

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "msg", "alert('Anmälan inskickad')", true);

            //ger newCase formulär värden
            Case newCase = new Case();
            newCase.ApplicantsFirstName = ApplicantsFirstName;
            newCase.ApplicantsSurname = ApplicantsSurname;
            newCase.RefNumber = RefNumber;
            newCase.CourtName = CourtName;
            newCase.CountryOfApplicants = CountryOfApplicants;
            newCase.CityOfApplicants = CityOfApplicants;
            newCase.Date = Date;
            newCase.Description = Description;
            newCase.DeliveryOption = DeliveryOption;
            newCase.ApplicantsAddress = ApplicantsAddress;
            newCase.ApplicantsPhoneNumber = ApplicantsPhoneNumber;
            newCase.ApplicantsPostalNumber = ApplicantsPostalNumber;
            newCase.RequestMotivation = RequestMotivation;
            newCase.ApplicantsEmail = ApplicantsEmail;
            newCase.Anonymous = Anonymous;
            newCase.EmploymentDocumentsCategory = EmploymentDocumentsCategory;
            newCase.EmploymentOfEmployeesCategory = EmploymentOfEmployeesCategory;
            newCase.OccupationPensionCategory = OccupationPensionCategory;
            newCase.RetirementCategory = RetirementCategory;
            newCase.OtherCategory = OtherCategory;

            //Skickar värderna till webbservicen och skapar ett nytt ärende
            client.CreateCase(newCase);
        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "msg", "alert('Anmälan inskickad')", true);
        }
    }
}