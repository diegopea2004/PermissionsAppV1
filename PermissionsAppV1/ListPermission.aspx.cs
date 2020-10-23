using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace PermissionsAppV1
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dbData;
            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = "Data Source=DIEGOPC\\DIEGOPEA2004;Initial Catalog=dot-net-test;Integrated Security=True";
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[dbo].[Select_PERMISSIONS]";
                    cmd.Connection = conn;
                    conn.Open();

                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        dbData = new DataTable();

                        dbData.Load(sdr);
                    }
                }
            }
            //Assign the value to display in the gridView
            gvPermissions.DataSource = dbData;
            //Tells to the gridView to make a data refresh
            gvPermissions.DataBind();
        }
    }
}