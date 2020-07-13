<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin login.aspx.cs" Inherits="Grupp_Allmän_handling.Admin_login" %>

    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
        <link href="Main.css" rel="stylesheet" />

        <title>Admin Login</title>
    </head>

    <body class="text-center">
        <form id="Login" runat="server">
            <div class="form-signin">
                <div class="py-5">
                    <img class="mb-4" src="munkedalkommun.png" />
                    <h1 class="h3 mb-2 font-weight-bold">Hantering av allmän handling</h1>
                </div>
                <div class="login border">
                    <div class="form-group">
                        <label class="float-left" for="buttonUsername">Användarnamn</label>
                        <div>
                            <asp:TextBox ID="buttonUsername" class="form-control" placeholder="Användarnamn" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="float-left" for="buttonPassword">Lösenord</label>
                        <div>
                            <asp:TextBox ID="buttonPassword" placeholder="Lösenord" class="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div>
                        <asp:Button CssClass="btn btn-primary float-right" ID="Submit" runat="server" OnClick="Submit_Click" Text="Logga in" />
                    </div>
                </div>
                <div class="felmeddelande">
                    <asp:TextBox disabled="disabled" CssClass="text-center" style="border:none" ID="felmeddelande" runat="server"></asp:TextBox>
                </div>
            </div>
        </form>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>

    </html>