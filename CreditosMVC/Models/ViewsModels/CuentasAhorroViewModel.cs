using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace CreditosMVC.Models.ViewsModels
{
    public class CuentasAhorroViewModel
    {
        public int IdCuentaAhorro { get; set; }

        [Required]
        public long? NumeroCuenta { get; set; }

        [Required]
        public decimal? SaldoActual { get; set; }

        [Display(Name ="Cliente")]
        public int? IdCliente { get; set; }

        public DateTime? FechaCreacion { get; set; }

        public virtual TbCliente? IdClienteNavigation { get; set; }

        internal Task<string?> ToListAsync()
        {
            throw new NotImplementedException();
        }


        public virtual ICollection<TbHistorialTransaccione>? TbHistorialTransacciones { get; set; }
    }
}
