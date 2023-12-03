<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="CorreioApplication.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="Styles/Global.css" />
    <link rel="stylesheet" href="Styles/Components/Header.css" />
    <link rel="stylesheet" href="Styles/Components/Inbox.css" />
    <link rel="stylesheet" href="Styles/Home.css" />
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
            <div class="content-box">
                <div class="left-content">
                    <section class="user-status">
                        <div>
                            <asp:Label ID="LblHello" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="status">
                            <asp:Label ID="LblSala" runat="server" Text=""></asp:Label>
                            <asp:Label ID="LblReceived" runat="server" Text=""></asp:Label>
                            <asp:Label ID="LblSent" runat="server" Text=""></asp:Label>
                            <div>
                                <asp:Button ID="BtnLogOff" runat="server" Text="Log off" OnClick="BtnLogOff_Click" />
                            </div>
                        </div>
                    </section>
                    <section class="send-letter">
                        <p>Are you in love? Send a Correio.</p>
                        <asp:Button ID="BtnNewLetter" runat="server" Text="Write new letter" OnClick="BtnNewLetter_Click" />
                    </section>
                </div>
                <section class="inbox-box">
                    <div class="inbox-text">
                        <p>Inbox</p>
                        <asp:Label ID="LblNotifications" runat="server" Text="0"></asp:Label>
                    </div>
                    <div runat="server" id="DivInboxList" class="inbox-list"></div>
                    <div class="see-full-letters">
                        <asp:Button ID="BtnSeeAll" runat="server" Text="See all Correios" OnClick="BtnSeeAll_Click" />
                    </div>
                </section>
            </div>
        </div>
    </form>
</body>
</html>
