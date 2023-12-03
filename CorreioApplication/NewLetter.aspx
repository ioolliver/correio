<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewLetter.aspx.cs" Inherits="CorreioApplication.NewLetter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="Styles/Global.css" />
    <link rel="stylesheet" href="Styles/Components/Header.css" />
    <link rel="stylesheet" href="Styles/NewLetter.css" />
    <link rel="icon" type="image/svg" href="Assets/correio.svg" />
    <title>Correio</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <header>
                <a href="Landing.aspx" class="logo">
                    <img src="Assets/correio.svg" alt="Correio's logo" />
                    <h1>Correio</h1>
                </a>
            </header>
            <section class="content-box">
                <div class="sending-to">
                    <div>
                        <p>Filter by class:</p>
                        <asp:ListBox OnSelectedIndexChanged="FiltroSalas_SelectedIndexChanged" AutoPostBack="true" Rows="1" ID="FiltroSalas" runat="server">
                            <asp:ListItem Value="1ds">1ºDS</asp:ListItem>
                            <asp:ListItem Value="1elo">1ºELO</asp:ListItem>
                            <asp:ListItem Value="1edi">1ºEDI</asp:ListItem>
                            <asp:ListItem Value="1ma">1ºMA</asp:ListItem>
                            <asp:ListItem Value="1adm">1ºADM</asp:ListItem>
                            <asp:ListItem Value="2ds">2ºDS</asp:ListItem>
                            <asp:ListItem Value="2elo">2ºELO</asp:ListItem>
                            <asp:ListItem Value="2edi">2ºEDI</asp:ListItem>
                            <asp:ListItem Value="2ma">2ºMA</asp:ListItem>
                            <asp:ListItem Value="2adm">2ºADM</asp:ListItem>
                            <asp:ListItem Value="3ds">3ºDS</asp:ListItem>
                            <asp:ListItem Value="3elo">3ºELO</asp:ListItem>
                            <asp:ListItem Value="3edi">3ºEDI</asp:ListItem>
                            <asp:ListItem Value="3ma">3ºMA</asp:ListItem>
                            <asp:ListItem Value="3adm">3ºADM</asp:ListItem>
                        </asp:ListBox>
                    </div>
                    <div>
                        <p>Sending to:</p>
                        <asp:ListBox EnableViewState="true" AutoPostBack="true" Rows="1" ID="ListaPeople" runat="server"></asp:ListBox>
                    </div>
                    <div class="send-correio">
                        <asp:Button ID="BtnSend" runat="server" Text="Send it" OnClick="BtnSend_Click" />
                        <asp:Label ID="LblStatus" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                <div class="write-heart">
                    <div class="heart-shape">
                        <asp:TextBox MaxLength="100" TextMode="MultiLine" ID="InputMensagem" runat="server"></asp:TextBox>
                    </div>
                </div>
            </section>
        </div>
    </form>
</body>
</html>
