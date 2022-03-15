﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace DigitalImage
{
    public partial class DigitalDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DetailsView2_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            e.Values["UserId"] = Membership.GetUser().ProviderUserKey;
            e.Values["PictureID"] = Request.QueryString["ID"];
            e.Values["CommentsMadeOn"] = DateTime.Now;

        }
    }
}