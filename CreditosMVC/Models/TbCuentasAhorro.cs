using System;
using System.Collections.Generic;

namespace CreditosMVC.Models
{
    public partial class TbCuentasAhorro
    {
        public TbCuentasAhorro()
        {
            TbHistorialTransacciones = new HashSet<TbHistorialTransaccione>();
        }

        public int IdCuentaAhorro { get; set; }
        public long? NumeroCuenta { get; set; }
        public decimal? SaldoActual { get; set; }
        public int? IdCliente { get; set; }
        public DateTime? FechaCreacion { get; set; }

        public virtual TbCliente? IdClienteNavigation { get; set; }
        public virtual ICollection<TbHistorialTransaccione> TbHistorialTransacciones { get; set; }
    }
}
