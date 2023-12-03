<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllCorreios.aspx.cs" Inherits="CorreioApplication.AllCorreios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="Styles/Global.css" />
    <link rel="stylesheet" href="Styles/Components/Header.css" />
    <link rel="stylesheet" href="Styles/Components/Inbox.css" />
    <link rel="stylesheet" href="Styles/AllCorreios.css" />
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
            <section class="inbox-box">
                <div class="inbox-text">
                    <asp:Label ID="LblTotal" runat="server" Text="Total: 0"></asp:Label>
                    <asp:Label ID="LblNotRead" runat="server" Text="Not read: 0"></asp:Label>
                    <asp:Label ID="LblRead" runat="server" Text="Read: 0"></asp:Label>
                </div>
                <div runat="server" id="DivInboxList" class="inbox-list"></div>
            </section>
        </div>
    </form>
</body>
</html>
