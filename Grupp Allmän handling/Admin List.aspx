<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin List.aspx.cs" Inherits="Grupp_Allmän_handling.Admin_List" %>

    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
        <link href="Main.css" rel="stylesheet" />
        <title>Admin list</title>
    </head>

    <body>
        <form id="form1" class="adminlist" runat="server">
            <img class="m-3" src="munkedalkommun.png" /><asp:Button CssClass="float-right btn-primary btn mt-5" ID="LogOut" runat="server" Text="Logga ut" OnClick="LogOut_Click" />
                &nbsp;<h1 class="h3 mb-2 mt-2 ml-5 font-weight-bold">Hantering av allmän handling</h1>
            <div class="SearchForm form-group float-right">
                <p class="font-weight-bold" runat="server" id="SearchMessage">Sök ärenden</p>
                <label class="font-weight-bold" for="searchText">Sök ärenden</label>
                <div>
                    <asp:TextBox ID="searchText" runat="server"></asp:TextBox>
                    <asp:Button ID="searchButton" runat="server" CssClass="btn btn-primary" OnClick="searchButton_Click" Text="Sök" />
                </div>
            </div>
            <div class="List container mt-5">
                <div runat="server" id="HeaderGridSearchResult">
                    <p>Sökresultat:</p>
                </div>
                <asp:GridView ID="GridSearchResult" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" ItemStyle-Width="5%" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                        <asp:BoundField DataField="Firstname" HeaderText="Förnamn" ItemStyle-Width="15%" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                        <asp:BoundField DataField="Lastname" HeaderText="Efternamn" ItemStyle-Width="15%" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                        <asp:BoundField DataField="RefNumber" HeaderText="Diarienummer" ItemStyle-Width="10%" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                        <asp:BoundField DataField="Country" HeaderText="Land" ItemStyle-Width="15%" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                        <asp:BoundField DataField="Adress" HeaderText="Address" ItemStyle-Width="15%" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                        <asp:BoundField DataField="Description" HeaderText="Beskrivning" ItemStyle-Width="50%" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                        <asp:HyperLinkField ItemStyle-Width="10%" HeaderText="Hela Ärendet" Text="Öppna" HeaderStyle-CssClass="text-center" datanavigateurlfields="ID" datanavigateurlformatstring="~\Admin Edit.aspx?ID={0}" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                <div class="float-right" runat="server" id="HeaderGridSearchResultButton">
                    <asp:Button name="Avbryt" cssclass="btn btn-primary mt-4 mb-2" Text="Avbryt sökning" runat="server" OnClick="Avbryt_Click"></asp:Button>
                </div>
                <div runat="server" id="HeaderNotStarted">
                    <p>Ej påbörjade ärenden</p>
                </div>
                <asp:GridView ID="GridNotStarted" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" ItemStyle-Width="5%" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                        <asp:BoundField DataField="Firstname" HeaderText="Förnamn" ItemStyle-Width="15%" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                        <asp:BoundField DataField="Lastname" HeaderText="Efternamn" ItemStyle-Width="15%" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                        <asp:BoundField DataField="RefNumber" HeaderText="Diarienummer" ItemStyle-Width="10%" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                        <asp:BoundField DataField="Country" HeaderText="Land" ItemStyle-Width="15%" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                        <asp:BoundField DataField="Adress" HeaderText="Address" ItemStyle-Width="15%" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                        <asp:BoundField DataField="Description" HeaderText="Beskrivning" ItemStyle-Width="50%" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                        <asp:HyperLinkField ItemStyle-Width="10%" HeaderText="Hela Ärendet" Text="Öppna" HeaderStyle-CssClass="text-center" datanavigateurlfields="ID" datanavigateurlformatstring="~\Admin Edit.aspx?ID={0}" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                <div runat="server" id="HeaderGridOngoing">
                    <p>Pågående Ärenden</p>
                </div>
                <asp:GridView ID="gridOngoing" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" ItemStyle-Width="5%" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                        <asp:BoundField DataField="Firstname" HeaderText="Förnamn" ItemStyle-Width="15%" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                        <asp:BoundField DataField="Lastname" HeaderText="Efternamn" ItemStyle-Width="15%" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                        <asp:BoundField DataField="RefNumber" HeaderText="Diarienummer" ItemStyle-Width="10%" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                        <asp:BoundField DataField="Country" HeaderText="Land" ItemStyle-Width="15%" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                        <asp:BoundField DataField="Adress" HeaderText="Address" ItemStyle-Width="15%" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                        <asp:BoundField DataField="Description" HeaderText="Beskrivning" ItemStyle-Width="50%" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                        <asp:HyperLinkField ItemStyle-Width="10%" HeaderText="Hela Ärendet" Text="Öppna" HeaderStyle-CssClass="text-center" datanavigateurlfields="ID" datanavigateurlformatstring="~\Admin Edit.aspx?ID={0}" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                <div runat="server" class="mt-4" id="HeaderGridFinished">
                    <p>Avslutade Ärenden</p>
                </div>
                <asp:GridView ID="gridFinished" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" ItemStyle-Width="5%" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                        <asp:BoundField DataField="Firstname" HeaderText="Förnamn" ItemStyle-Width="15%" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                        <asp:BoundField DataField="Lastname" HeaderText="Efternamn" ItemStyle-Width="15%" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                        <asp:BoundField DataField="RefNumber" HeaderText="Diarienummer" ItemStyle-Width="10%" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                        <asp:BoundField DataField="Country" HeaderText="Land" ItemStyle-Width="15%" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                        <asp:BoundField DataField="Adress" HeaderText="Address" ItemStyle-Width="15%" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                        <asp:BoundField DataField="Description" HeaderText="Beskrivning" ItemStyle-Width="50%" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" />
                        <asp:HyperLinkField ItemStyle-Width="10%" HeaderText="Hela Ärendet" Text="Öppna" HeaderStyle-CssClass="text-center" datanavigateurlfields="ID" datanavigateurlformatstring="~\Admin Edit.aspx?ID={0}" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </div>
        </form>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>

    </html>