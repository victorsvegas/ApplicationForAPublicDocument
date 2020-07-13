<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User Form.aspx.cs" Inherits="Grupp_Allmän_handling.User_Form" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link href="Custom.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />

        <title>Ansökan av allmän handling</title>
</head>

<body>        
    <form id="form1" runat="server" action="WebForm.aspx" method="post">
        <div class="container">
          <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
            <img class="m-3" src="munkedalkommun.png" />
            <h1 class="h3 mb-4 mt-2 ml-5 font-weight-bold">Begäran av allmän handling</h1>
                  <div class="form-group">
                        <!--Beskrivning -->
                        <div class="form-row">
                            <div class="col-md-5 mb-3">
                                <a tabindex="0" class="tryckRuta" data-toggle="popover" data-trigger="focus" data-placement="left" data-content="I denna rutan ska du beskriva ärendet så noga och tydligt du kan"><img class="infoBild" src="bilder/Basic_Office-7-512.png" /></a>
                                <label for="beskrivning">Beskriv ditt ärende/önskemål så tydligt som möjligt</label>
                                <textarea style="width:300px; height:150px;" class="form-control" id="FormDescription" name="Description" placeholder="Beskrivning" aria-describedby="inputGroupPrepend2" runat="server" required=""></textarea>
                            </div>
                        </div>
                        <!--Beskrivning -->

                        <!--Motivering -->
                        <div class="form-row">
                            <div class="col-md-4 mb-3">
                                <a tabindex="0" class="tryckRuta" data-toggle="popover" data-trigger="focus" data-placement="left" data-content="I denna rutan ska du motivera varför då ska få  tillgång till handlingen"><img class="infoBild" src="bilder/Basic_Office-7-512.png" /></a>
                                <label for="motivering">Motivera utförligt varför du begär handlingen</label>
                                <textarea style="width:300px; height:150px;" class="form-control" id="Motivation" placeholder="Motivering" name="Motivation" aria-describedby="inputGroupPrepend2" runat="server" required=""></textarea>
                            </div>
                        </div>
                        <!--Motivering -->

                        <!--Diarenummer -->
                        <div class="form-row">
                            <div class="col-md-4 mb-3">
                                <a tabindex="0" class="tryckRuta" data-toggle="popover" data-trigger="focus" data-placement="left" data-content="I denna rutan kan du fylla i diarenummret för handlingen om du vet vad nummret är, annars kan det lämnas tomt "><img class="infoBild" src="bilder/Basic_Office-7-512.png" /></a>
                                <label for="diarenummer">Diarenummer</label>
                                <input type="text" class="form-control" id="FormRefNumber" placeholder="Diarenummer" runat="server" name="RefNumber"/>
                            </div>
                        </div>
                        <!--Diarenummer -->

                        <!--Ungefärligt årtal -->
                        <div class="form-row">
                            <div class="col-md-4 mb-3">
                                <a tabindex="0" class="tryckRuta" data-toggle="popover" data-trigger="focus" data-placement="left" data-content="I denna rutan kan du fylla i ett ungefärligt datum handlingen skedde "><img class="infoBild" src="bilder/Basic_Office-7-512.png" /></a>
                                <label for="Date">Ungefärligt Datum för informationen du söker</label>
                                <input type="date" class="form-control" id="FormDate" placeholder="Ungefärligt årtal" name="Date" runat="server" required=""/>
                            </div>
                        </div>
                        <!--Ungefärligt årtal -->

                        <!--tingsrätt -->
                        <label for="courtSelect">Tingsrätt där målet är avgjort</label>
                        <div class="form-row">
                            <a tabindex="0" class="tryckRuta" data-toggle="popover" data-trigger="focus" data-placement="left" data-content="I denna rutan kan du välja vilken tingsrätt handlingen har.. "><img class="infoBild" src="bilder/Basic_Office-7-512.png" /></a>

                            <select class="form-control" id="courtSelect" runat="server">
                                <option>Uddevalla tingsrätt</option>
                                <option>Trollhättan tingsrätt</option>
                            </select>
                        </div>
                        <!--tingsrätt -->

                        <!--kategorier -->
                        <label for="categoriSelect">Välj kategori</label>
                        <div class="form-row">
                            <a tabindex="0" class="tryckRuta" data-toggle="popover" data-trigger="focus" data-placement="left" data-content="Här kan du välja i vilken kategori din handling tillhör"><img class="infoBild" src="bilder/Basic_Office-7-512.png" /></a>

                            <select class="form-control" id="categoriSelect" runat="server">
                                <option >Kategori</option>
                                <option value="EmploymentOfEmployeesCategory">Anställning av medarbetare</option>
                                <option value="EmploymentDocumentsCategory">Handlingar upprättadeunder anställning</option>
                                <option value="OccupationPensionCategory">Avgång</option>
                                <option value="RetirementCategory">Tjänstepension</option>
                                <option value="OtherCategory">Övrigt</option>
                            </select>

                        </div>
                        <!--kategorier -->
                    </div>

                    <!--Anonym Checkbox -->
                    <div class="form-row">
                        <a tabindex="0" class="tryckRuta" data-toggle="popover" data-trigger="focus" data-placement="left" data-content="Den här rutan kan du kryssa i om du vill vara anonym"><img class="infoBild" src="bilder/Basic_Office-7-512.png" /></a>

                        <div class="form-group">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="anonymousCheck" name="Anonymous" runat="server" onclick="anonym();" />
                                <label class="form-check-label" for="anonymousCheck">Vill vara anonym</label>
                            </div>
                        </div>

                    </div>
                    <!--Anonym -->

                    <!-- kontaktad  -->
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="AppDeliveryOption" id="RadioKommunhuset" value="Kommunhuset" onclick="showKommun();" runat="server" required=""/>
                        <label class="form-check-label" for="Kommunhuset">Hämtas hos kommunhusets reception</label>
                    </div>

                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="AppDeliveryOption" id="RadioEmail" value="Email" onclick="showEmail();" runat="server" required=""/>
                        <label class="form-check-label" for="RadioEmail">Få via E-post</label>
                    </div>

                    <div class="form-check form-check-inline" id="anonymous">
                        <input class="form-check-input" type="radio" name="AppDeliveryOption" id="RadioPosten" value="Posten" onclick="showMail();" runat="server" required=""/>
                        <label class="form-check-label" for="RadioPosten">Få skickad med post</label>
                    </div>
                    <!-- Kontaktad-->

                    <!-- Via namn-->
                    <div class="form-row">
                         <div class="hide" id="deliverName">
                              <a tabindex="0" class="tryckRuta" data-toggle="popover" data-trigger="focus" data-placement="left" data-content="Här ska du fylla i vilka namn du vill hämta ut handlingen med. Namnen behöver inte vara äkta."><img class="infoBild" src="bilder/Basic_Office-7-512.png" /></a>
                         </div>
                        </div>
                    
                    <div class="hide" id="showName">                        
                        <!-- Förnamn-->
                        <div class="form-row">
                            <div class="col-md-4 mb-3">
                                <label id="LabelFirstname" for="Firstname">Förnamn</label>
                                <a tabindex="0" id="ShowFN" class="tryckRuta" data-toggle="popover" data-trigger="focus" data-placement="left" data-content="I denna rutan ska du fylla i vilket förnamn du vill hämta ut handlingen med"><img class="infoBild" src="bilder/Basic_Office-7-512.png" /></a>
                                <input type="text" class="form-control" id="Firstname" placeholder="Förnamn" name="Firstname" runat="server" required=""/>
                            </div>

                            <!-- Efternamn-->
                            <div class="col-md-4 mb-3">
                                <label for="Lastname">Efternamn</label>
                                <a tabindex="0" id="ShowLN" class="tryckRuta" data-toggle="popover" data-trigger="focus" data-placement="left" data-content="I denna rutan ska du fylla i vilket efternamn du vill hämta ut handlingen med"><img class="infoBild" src="bilder/Basic_Office-7-512.png" /></a>
                                <input type="text" class="form-control" id="Lastname" placeholder="Efternamn" name="Lastname" runat="server" required=""/>
                            </div>

                        </div>
                    </div>
                    <!-- Via namn-->

                    <!-- Via kommun-->
                    <div class="hide" id="showKommun">
                    </div>
                    <!-- Via kommun-->

                    <!-- Via epost-->
                    <div class="hide" id="showEmail">

                        <!-- epost-->
                        <div class="form-row">
                            <div class="col-md-4 mb-3">
                                <label for="Email">E-post</label>
                                <a tabindex="0" class="tryckRuta" data-toggle="popover" data-trigger="focus" data-placement="left" data-content="I denna rutan ska du fylla i din epost"><img class="infoBild" src="bilder/Basic_Office-7-512.png" /></a>
                                <input type="email" class="form-control" id="Email" placeholder="E-post" name="Email" runat="server" required=""/>
                            </div>
                        </div>

                    </div>

                    <!-- Via post-->
                    <div class="hide" id="showMail">

                        <!-- Land-->
                        <div class="form-row">
                            <div class="col-md-4 mb-3">
                                <label for="Country">Land</label>
                                <a tabindex="0" class="tryckRuta" data-toggle="popover" data-trigger="focus" data-placement="left" data-content="I denna rutan ska du fylla i vilket land du bor i"><img class="infoBild" src="bilder/Basic_Office-7-512.png" /></a>
                                <input type="text" class="form-control" id="Country" placeholder="Land" name="Country" runat="server" required=""/>
                            </div>

                            <!-- Stad-->
                            <div class="col-md-4 mb-3">
                                <label for="City">Stad</label>
                                <a tabindex="0" class="tryckRuta" data-toggle="popover" data-trigger="focus" data-placement="left" data-content="I denna rutan ska du fylla i vilken stad du bor i"><img class="infoBild" src="bilder/Basic_Office-7-512.png" /></a>
                                <input type="text" class="form-control" id="City" placeholder="Stad" name="City" runat="server" required=""/>
                            </div>
                        </div>

                        <!-- adress-->
                        <div class="form-row">
                            <div class="col-md-4 mb-3">
                                <label for="Adress">Adress</label>
                                <a tabindex="0" class="tryckRuta" data-toggle="popover" data-trigger="focus" data-placement="left" data-content="I denna rutan ska du fylla i vilken adress du bor på"><img class="infoBild" src="bilder/Basic_Office-7-512.png" /></a>
                                <input type="email" class="form-control" id="Adress" placeholder="Adress" name="Adress" runat="server" required=""/>
                            </div>

                            <!-- postnr-->
                            <div class="col-md-4 mb-3">
                                <label for="PostalNumber">Postnummer</label>
                                <a tabindex="0" class="tryckRuta" data-toggle="popover" data-trigger="focus" data-placement="left" data-content="I denna rutan ska du fylla i vilken postnummer du har"><img class="infoBild" src="bilder/Basic_Office-7-512.png" /></a>
                                <input type="text" class="form-control" id="PostalNumber" placeholder="Postnummer" name="PostalNumber" runat="server" required=""/>
                            </div>
                        </div>
                    </div>

                    <!-- Via telefon-->
                    <div class="hide" id="showTelephone">
                        <div class="form-row">
                            <div class="col-md-4 mb-3">
                                <label for="PhoneNumber">Telefonnummer</label>
                                <a tabindex="0" class="tryckRuta" data-toggle="popover" data-trigger="focus" data-placement="left" data-content="I denna rutan ska du fylla i ditt telefonnummer"><img class="infoBild" src="bilder/Basic_Office-7-512.png" /></a>
                                <input type="tel" class="form-control" id="PhoneNumber" placeholder="Telefonnummer" name="PhoneNumber" runat="server" required=""/>
                            </div>
                        </div>
                    </div>
                    <!-- Via telefon-->

                    <div style="padding-top:15px;" class="form-group">
                        <!-- <button id="Send" class="btn btn-primary" type="submit">Skicka anmälan</button>-->
                        <asp:Button class="btn btn-primary" ID="Button1" UseSubmitBehavior="false"  runat="server" Text="Skicka anmälan" OnClick="Button1_Click" />
                    </div>
        </div>
    </form>
</body>


      <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <script>
        $('.popover-dismiss').popover({
            trigger: 'focus'
        })
        $(function () {
            $('[data-toggle="popover"]').popover()
        })

        $(function () {
            $('.example-popover').popover({
                container: 'body'
            })
        })

        // Get the checkbox
        var checkBox = document.getElementById("anonymousCheck");
        var Email = document.getElementById("RadioEmail");
        var Mail = document.getElementById("RadioMail");
        var Kommun = document.getElementById('RadioKommunhuset')
        //visa med kommun
        function showKommun() {
            document.getElementById('showKommun').style.display = 'block';
            document.getElementById('showName').style.display = 'block';
            document.getElementById('showMail').style.display = 'none';
            document.getElementById('showEmail').style.display = 'none';

            if (checkBox.checked == true) {
                document.getElementById('deliverName').style.display = 'block';
            }
            else {
                document.getElementById('deliverName').style.display = 'none';
            }

        }
        //visa med epost
        function showEmail() {

            if (checkBox.checked == true) {
                document.getElementById('showTelephone').style.display = 'none';
            }
            else {
                document.getElementById('showTelephone').style.display = 'block';
            }

            document.getElementById('showEmail').style.display = 'block';
            document.getElementById('showName').style.display = 'block';
            document.getElementById('showMail').style.display = 'none';
            document.getElementById('showKommun').style.display = 'none';
        }
        //visa med post
        function showMail() {
            document.getElementById('showMail').style.display = 'block';
            document.getElementById('showName').style.display = 'block';
            document.getElementById('showTelephone').style.display = 'block';
            document.getElementById('showKommun').style.display = 'none';
            document.getElementById('showEmail').style.display = 'none';
        }
        /////////////

        function anonym() {

            // If the checkbox is checked, display the output text
            if (checkBox.checked == true) {
                document.getElementById('ShowFN').style.display = 'none';
                document.getElementById('ShowLN').style.display = 'none';

                if (Email.checkBox == true || Kommun.checked == true) {
                    document.getElementById('deliverName').style.display = 'block';
                }
                else { }

                document.getElementById('anonymous').style.display = 'none';
                document.getElementById('showMail').style.display = 'none';
                document.getElementById('showTelephone').style.display = 'none';

                if (document.getElementById('showEmail').style.display == 'none' && document.getElementById('showKommun').style.display == 'none') {
                    document.getElementById('showName').style.display = 'none';
                    document.getElementById('showTelephone').style.display = 'none';
                }
                else
                { }

            }
            else {
                document.getElementById('deliverName').style.display = 'none';
                document.getElementById('ShowFN').style.display = 'inline';
                document.getElementById('ShowLN').style.display = 'inline';

                document.getElementById('anonymous').style.display = 'inline';

                if (Email.checked == true && checkBox.checked == false) {
                    showEmail();
                    document.getElementById('deliverName').style.display = 'none';

                }
                else if (Mail.checked == true && checkBox.checked == false) {
                    showMail();
                    document.getElementById('deliverName').style.display = 'none';

                }

            }
        }
        </script>

</html>

