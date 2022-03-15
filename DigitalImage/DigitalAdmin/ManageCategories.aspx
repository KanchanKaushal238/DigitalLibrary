<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ManageCategories.aspx.cs" Inherits="DigitalImage.DigitalAdmin.ManageCategories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <center> <h3 style="background-color:purple; color:white">Manage Your Digital Album Categories Here.....</h3></center>
    <asp:Label ID="UserIdValue" runat="server" Visible="false"></asp:Label>
    <asp:SqlDataSource ID="categoriesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MyconnectionString %>" DeleteCommand="DELETE FROM [Categories] WHERE [CategoryID] = @CategoryID" InsertCommand="INSERT INTO [Categories] ([UserId], [Name]) VALUES (@UserId, @Name)" SelectCommand="SELECT [CategoryID], [UserId], [Name] FROM [Categories] WHERE ([UserId] = @UserId) ORDER BY [Name]" UpdateCommand="UPDATE [Categories] SET [UserId] = @UserId, [Name] = @Name WHERE [CategoryID] = @CategoryID">
        <DeleteParameters>
            <asp:Parameter Name="CategoryID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="UserId"  />
            <asp:Parameter Name="Name" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="UserIdValue" Name="UserId" PropertyName="Text" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="UserId" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="CategoryID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <br />

    <center><h3 style="font-family: 'Times New Roman'; text-decoration: underline; color: #800080; background-color: #FFFFFF">
        Add New Category
    </h3>

    <asp:DetailsView ID="DetailsView1" runat="server" DataSourceID="categoriesDataSource" AutoGenerateRows="False" DataKeyNames="CategoryID" DefaultMode="Insert" Width="250px" OnItemInserting="DetailsView1_ItemInserting">
        <Fields>
            <asp:TemplateField HeaderText="Name" SortExpression="Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name")%>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name")%>'></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Name must not be empty" ValidationGroup="CategoryInsert"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowInsertButton="true" CancelText="" ValidationGroup="CategoryInsert" />
        </Fields>
        <InsertRowStyle BackColor="#FF3399" VerticalAlign="Top" />
    </asp:DetailsView>
         </center>
    <br /><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataKeyNames="CategoryID" DataSourceID="categoriesDataSource" OnRowUpdating="GridView1_RowUpdating" Width="132px" EmptyDataText="You Currently do not have any categories">
        <Columns>
            <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" ValidationGroup="CategoryEdit" />

             <asp:TemplateField HeaderText="Name" SortExpression="Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name")%>'></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Name must not be empty" ValidationGroup="CategoryEdit"></asp:RequiredFieldValidator>


                </EditItemTemplate>

                 <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name")%>'></asp:Label>
                </ItemTemplate>
                
            </asp:TemplateField>

        </Columns>

    </asp:GridView>
       
</asp:Content>
