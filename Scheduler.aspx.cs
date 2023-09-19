using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Scheduler : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CreateOrderFromRecurring();
       
    }
    public void CreateOrderFromRecurring()
    {
        Cl_Scheduler cs = new Cl_Scheduler();
        DataSet ds = new DataSet();
        cs.Type = 1;
        ds = cs.fnCreateOrder();

    }

    
}