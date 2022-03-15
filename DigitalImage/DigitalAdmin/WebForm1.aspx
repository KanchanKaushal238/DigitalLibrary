<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="DigitalImage.DigitalAdmin.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label ID="UserIDValue" runat="server" Visible="false"></asp:Label>

    <asp:DetailsView ID="dvPicturesInsert" runat="server" DataSourceID="PicturesDataSource" AutoGenerateRows="false" DataKeyNames="PictureID" DefaultMode="Insert" OnPageIndexChanging="dvPicturesInsert_PageIndexChanging" OnItemInserted="dvPicturesInsert_ItemInserted" OnItemInserting="dvPicturesInsert_ItemInserting" OnItemUpdated="dvPicturesInsert_ItemUpdated">

        <Fields>

            <asp:TemplateField HeaderText="Picture">

                <InsertItemTemplate>
                    <asp:FileUpload ID="imageUpload" runat="server" />
                    <br />

                    <asp:RequiredFieldValidator ID="R1" runat="server" ErrorMessage="Picture must not be Empty" Display="Dynamic" ControlToValidate="imageUpload" ValidationGroup="PictureAdd"></asp:RequiredFieldValidator>
                </InsertItemTemplate>

            </asp:TemplateField>
            <asp:BoundField DataField="PictureID" HeaderText="PictureID" InsertVisible="false" ReadOnly="true" SortExpression="PictureID" />

            <asp:TemplateField HeaderText="Category">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CategoryID") %>'></asp:TextBox>
                </EditItemTemplate>

                <InsertItemTemplate>
                    <asp:DropDownList ID="PictureCategory" runat="server" DataSourceID="CategoriesDataSource" DataTextField="Name" DataValueField="CategoryID" SelectedValue='<%# Bind("CategoryID") %>' AppendDataBoundItems="true">

                        <asp:ListItem Selected="True" Value="">--None--</asp:ListItem>

                    </asp:DropDownList>
                    <asp:SqlDataSource ID="CategoriesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MyconnectionString %>" SelectCommand="SELECT * FROM [Categories] WHERE ([UserId] = @UserId)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="UserIDValue" Name="UserId" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("CategoryID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

              <asp:TemplateField HeaderText="Title" SortExpression="Title">

                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
  

                </EditItemTemplate>

                  <InsertItemTemplate>
                      <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                      <br />
                      <asp:RequiredFieldValidator ID="R2" runat="server" ErrorMessage="Title must not be Empty" Display="Dynamic" ControlToValidate="TextBox1" ValidationGroup="PictureAdd"></asp:RequiredFieldValidator>

                  </InsertItemTemplate>
                  <ItemTemplate>
                      <asp:Label ID="Label1" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                  </ItemTemplate>

            </asp:TemplateField>

            <asp:TemplateField HeaderText="Description" SortExpression="Description">

                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
  

                </EditItemTemplate>

                  <InsertItemTemplate>
                      <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                      <br />
                      <asp:RequiredFieldValidator ID="R3" runat="server" ErrorMessage="Description must not be Empty" Display="Dynamic" ControlToValidate="TextBox1" ValidationGroup="PictureAdd"></asp:RequiredFieldValidator>

                  </InsertItemTemplate>
                  <ItemTemplate>
                      <asp:Label ID="Label1" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                  </ItemTemplate>

            </asp:TemplateField>

            <asp:CommandField ShowInsertButton="true" CancelText="" ValidationGroup="PictureAdd" />

        </Fields>

    </asp:DetailsView>
    <br />
    <asp:SqlDataSource ID="PicturesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MyconnectionString %>" DeleteCommand="DELETE FROM [Pictures] WHERE [PictureID] = @PictureID" InsertCommand="INSERT INTO [Pictures] ([UserId], [CategoryID], [Title], [Description], [UploadedOn]) VALUES (@UserId, @CategoryID, @Title, @Description, @UploadedOn)" SelectCommand="SELECT * FROM [Pictures] WHERE ([UserId] = @UserId)" UpdateCommand="UPDATE [Pictures] SET [UserId] = @UserId, [CategoryID] = @CategoryID, [Title] = @Title, [Description] = @Description, [UploadedOn] = @UploadedOn WHERE [PictureID] = @PictureID">
        <DeleteParameters>
            <asp:Parameter Name="PictureID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="UserId" />
            <asp:Parameter Name="CategoryID" Type="Int32" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="UploadedOn" Type="DateTime" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="UserIDValue" Name="UserId" PropertyName="Text" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="UserId" />
            <asp:Parameter Name="CategoryID" Type="Int32" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="UploadedOn" Type="DateTime" />
            <asp:Parameter Name="PictureID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
 <br />
    <asp:SqlDataSource ID="maxPictureIDDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MyconnectionString %>" SelectCommand="SELECT [PictureID] FROM [Pictures] WHERE ([UserId] = @UserId)">
        <SelectParameters>
            <asp:ControlParameter ControlID="UserIDValue" Name="UserId" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:GridView ID="gvPictures" runat="server" DataSourceID="PicturesDataSource" AutoGenerateColumns="false" DataKeyNames="PictureID" Width="654px" OnRowUpdating="gvPictures_RowUpdating">

        <Columns>
            <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" ValidationGroup="PictureEdit" />

            <asp:TemplateField HeaderText="Category" SortExpression="CategoryID">

                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="CategoriesDataSource" DataTextField="Name" DataValueField="CategoryID" SelectedValue='<%# Bind("CategoryID") %>'></asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" Enabled="false" DataSourceID="CategoriesDataSource" DataTextField="Name" DataValueField="CategoryID" SelectedValue='<%# Bind("CategoryID") %>'></asp:DropDownList>

                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Title" SortExpression="Title">

                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="R4" runat="server" ErrorMessage="Title must not be Empty" Display="Dynamic" ControlToValidate="TextBox1" ValidationGroup="PictureEdit"></asp:RequiredFieldValidator>

                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                </ItemTemplate>
              
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Description" SortExpression="Description">

                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="R5" runat="server" ErrorMessage="Description must not be Empty" Display="Dynamic" ControlToValidate="TextBox1" ValidationGroup="PictureEdit"></asp:RequiredFieldValidator>

                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                </ItemTemplate>
              
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Date Added" SortExpression="UploadedOn">

                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("UploadedOn") %>'></asp:Label>

                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("UploadedOn") %>'></asp:Label>

                </ItemTemplate>
              
            </asp:TemplateField>
            
        </Columns>

    </asp:GridView>

</asp:Content>
