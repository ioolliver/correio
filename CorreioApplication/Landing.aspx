<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Landing.aspx.cs" Inherits="CorreioApplication.Landing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="Styles/Global.css" />
    <link rel="stylesheet" href="Styles/Components/Header.css" />
    <link rel="stylesheet" href="Styles/Landing.css" />
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
            <section>
                <div class="section-logo">
                    <img src="Assets/Correio.svg" alt="Correio's logo" />
                </div>
                <div class="slogan">
                    <h2>You don't got a cupid? Let Correio play cupid for you.</h2>
                    <div>
                        <a href="Login.aspx">I want it!</a>
                    </div>
                </div>
            </section>
        </div>
    </form>
</body>
</html>
