using System;
using System.Collections.Generic;

namespace CreditosMVC.Models
{
    public partial class TbCliente
    {
        public TbCliente()
        {
            TbCuentasAhorros = new HashSet<TbCuentasAhorro>();
        }

        public int IdCliente { get; set; }
        public string? Nombre { get; set; }
        public string? Apellidos { get; set; }
        public long? NumeroIdentificacion { get; set; }

        public virtual ICollection<TbCuentasAhorro> TbCuentasAhorros { get; set; }
    }
}
