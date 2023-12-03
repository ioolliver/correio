<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReadLetter.aspx.cs" Inherits="CorreioApplication.ReadLetter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="Styles/Global.css" />
    <link rel="stylesheet" href="Styles/Components/Header.css" />
    <link rel="stylesheet" href="Styles/ReadLetter.css" />
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
                <div class="manage-correio">
                    <asp:Label ID="LblAutor" runat="server" Text="Sent by: "></asp:Label>
                    <asp:Button ID="BtnMarkAsRead" runat="server" Text="Mark as read" OnClick="BtnMarkAsRead_Click" />
                    <asp:Button ID="BtnReply" runat="server" Text="Reply" OnClick="BtnReply_Click" />
                </div>
                <div class="carta-box">
                    <div class="heart-shape">
                        <asp:Label ID="LblMensagem" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </section>
        </div>
    </form>
</body>
</html>
