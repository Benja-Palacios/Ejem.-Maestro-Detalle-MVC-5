using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using _3Tablas.Models;

namespace _3Tablas.ViewModel
{
    public class TelefonoVM
    {
        public int Id { get; set; }
        public string NumeroCelular { get; set; }
        public string NumeroFijo { get; set; }
        public int IdPersona { get; set; }  

        public Personas PersonaVM { get; set; }
    }
}