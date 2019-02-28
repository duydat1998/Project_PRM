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
    public class MousesController : ApiController
    {
        private Android_AssignmentEntities db = new Android_AssignmentEntities();

        // GET: api/Mouses
        public IQueryable<Mouse> GetMouse()
        {
            return db.Mouse;
        }

        // GET: api/Mouses/5
        [ResponseType(typeof(Mouse))]
        public IHttpActionResult GetMouse(int id)
        {
            Mouse mouse = db.Mouse.Find(id);
            if (mouse == null)
            {
                return NotFound();
            }

            return Ok(mouse);
        }

        // PUT: api/Mouses/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutMouse(int id, Mouse mouse)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != mouse.ID)
            {
                return BadRequest();
            }

            db.Entry(mouse).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MouseExists(id))
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

        // POST: api/Mouses
        [ResponseType(typeof(Mouse))]
        public IHttpActionResult PostMouse(Mouse mouse)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Mouse.Add(mouse);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = mouse.ID }, mouse);
        }

        // DELETE: api/Mouses/5
        [ResponseType(typeof(Mouse))]
        public IHttpActionResult DeleteMouse(int id)
        {
            Mouse mouse = db.Mouse.Find(id);
            if (mouse == null)
            {
                return NotFound();
            }

            db.Mouse.Remove(mouse);
            db.SaveChanges();

            return Ok(mouse);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool MouseExists(int id)
        {
            return db.Mouse.Count(e => e.ID == id) > 0;
        }
    }
}