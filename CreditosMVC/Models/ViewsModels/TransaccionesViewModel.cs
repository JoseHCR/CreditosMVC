using System.ComponentModel.DataAnnotations;

namespace CreditosMVC.Models.ViewsModels
{
    public class TransaccionesViewModel : IValidatableObject
    {
        public int IdHistorialTransaccion { get; set; }
        public int? IdCuentaAhorro { get; set; }

        [Required]
        [DataType(DataType.Currency)]
        [DisplayFormat(DataFormatString = "{0:C0}", ApplyFormatInEditMode = true)]
        public decimal? Monto { get; set; }
        public DateTime? FechaTransaccion { get; set; }
        public string? Concepto { get; set; }
        
        [DataType(DataType.Currency)]
        [DisplayFormat(DataFormatString = "{0:C0}", ApplyFormatInEditMode = true)]
        public decimal? SaldoAnterior { get; set; }

        [DataType(DataType.Currency)]
        [DisplayFormat(DataFormatString = "{0:C0}", ApplyFormatInEditMode = true)]
        public decimal? SaldoActual { get; set; }

        public virtual TbCuentasAhorro? IdCuentaAhorroNavigation { get; set; }

        IEnumerable<ValidationResult> IValidatableObject.Validate(ValidationContext validationContext)
        {
            if (Concepto == "Retiro")
            {
                if (Monto > SaldoActual)
                {
                    yield return new ValidationResult("El monto debe ser menor al saldo actual", new[] { nameof(Monto) });
                }                           
            }
          
        }
    }
}
