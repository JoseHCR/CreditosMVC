using CreditosMVC.Models;
using CreditosMVC.Models.ViewsModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace CreditosMVC.Controllers
{
    public class TransaccionesController : Controller
    {
        private readonly CreditosBancariosContext _context;

        public TransaccionesController(CreditosBancariosContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> HistorialTransacciones(int id)
        {
            var historialCuentaAhorro = _context.TbHistorialTransacciones.Include(e => e.IdCuentaAhorroNavigation).Where(e => e.IdCuentaAhorro == id);
            return View(await historialCuentaAhorro.OrderByDescending(e=>e.FechaTransaccion).ToListAsync());
        }

        public IActionResult Depositar(int id)
        {
            decimal saldoActual = 0;
            
            var saldo = _context.TbCuentasAhorros.Where(e => e.IdCuentaAhorro == id).ToList();
            if (saldo.Count > 0)
            {
                foreach (var s in saldo)
                {
                    saldoActual = Convert.ToDecimal(s.SaldoActual);
                    ViewBag.NumeroCuenta = s.NumeroCuenta;
                }

                

                ViewBag.Monto = saldoActual;
            }
            else
            {
                return NotFound();
            }

            ViewData["CuentaAhorro"] = new SelectList(_context.TbCuentasAhorros, "IdCuentaAhorro", "NumeroCuenta", id);


            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Depositar(TransaccionesViewModel model)
        {

            if (ModelState.IsValid)
            {
                
                var transaccion = new TbHistorialTransaccione()
                {
                    IdCuentaAhorro = model.IdCuentaAhorro,
                    Monto = model.Monto,
                    SaldoAnterior= model.SaldoActual,
                    SaldoActual = model.SaldoActual + model.Monto,
                    FechaTransaccion = DateTime.Now,
                    Concepto =  "Deposito"


                };

                _context.Add(transaccion);
                


                var cuentaAhorro = new TbCuentasAhorro()
                {
                    SaldoActual = model.SaldoActual + model.Monto,
                    IdCuentaAhorro= (int)model.IdCuentaAhorro
                };

                _context.TbCuentasAhorros.Attach(cuentaAhorro);
                _context.Entry(cuentaAhorro).Property(x=>x.SaldoActual).IsModified = true;

                await _context.SaveChangesAsync();

                return RedirectToAction("HistorialTransacciones", new { id = model.IdCuentaAhorro });
            }

            ViewBag.Monto = model.SaldoActual + model.Monto;



            return View(model);
        }

        public IActionResult Retirar(int id)
        {
            decimal saldoActual = 0;

            var saldo = _context.TbCuentasAhorros.Where(e => e.IdCuentaAhorro == id).ToList();
            if (saldo.Count > 0)
            {
                foreach (var s in saldo)
                {
                    saldoActual = Convert.ToDecimal(s.SaldoActual);
                    ViewBag.NumeroCuenta = s.NumeroCuenta;

                }
                
                ViewBag.Monto = saldoActual;
            }
            else
            {
                return NotFound();
            }

            ViewData["CuentaAhorro"] = new SelectList(_context.TbCuentasAhorros, "IdCuentaAhorro", "NumeroCuenta", id);


            return View();
        }
        
        [HttpPost]
        public async Task<IActionResult> Retirar(TransaccionesViewModel model)
        {
            ViewBag.Monto = model.SaldoActual;
            if (ModelState.IsValid)
            {
                    var transaccion = new TbHistorialTransaccione()
                    {
                        IdCuentaAhorro = model.IdCuentaAhorro,
                        Monto = model.Monto,
                        SaldoAnterior = model.SaldoActual,
                        SaldoActual = (model.SaldoActual - model.Monto),
                        FechaTransaccion = DateTime.Now,
                        Concepto = "Retiro"


                    };

                    _context.Add(transaccion);



                    var cuentaAhorro = new TbCuentasAhorro()
                    {
                        SaldoActual = (model.SaldoActual - model.Monto),
                        IdCuentaAhorro = (int)model.IdCuentaAhorro
                    };

                    _context.TbCuentasAhorros.Attach(cuentaAhorro);
                    _context.Entry(cuentaAhorro).Property(x => x.SaldoActual).IsModified = true;

                    await _context.SaveChangesAsync();

                    return RedirectToAction("HistorialTransacciones", new { id = model.IdCuentaAhorro });
              
                ViewBag.Monto = model.SaldoActual - model.Monto;
            }
            else
            {
                ViewData["CuentaAhorro"] = new SelectList(_context.TbCuentasAhorros, "IdCuentaAhorro", "NumeroCuenta", model.IdCuentaAhorro);

            }

            



            return View(model);
        }
    }
}
