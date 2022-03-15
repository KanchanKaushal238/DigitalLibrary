<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DigitalDetail.aspx.cs" Inherits="DigitalImage.DigitalDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="pictureDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MyconnectionString %>" SelectCommand="SELECT [PictureID], [Title], [Description] FROM [Pictures] WHERE ([PictureID] = @PictureID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="PictureID" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="PictureID" DataSourceID="pictureDataSource" ForeColor="Black" GridLines="None" Height="50px" Width="551px">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <Fields>
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:ImageField DataImageUrlField="PictureID" DataImageUrlFormatString="~/UploadedImages/{0}.jpg">
            </asp:ImageField>
        </Fields>
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
    </asp:DetailsView>
    <br />
    <br />
    <center>
        <asp:SqlDataSource ID="commentsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MyconnectionString %>" DeleteCommand="DELETE FROM [Comments] WHERE [CommentID] = @CommentID" InsertCommand="INSERT INTO [Comments] ([UserId], [PictureID], [Subject], [Body], [CommentMadeOn]) VALUES (@UserId, @PictureID, @Subject, @Body, @CommentMadeOn)" SelectCommand="SELECT * FROM [Comments] WHERE ([PictureID] = @PictureID) ORDER BY [CommentMadeOn] DESC" UpdateCommand="UPDATE [Comments] SET [UserId] = @UserId, [PictureID] = @PictureID, [Subject] = @Subject, [Body] = @Body, [CommentMadeOn] = @CommentMadeOn WHERE [CommentID] = @CommentID">
            <DeleteParameters>
                <asp:Parameter Name="CommentID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="UserId" />
                <asp:Parameter Name="PictureID" Type="Int32" />
                <asp:Parameter Name="Subject" Type="String" />
                <asp:Parameter Name="Body" Type="String" />
                <asp:Parameter Name="CommentMadeOn" Type="DateTime" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="PictureID" QueryStringField="ID" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="UserId"  />
                <asp:Parameter Name="PictureID" Type="Int32" />
                <asp:Parameter Name="Subject" Type="String" />
                <asp:Parameter Name="Body" Type="String" />
                <asp:Parameter Name="CommentMadeOn" Type="DateTime" />
                <asp:Parameter Name="CommentID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
       
    <asp:LoginView ID="LoginView2" runat="server">
        <AnonymousTemplate>
            Only Logged In Users Can View Comments<br />
            <asp:LoginStatus ID="LoginStatus1" runat="server" BackColor="#FFCCFF" />
        </AnonymousTemplate>
        <LoggedInTemplate>

            <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataKeyNames="CommentID" DataSourceID="commentsDataSource" Height="50px" Width="546px" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DefaultMode="Insert" OnItemInserting="DetailsView2_ItemInserting">
                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <Fields>
                    <asp:TemplateField HeaderText="Subject" SortExpression="Subject">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Subject") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Subject") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="R1" runat="server" ErrorMessage="Subject should not be empty" ControlToValidate="TextBox1" Display="Dynamic"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Subject") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Body" SortExpression="Body">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Body") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Body") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="R2" runat="server" ErrorMessage="Body should not be empty" ControlToValidate="TextBox2" Display="Dynamic"></asp:RequiredFieldValidator>
                        
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Body") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField CancelText="" InsertText="Add a New Comment" ShowInsertButton="True" />
                </Fields>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            </asp:DetailsView>

        </LoggedInTemplate>
    </asp:LoginView>
        </center>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CommentID" DataSourceID="commentsDataSource" Width="824px">
        <Columns>
            <asp:BoundField DataField="CommentID" HeaderText="CommentID" InsertVisible="False" ReadOnly="True" SortExpression="CommentID" />
            <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" />
            <asp:BoundField DataField="PictureID" HeaderText="PictureID" SortExpression="PictureID" />
            <asp:BoundField DataField="Subject" HeaderText="Subject" SortExpression="Subject" />
            <asp:BoundField DataField="Body" HeaderText="Body" SortExpression="Body" />
            <asp:BoundField DataField="CommentMadeOn" HeaderText="CommentMadeOn" SortExpression="CommentMadeOn" />
        </Columns>
    </asp:GridView>
   
    
</asp:Content>
