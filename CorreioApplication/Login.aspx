<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CorreioApplication.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="Styles/Global.css" />
    <link rel="stylesheet" href="Styles/Components/Header.css" />
    <link rel="stylesheet" href="Styles/Login.css" />
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
                <div class="login-box">
                    <h1>Log in Correio</h1>
                    <div class="campos">
                        <div class="campo">
                            <span>E-mail</span>
                            <asp:TextBox ID="InputEmail" runat="server"></asp:TextBox>
                        </div>
                        <div class="campo">
                            <span>Password</span>
                            <asp:TextBox ID="InputPassword" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="campo">
                        <asp:Button ID="ButtonEntrar" runat="server" Text="Log In" OnClick="ButtonEntrar_Click" />
                        <asp:Label ID="LblAviso" runat="server" Text=""></asp:Label>
                        <a href="Signup.aspx">Don't have an account? Sign up</a>
                    </div>
                </div>
            </section>
        </div>
    </form>
</body>
</html>
