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
    public class CPUsController : ApiController
    {
        private Android_AssignmentEntities db = new Android_AssignmentEntities();

        // GET: api/CPUs
        public IQueryable<CPU> GetCPU()
        {
            return db.CPU;
        }

        // GET: api/CPUs/5
        [ResponseType(typeof(CPU))]
        public IHttpActionResult GetCPU(int id)
        {
            CPU cPU = db.CPU.Find(id);
            if (cPU == null)
            {
                return NotFound();
            }

            return Ok(cPU);
        }

        // PUT: api/CPUs/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutCPU(int id, CPU cPU)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != cPU.ID)
            {
                return BadRequest();
            }

            db.Entry(cPU).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CPUExists(id))
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

        // POST: api/CPUs
        [ResponseType(typeof(CPU))]
        public IHttpActionResult PostCPU(CPU cPU)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.CPU.Add(cPU);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = cPU.ID }, cPU);
        }

        // DELETE: api/CPUs/5
        [ResponseType(typeof(CPU))]
        public IHttpActionResult DeleteCPU(int id)
        {
            CPU cPU = db.CPU.Find(id);
            if (cPU == null)
            {
                return NotFound();
            }

            db.CPU.Remove(cPU);
            db.SaveChanges();

            return Ok(cPU);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool CPUExists(int id)
        {
            return db.CPU.Count(e => e.ID == id) > 0;
        }
    }
}