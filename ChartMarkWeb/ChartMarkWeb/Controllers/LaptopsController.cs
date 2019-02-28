using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using ChartMarkWeb.Models;

namespace ChartMarkWeb.Controllers
{
    public class LaptopsController : ApiController
    {
        private Android_AssignmentEntities db = new Android_AssignmentEntities();

        // GET: api/Laptops
        public IQueryable<Laptop> GetLaptop()
        {
            return db.Laptop;
        }

        // GET: api/Laptops/5
        [ResponseType(typeof(Laptop))]
        public IHttpActionResult GetLaptop(int id)
        {
            Laptop laptop = db.Laptop.Find(id);
            if (laptop == null)
            {
                return NotFound();
            }

            return Ok(laptop);
        }

        // PUT: api/Laptops/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutLaptop(int id, Laptop laptop)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != laptop.ID)
            {
                return BadRequest();
            }

            db.Entry(laptop).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!LaptopExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Laptops
        [ResponseType(typeof(Laptop))]
        public IHttpActionResult PostLaptop(Laptop laptop)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Laptop.Add(laptop);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = laptop.ID }, laptop);
        }

        // DELETE: api/Laptops/5
        [ResponseType(typeof(Laptop))]
        public IHttpActionResult DeleteLaptop(int id)
        {
            Laptop laptop = db.Laptop.Find(id);
            if (laptop == null)
            {
                return NotFound();
            }

            db.Laptop.Remove(laptop);
            db.SaveChanges();

            return Ok(laptop);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool LaptopExists(int id)
        {
            return db.Laptop.Count(e => e.ID == id) > 0;
        }
    }
}