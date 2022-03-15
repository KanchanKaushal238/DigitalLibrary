<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DigitalAlbum.aspx.cs" Inherits="DigitalImage.DigitalAlbum" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center><h1 style="color: #993399">
        Digital Album
    </h1></center>
    <br />
    <h3 style="background-color: #FF99FF; color: #990099">Filter Pictures By Category</h3>

    <asp:SqlDataSource ID="categoriesDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyconnectionString %>" SelectCommand="SELECT [CategoryID], [Name] FROM [Categories] WHERE ([UserId] = @UserId) ORDER BY [Name]">
        <SelectParameters>
            <asp:QueryStringParameter Name="UserId" QueryStringField="ID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:DropDownList ID="categories1" runat="server" AppendDataBoundItems="true" DataSourceID="categoriesDataSource1" DataTextField="Name" DataValueField="CategoryID" AutoPostBack="true" Height="41px" Width="174px" BackColor="#FFCCFF">
        <asp:ListItem Value="">--All--</asp:ListItem>
    </asp:DropDownList>

    <asp:SqlDataSource ID="picturesDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyconnectionString %>" SelectCommand="SELECT [PictureID], [Title], [UploadedOn] FROM [Pictures] WHERE (([UserId] = @UserId) AND ([CategoryID] = @CategoryID))">
        <SelectParameters>
            <asp:QueryStringParameter Name="UserId" QueryStringField="ID" />
            <asp:ControlParameter ControlID="categories1" Name="CategoryID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PictureID" DataSourceID="picturesDataSource1" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" Width="797px">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="PictureID" DataNavigateUrlFormatString="~/DigitalDetail.aspx?ID={0}" Text="ViewComments" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="UploadedOn" HeaderText="UploadedOn" SortExpression="UploadedOn" />
            <asp:ImageField DataImageUrlField="PictureID" DataImageUrlFormatString="~/UploadedImages/{0}.jpg">
                <ControlStyle Height="300px" Width="300px" />
            </asp:ImageField>
        </Columns>
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <SortedAscendingCellStyle BackColor="#FAFAE7" />
        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
        <SortedDescendingCellStyle BackColor="#E1DB9C" />
        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
    </asp:GridView>





    </asp:Content>
