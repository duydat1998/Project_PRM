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
    public class HeadPhonesController : ApiController
    {
        private Android_AssignmentEntities db = new Android_AssignmentEntities();

        // GET: api/HeadPhones
        public IQueryable<HeadPhone> GetHeadPhone()
        {
            return db.HeadPhone;
        }

        // GET: api/HeadPhones/5
        [ResponseType(typeof(HeadPhone))]
        public IHttpActionResult GetHeadPhone(int id)
        {
            HeadPhone headPhone = db.HeadPhone.Find(id);
            if (headPhone == null)
            {
                return NotFound();
            }

            return Ok(headPhone);
        }

        // PUT: api/HeadPhones/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutHeadPhone(int id, HeadPhone headPhone)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != headPhone.ID)
            {
                return BadRequest();
            }

            db.Entry(headPhone).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!HeadPhoneExists(id))
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

        // POST: api/HeadPhones
        [ResponseType(typeof(HeadPhone))]
        public IHttpActionResult PostHeadPhone(HeadPhone headPhone)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.HeadPhone.Add(headPhone);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = headPhone.ID }, headPhone);
        }

        // DELETE: api/HeadPhones/5
        [ResponseType(typeof(HeadPhone))]
        public IHttpActionResult DeleteHeadPhone(int id)
        {
            HeadPhone headPhone = db.HeadPhone.Find(id);
            if (headPhone == null)
            {
                return NotFound();
            }

            db.HeadPhone.Remove(headPhone);
            db.SaveChanges();

            return Ok(headPhone);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool HeadPhoneExists(int id)
        {
            return db.HeadPhone.Count(e => e.ID == id) > 0;
        }
    }
}