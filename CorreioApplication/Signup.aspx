<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="CorreioApplication.Signup" %>

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
                    <h1>Sign up in Correio</h1>
                    <div class="campos">
                        <div class="campo">
                            <span>Name</span>
                            <asp:TextBox ID="InputName" runat="server"></asp:TextBox>
                        </div>
                        <div class="campo">
                            <span>E-mail</span>
                            <asp:TextBox ID="InputEmail" runat="server"></asp:TextBox>
                        </div>
                        <div class="campo">
                            <span>Password</span>
                            <asp:TextBox ID="InputPassword" runat="server"></asp:TextBox>
                        </div>
                        <div class="campo">
                            <span>Class</span>
                            <asp:ListBox Rows="1" ID="ListSalas" runat="server">
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
                    </div>
                    <div class="campo">
                        <asp:Button ID="ButtonEntrar" runat="server" Text="Sign Up" OnClick="ButtonEntrar_Click" />
                        <asp:Label ID="LblAviso" runat="server" Text=""></asp:Label>
                        <a href="Login.aspx">Already has an account? Log in</a>
                    </div>
                </div>
            </section>
        </div>
    </form>
</body>
</html>
