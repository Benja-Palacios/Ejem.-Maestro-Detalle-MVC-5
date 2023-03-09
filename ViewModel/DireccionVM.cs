using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace _3Tablas.ViewModel
{
    public class DireccionVM
    {
        public int id { get; set; }
        [Required]
        public string Calle { get; set; }
        [Required]
        public string Colonia { get; set; }
        public int Cp { get; set; }
        public string NumeroInterior { get; set; }
        public string NumeroExterior { get; set; }  
        public int IdPersona { get; set; }

        public PersonasVM PersonaVM { get; set; }   
    }
}