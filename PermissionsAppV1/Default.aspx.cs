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
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DataTable dbData;
                using (SqlConnection conn = new SqlConnection())
                {
                    conn.ConnectionString = "Data Source=DIEGOPC\\DIEGOPEA2004;Initial Catalog=dot-net-test;Integrated Security=True";
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "[dbo].[Select_PERMISSIONSTYPES]";
                        cmd.Connection = conn;
                        conn.Open();

                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
                            dbData = new DataTable();

                            dbData.Load(sdr);
                        }
                    }
                }

                //Assign the value to display in the comboBox
                ddlTypeOfPermission.DataSource = dbData;
                //Tells the 'comboBox' wich stored procedure collumn to show when it unfolds
                ddlTypeOfPermission.DataTextField = "Description";
                ddlTypeOfPermission.DataValueField = "Id";
                //Tells to the comboBox to make a data refresh
                ddlTypeOfPermission.DataBind();
            }
        }

        protected void btnInsertPermission_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(txtName.Text) || String.IsNullOrEmpty(txtSurname.Text) || String.IsNullOrEmpty(ddlTypeOfPermission.SelectedValue) || String.IsNullOrEmpty(txtPermissionDate.Text))
            {
                ClientMessageBox.Show("1 or more parameters are blank", this);
                return;
            }

            List<SqlParameter> paramCol = new List<SqlParameter>();

            SqlParameter param = new SqlParameter("EmployeeFirstName", SqlDbType.NVarChar, 50);
            param.Value = txtName.Text;
            paramCol.Add(param);

            param = new SqlParameter("EmployeeLastName", SqlDbType.NVarChar, 50);
            param.Value = txtSurname.Text;
            paramCol.Add(param);

            param = new SqlParameter("PermissionType", SqlDbType.Int, 50);
            param.Value = int.Parse(ddlTypeOfPermission.SelectedItem.Value);
            paramCol.Add(param);

            param = new SqlParameter("PermissionDate", SqlDbType.DateTime, 50);
            param.Value = DateTime.Parse(txtPermissionDate.Text);
            paramCol.Add(param);

            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = "Data Source=DIEGOPC\\DIEGOPEA2004;Initial Catalog=dot-net-test;Integrated Security=True";
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Parameters.AddRange(paramCol.ToArray());
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "[dbo].[INSERTPERMISSIONS]";
                    cmd.Connection = conn;
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            //Clears the textBox once insert button is pressed
            BlankParameters();
        }

        //Method that clears the textBox once insert button is pressed
        private void BlankParameters()
        {
            txtName.Text = String.Empty;
            txtSurname.Text = String.Empty;
            ddlTypeOfPermission.ClearSelection();
            txtPermissionDate.Text = String.Empty;
        }
    }
}