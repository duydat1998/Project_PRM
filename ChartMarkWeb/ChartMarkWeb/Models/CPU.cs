//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ChartMarkWeb.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class CPU
    {
        public int ID { get; set; }
        public string cpuID { get; set; }
        public string name { get; set; }
        public string brandId { get; set; }
        public string category { get; set; }
        public Nullable<int> socket { get; set; }
        public Nullable<double> weight { get; set; }
        public Nullable<double> clockSpeed { get; set; }
        public Nullable<int> TDP { get; set; }
        public Nullable<int> thread { get; set; }
        public Nullable<double> averagePrice { get; set; }
        public string image1 { get; set; }
        public string image2 { get; set; }
        public string image3 { get; set; }
    }
}
