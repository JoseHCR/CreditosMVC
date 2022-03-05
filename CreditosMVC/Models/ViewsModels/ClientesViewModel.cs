using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;

namespace CreditosMVC.Models.ViewsModels
{
    public class ClientesViewModel
    {
        
        public int IdCliente { get; set; }
        
        [Required]
        [Display(Name = "Nombres")]
        public string? Nombre { get; set; }
        
        [Required]
        [Display(Name = "Apellidos")]
        public string? Apellidos { get; set; }

        
        [Required]         
        [Display(Name ="Numero de identificacion")]
        public long? NumeroIdentificacion { get; set; }

        
    }

  
}
