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
    public class BrandsController : ApiController
    {
        private Android_AssignmentEntities db = new Android_AssignmentEntities();

        // GET: api/Brands
        public IQueryable<Brand> GetBrand()
        {
            return db.Brand;
        }

        // GET: api/Brands/5
        [ResponseType(typeof(Brand))]
        public IHttpActionResult GetBrand(string id)
        {
            Brand brand = db.Brand.Find(id);
            if (brand == null)
            {
                return NotFound();
            }

            return Ok(brand);
        }

        // PUT: api/Brands/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutBrand(string id, Brand brand)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != brand.brandID)
            {
                return BadRequest();
            }

            db.Entry(brand).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!BrandExists(id))
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

        // POST: api/Brands
        [ResponseType(typeof(Brand))]
        public IHttpActionResult PostBrand(Brand brand)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Brand.Add(brand);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (BrandExists(brand.brandID))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = brand.brandID }, brand);
        }

        // DELETE: api/Brands/5
        [ResponseType(typeof(Brand))]
        public IHttpActionResult DeleteBrand(string id)
        {
            Brand brand = db.Brand.Find(id);
            if (brand == null)
            {
                return NotFound();
            }

            db.Brand.Remove(brand);
            db.SaveChanges();

            return Ok(brand);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool BrandExists(string id)
        {
            return db.Brand.Count(e => e.brandID == id) > 0;
        }

        [ResponseType(typeof(string))]
        [ActionName("Name")]
        public string GetBrandNameByID(string id)
        {
            string name = "";
            if (BrandExists(id))
            {
                Brand brand = db.Brand.Find(id);
                name = brand.brandName;
            }
            return name;
        }
    }
}