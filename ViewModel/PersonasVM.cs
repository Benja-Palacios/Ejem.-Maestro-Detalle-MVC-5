using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace _3Tablas.ViewModel
{
    public class PersonasVM
    {
        public int Id { get; set; }
        [Required(ErrorMessage ="Este campo es requerido")]
        public string Nombre { get; set; }
        [Required]
        public string ApellidoPaterno { get; set; }
        [Required]
        public string ApellidoMaterno { get; set; }
        [Range(1,100)]
        public int Edad { get; set; }

        public List<DireccionVM> DireccionesVM { get; set; }
        public List<TelefonoVM> TelefonosVM { get; set; }

        public DireccionVM DireccionVM { get; set; }
        public TelefonoVM TelefonoVM { get; set; }
    }
}