<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CreateAccount.aspx.cs" Inherits="DigitalImage.CreateAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <center><h2 style="color:purple; border-style:groove; margin-right: 90px; margin-left: 90px">Create a New Account</h2></center>
    <center>**In order to add your account to the Online Digital Library you will need to first create a user account.</center>
    
    <center><b>Fill out the following form to create a new Account</b></center> 
    <br />
    <center>
    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" CancelDestinationPageUrl="~/WebForm1.aspx" 
        ContinueDestinationPageUrl="~/DigitalAdmin/ManageCategories.aspx" 
        DisplayCancelButton="true" Font-Size="Large" BorderStyle="Ridge" BackColor="PapayaWhip">
        
        <LabelStyle ForeColor="#9900FF" />
        <TitleTextStyle Height="40px" />
        <WizardSteps>
<asp:CreateUserWizardStep runat="server"></asp:CreateUserWizardStep>
<asp:CompleteWizardStep runat="server"></asp:CompleteWizardStep>
</WizardSteps>
        <HeaderStyle ForeColor="#FF0066" />
        
    </asp:CreateUserWizard>
    </center>
</asp:Content>
