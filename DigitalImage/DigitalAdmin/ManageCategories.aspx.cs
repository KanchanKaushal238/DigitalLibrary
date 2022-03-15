using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace DigitalImage.DigitalAdmin
{
    public partial class ManageCategories : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UserIdValue.Text=Membership.GetUser().ProviderUserKey.ToString();

        }

        protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            e.Values["UserId"] = Membership.GetUser().ProviderUserKey;
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            e.NewValues["UserId"] = Membership.GetUser().ProviderUserKey;

        }
    }
}