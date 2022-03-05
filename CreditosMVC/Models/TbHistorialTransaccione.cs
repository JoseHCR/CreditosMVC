using System;
using System.Collections.Generic;

namespace CreditosMVC.Models
{
    public partial class TbHistorialTransaccione
    {
        public int IdHistorialTransaccion { get; set; }
        public int? IdCuentaAhorro { get; set; }
        public decimal? Monto { get; set; }
        public DateTime? FechaTransaccion { get; set; }
        public string? Concepto { get; set; }
        public decimal? SaldoAnterior { get; set; }
        public decimal? SaldoActual { get; set; }

        public virtual TbCuentasAhorro? IdCuentaAhorroNavigation { get; set; }
    }
}
