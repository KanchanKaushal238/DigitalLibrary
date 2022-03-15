<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="DigitalImage.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center><h2 style="color:blueviolet">
        Online Digital Library Home
    </h2>
        </center>
    <p>
       <center> <font style="color:saddlebrown">Welcome to Online Library. </font></center><br />
        To view an existing User's album simply click on the link below. 
        If you are interseted in your own album, you need to
        <br />
        <center><a href="CreateAccount.aspx" style ="font-size:20px">Create an Account</a></center>
        **If you already have an account please 
        <br />
        <center><a href ="Login.aspx" style ="font-size:20px">LogIn</a></center>
    </p><br />
    <asp:SqlDataSource ID ="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyconnectionString %>" SelectCommand="SELECT [UserId], [UserName] FROM [vw_aspnet_MembershipUsers] WHERE (([IsApproved] = @IsApproved) AND ([IsLockedOut] = @IsLockedOut)) ORDER BY [UserName]">
        <SelectParameters>
            <asp:Parameter DefaultValue="true" Name="IsApproved" Type="Boolean" />
            <asp:Parameter DefaultValue="false" Name="IsLockedOut" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <center>
    <asp:GridView ID ="GridView1" runat="server" AutoGenerateColumns="false" DataSourceID="SqlDataSource1" Width="80%">
        <Columns>
            <asp:BoundField DataField ="UserName" HeaderText ="UserName" SortExpression="UserName" />
            <asp:HyperLinkField runat="server" DataNavigateUrlFields="UserID" DataNavigateUrlFormatString="DigitalAlbum.aspx?ID={0}" Text="View Album" />
        </Columns>
    </asp:GridView>
        </center>
</asp:Content>
