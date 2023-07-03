using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using System.Data;
using PatientManagementSystem.Model;
using System.Web.Script.Services;

namespace PatientManagementSystem
{
    public partial class ViewPatients : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        
        {

        }



        [WebMethod]
        public static string GetPatients()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            List<Patient> patients = new List<Patient>();
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("PatientProcedure", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    Patient patient = new Patient();
                    patient.PatientID = rdr["PatientID"].ToString();
                    patient.FirstName = rdr["FirstName"].ToString();
                    patient.MiddleName = rdr["MiddleName"].ToString();
                    patient.LastName = rdr["LastName"].ToString();
                    patient.Gender = rdr["Gender"].ToString();
                    patient.DateOfBirth = rdr["DateOfBirth"].ToString();
                    patient.Status = rdr["Status"].ToString();
                    patient.Picture = rdr["Picture"].ToString();
                    patients.Add(patient);
                }
            }
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = 5000000; // Set the desired maximum length
            return serializer.Serialize(patients);
        }

        [WebMethod]
        public static void DeletePatients(List<string> ids)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(cs))
            {
                connection.Open();
                SqlCommand command = new SqlCommand("DeleteSelectedRows", connection);
                command.CommandType = CommandType.StoredProcedure;
                DataTable idList = new DataTable();
                idList.Columns.Add("ID", typeof(string));
                string idstring = "";
                if (ids.Count > 0)
                    {
                        idstring += ids[0];
                    }
                if (ids.Count > 1)
                {
                    for (int i = 1; i < ids.Count; i++)
                        {
                            idstring = idstring + ", " + ids[i];
                        }
                }
                if (ids.Count > 0)
                    {
                        SqlParameter parameter = new SqlParameter("@IDList", idstring);
                        command.Parameters.Add(parameter);
                        command.ExecuteNonQuery();
                    }

            }
        }
    }
}
