using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using _3Tablas.Models;
using _3Tablas.ViewModel;

namespace _3Tablas.Servicios
{
    public class PersonasServicios
    {
        public bool GuardarPersonas(PersonasVM personasVM)
        {
            try
            {
                using (var contexto = new Entities())
                {

                    //construyo la tabla persona 
                    Personas persona = new Personas();
                    persona.Nombre = personasVM.Nombre.ToLower().Trim();
                    persona.ApellidoPaterno = personasVM.ApellidoPaterno.ToLower().Trim();
                    persona.ApellidoMaterno = personasVM.ApellidoMaterno.ToLower().Trim();
                    persona.Edad = personasVM.Edad;
                    List<Telefonos> listaTelefonos = new List<Telefonos>();
                    List<Direccion> listaDirecciones = new List<Direccion>();

                    if (personasVM.TelefonoVM != null)
                    {
                        //Construyo Telefono
                        Telefonos telefonos = new Telefonos();
                        telefonos.NumeroCelular = personasVM.TelefonoVM.NumeroCelular;
                        telefonos.NumeroFijo = personasVM.TelefonoVM.NumeroFijo;
                        //aqui pongo el telefono en la lista
                        listaTelefonos.Add(telefonos);
                        //hago el inner join 
                        persona.Telefonos = listaTelefonos;

                    }
                    if (personasVM.DireccionVM != null)
                    {

                        //construyo la direccion 
                        Direccion direccion = new Direccion();
                        direccion.Calle = personasVM.DireccionVM.Calle.ToLower().Trim();
                        direccion.Colonia = personasVM.DireccionVM.Colonia.ToLower().Trim();
                        direccion.Cp = personasVM.DireccionVM.Cp;
                        
                        direccion.NumExterior = personasVM.DireccionVM.NumeroExterior;
                        direccion.NumInterior = personasVM.DireccionVM.NumeroInterior;
                        //lista de direcciones 
                        listaDirecciones.Add(direccion);
                        persona.Direccion = listaDirecciones;

                    }

                    contexto.Personas.Add(persona);
                    contexto.SaveChanges();
                    return true;
                }
            }catch(Exception ex)
            {
                string error = ex.Message;
                return false;
            }
            
        }

    }
}