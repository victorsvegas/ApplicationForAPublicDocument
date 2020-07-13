<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin Edit.aspx.cs" Inherits="Grupp_Allmän_handling.Admin_Editmode" %>

    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <link href="AdminCss.css" rel="stylesheet" />
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>

        <title>Redigering Admin</title>
    </head>

    <body>

        <form id="form1" runat="server">
            <div class="container">
                <img class="m-3" src="munkedalkommun.png"/>
                <h3 runat="server" id="HeaderEdit"></h3>
                <hr />
                <h4>Ärendeuppgifter: </h4>
                <div class="form-group">
                    <!--Beskrivning -->
                    <div class="DivSize">
                        <label for="beskrivning">Ärende Beskrivning</label>
                        <textarea style="height:150px;" class="form-control" id="FormDescription" name="Description" placeholder="Saknas" aria-describedby="inputGroupPrepend2" runat="server" readonly="readonly"></textarea>
                    </div>
                    <!--Beskrivning -->

                    <!--Motivering -->
                    <div class="DivSize">
                        <label for="motivering">Motivering</label>
                        <textarea style="width:100%; height:150px;" class="form-control" id="FormMotivation" placeholder="Saknas" name="Motivation" aria-describedby="inputGroupPrepend2" runat="server" readonly="readonly"></textarea>
                    </div>
                    <!--Motivering -->

                    <!--Diarenummer -->
                    <div class="DivSize">
                        <label for="diarenummer">Diarenummer</label>
                        <input type="text" class="form-control" id="FormRefNumber" placeholder="Saknas" runat="server" name="RefNumber" readonly=""/>

                        <!--Ungefärligt årtal -->
                        <label for="Date">Ungefärligt datum</label>
                        <input type="text" class="form-control" id="FormDate" placeholder="Saknas" name="Date" runat="server" readonly=""/>
                    </div>

                    <!--tingsrätt -->
                    <div class="DivSize">
                        <label for="courtSelect">Tingsrätten där målet är avgjort</label>
                        <input type="text" class="form-control" id="FormCourt" placeholder="Saknas" runat="server" name="Court" readonly=""/>
                    </div>
                    <!--tingsrätt -->

                    <!--kategorier -->
                    <label for="categoriSelect">Kategori</label>
                    <div class="DivSize">
                        <input type="text" class="form-control" id="FormCategory" placeholder="Saknas" runat="server" name="Category" readonly=""/>
                    </div>
                    <!--kategorier -->
                </div>
                <hr />
                <h4>Personuppgifter: </h4>
                <!-- kontaktad -->
                <label for="categoriSelect">Kontaktad via</label>
                <div class="DivSize">
                    <input type="text" class="form-control" id="FormDeliveryoption" placeholder="Saknas" runat="server" name="Deliveryoption" readonly=""/>
                </div>
                <!-- Kontaktad-->

                <!-- Via namn-->
                <div>
                    <!-- Förnamn-->
                    <div class="form-row">
                        <div class="col-md-4 mb-3">
                            <label for="Firstname">Förnamn</label>
                            <input type="text" class="form-control" id="FormFirstname" placeholder="Saknas" name="Firstname" runat="server" readonly=""/>
                        </div>

                        <!-- Efternamn-->
                        <div class="col-md-4 mb-3">
                            <label for="Lastname">Efternamn</label>
                            <input type="text" class="form-control" id="FormLastname" placeholder="Saknas" name="Lastname" runat="server" readonly=""/>
                        </div>
                    </div>
                </div>
                <!-- Via namn-->

                <!-- Via epost-->
                <div>
                    <!-- epost-->
                    <div class="form-row">
                        <div class="col-md-4 mb-3">
                            <label for="Email">E-post</label>
                            <input type="email" class="form-control" id="FormEmail" placeholder="Saknas" name="Email" runat="server" readonly="readonly"/>

                        </div>
                        <!-- Via telefon-->

                        <div class="col-md-4 mb-3">
                            <label for="PhoneNumber">Telefonnummer</label>
                            <input type="tel" class="form-control" id="FormPhoneNumber" placeholder="Saknas" name="PhoneNumber" runat="server" readonly=""/>

                        </div>
                    </div>

                </div>

                <!-- Via post-->
                <div>
                    <!-- Land-->
                    <div class="form-row">
                        <div class="col-md-4 mb-3">
                            <label for="Country">Land</label>
                            <input type="text" class="form-control" id="FormCountry" placeholder="Saknas" name="Country" runat="server" readonly=""/>
                        </div>

                        <!-- Stad-->
                        <div class="col-md-4 mb-3">
                            <label for="City">Stad</label>
                            <input type="text" class="form-control" id="FormCity" placeholder="Saknas" name="City" runat="server" readonly=""/>
                        </div>
                    </div>

                    <!-- adress-->
                    <div class="form-row">
                        <div class="col-md-4 mb-3">
                            <label for="Adress">Adress</label>
                            <input type="email" class="form-control" id="FormAdress" placeholder="Saknas" name="Adress" runat="server" readonly=""/>
                        </div>

                        <!-- postnr-->
                        <div class="col-md-4 mb-3">
                            <label for="PostalNumber">Postnummer</label>
                            <input type="tel" class="form-control" id="FormPostalNumber" placeholder="Saknas" name="PostalNumber" runat="server" readonly=""/>
                        </div>
                    </div>

                </div>
                <hr />
                <h4>Alternativ för ärende: </h4>
                <!-- Sekretess-->
                <label for="categoriSelect">Sekretess</label>
                <div class="DivSize">
                    <select runat="server" class="form-control" id="FormCaseSecrecy">
                        <option id="NoSecrecy" value="Nothing">Ingen sekretess</option>
                        <option id="PartlySecrecy" value="Partly">Delvis sekretess</option>
                        <option id="FullSecrecy" value="Whole">Full sekretess</option>
                    </select>
                </div>
                <!--Sekretess -->

                <!-- Kommentar-->
                <div class="DivSize">
                    <label for="comment">Kommentar</label>
                    <input type="text" class="form-control" id="FormComment" placeholder="Lägg till egen notis om projektet" runat="server"/>
                </div>

                <div style="padding-top:15px;" class="form-group">
                    <asp:Button class="btn btn-primary" ID="BackToStart" runat="server" Text="Tillbaka till huvudmeny" OnClick="BackToStart_Click" />
                    <asp:Button class="btn btn-primary" ID="SaveChanges" runat="server" Text="Spara ändringar" OnClick="SaveChanges_Click" />
                    <asp:Button class="btn btn-primary" ID="CloseCase" runat="server" Text="Avsluta Ärende" OnClick="CloseCase_Click" />
                    <asp:Button class="btn btn-primary" ID="OpenCase" runat="server" Text="Påbörja Ärende" OnClick="OpenCase_Click" />
                </div>
            </div>
        </form>
    </body>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    </html>
