using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PatientManagementSystem.Model
{
    public class Patient
    {
        public string PatientID { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string Gender { get; set; }
        public string DateOfBirth { get; set; }
        public string Status { get; set; }
        public string Picture { get; set; }
    }
}