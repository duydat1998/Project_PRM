﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class Android_AssignmentEntities : DbContext
    {
        public Android_AssignmentEntities()
            : base("name=Android_AssignmentEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Admin> Admin { get; set; }
        public virtual DbSet<Brand> Brand { get; set; }
        public virtual DbSet<CPU> CPU { get; set; }
        public virtual DbSet<HeadPhone> HeadPhone { get; set; }
        public virtual DbSet<Keyboard> Keyboard { get; set; }
        public virtual DbSet<Laptop> Laptop { get; set; }
        public virtual DbSet<Mouse> Mouse { get; set; }
        public virtual DbSet<VGA> VGA { get; set; }
    }
}
