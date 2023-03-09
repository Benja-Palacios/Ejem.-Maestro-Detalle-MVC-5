using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using _3Tablas.Servicios;
using _3Tablas.ViewModel;

namespace _3Tablas.Controllers
{
    public class PersonaController : Controller
    {

        private readonly PersonasServicios servicios = null;

        public PersonaController()
        {
            servicios = new PersonasServicios();
        }
        

        // GET: Persona/Create
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(PersonasVM personasVM)
        {
            if (ModelState.IsValid)
            {
                servicios.GuardarPersonas(personasVM);
                return View();
            }
            return RedirectToAction("Error", "Error");
        }


       


    }
}
