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
    public class VGAsController : ApiController
    {
        private Android_AssignmentEntities db = new Android_AssignmentEntities();

        // GET: api/VGAs
        public IQueryable<VGA> GetVGA()
        {
            return db.VGA;
        }

        // GET: api/VGAs/5
        [ResponseType(typeof(VGA))]
        public IHttpActionResult GetVGA(int id)
        {
            VGA vGA = db.VGA.Find(id);
            if (vGA == null)
            {
                return NotFound();
            }

            return Ok(vGA);
        }

        // PUT: api/VGAs/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutVGA(int id, VGA vGA)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != vGA.ID)
            {
                return BadRequest();
            }

            db.Entry(vGA).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!VGAExists(id))
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

        // POST: api/VGAs
        [ResponseType(typeof(VGA))]
        public IHttpActionResult PostVGA(VGA vGA)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.VGA.Add(vGA);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = vGA.ID }, vGA);
        }

        // DELETE: api/VGAs/5
        [ResponseType(typeof(VGA))]
        public IHttpActionResult DeleteVGA(int id)
        {
            VGA vGA = db.VGA.Find(id);
            if (vGA == null)
            {
                return NotFound();
            }

            db.VGA.Remove(vGA);
            db.SaveChanges();

            return Ok(vGA);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool VGAExists(int id)
        {
            return db.VGA.Count(e => e.ID == id) > 0;
        }
    }
}