using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;

namespace DigitalImage.DigitalAdmin
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UserIDValue.Text = Membership.GetUser().ProviderUserKey.ToString();

        }

        protected void dvPicturesInsert_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {

        }

        protected void dvPicturesInsert_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            bool cancelinsert = false;
            FileUpload imageUpload=(FileUpload)dvPicturesInsert.FindControl("imageUpload");
            if (imageUpload.HasFile)
                cancelinsert = true;
            else
            {
                if(imageUpload.FileName.ToUpper().EndsWith(".JPG"))
                    cancelinsert=true;
            }
            if (cancelinsert)
            {
                e.Cancel = true;
            }
            e.Values["UserId"] = Membership.GetUser().ProviderUserKey;
            e.Values["UploadedOn"] = DateTime.Now;


        }

        protected void dvPicturesInsert_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            if (e.AffectedRows > 0)
            {
                DataView dv = (DataView)maxPictureIDDataSource.Select(DataSourceSelectArguments.Empty);
                int picturesjustAdded = (int)dv[0][0];
                FileUpload imageUpload = (FileUpload)dvPicturesInsert.FindControl("imageUpload");
                if (imageUpload.HasFile)
                {
                    string basedirectory = Server.MapPath("~/UploadedImages/");
                    imageUpload.SaveAs(basedirectory+picturesjustAdded+".JPG");
                }
            }
        }

        protected void dvPicturesInsert_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {

        }

        protected void gvPictures_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            e.NewValues["UserId"] = Membership.GetUser().ProviderUserKey.ToString();
        }
    }
}