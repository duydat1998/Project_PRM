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
    public class KeyboardsController : ApiController
    {
        private Android_AssignmentEntities db = new Android_AssignmentEntities();

        // GET: api/Keyboards
        public IQueryable<Keyboard> GetKeyboard()
        {
            return db.Keyboard;
        }

        // GET: api/Keyboards/5
        [ResponseType(typeof(Keyboard))]
        public IHttpActionResult GetKeyboard(int id)
        {
            Keyboard keyboard = db.Keyboard.Find(id);
            if (keyboard == null)
            {
                return NotFound();
            }

            return Ok(keyboard);
        }

        // PUT: api/Keyboards/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutKeyboard(int id, Keyboard keyboard)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != keyboard.ID)
            {
                return BadRequest();
            }

            db.Entry(keyboard).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!KeyboardExists(id))
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

        // POST: api/Keyboards
        [ResponseType(typeof(Keyboard))]
        public IHttpActionResult PostKeyboard(Keyboard keyboard)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Keyboard.Add(keyboard);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = keyboard.ID }, keyboard);
        }

        // DELETE: api/Keyboards/5
        [ResponseType(typeof(Keyboard))]
        public IHttpActionResult DeleteKeyboard(int id)
        {
            Keyboard keyboard = db.Keyboard.Find(id);
            if (keyboard == null)
            {
                return NotFound();
            }

            db.Keyboard.Remove(keyboard);
            db.SaveChanges();

            return Ok(keyboard);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool KeyboardExists(int id)
        {
            return db.Keyboard.Count(e => e.ID == id) > 0;
        }
    }
}