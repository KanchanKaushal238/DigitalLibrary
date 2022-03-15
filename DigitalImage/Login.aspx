<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DigitalImage.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <center>
        <h2 style="color:purple; border-style:groove; margin-right: 60px; margin-left: 60px">
        Login to the site
    </h2>
    <asp:Login ID="Login1" runat="server" CreateUserText="Create An Account" CreateUserUrl="~/CreateAccount.aspx" TitleText=""></asp:Login>
        </center>
</asp:Content>
