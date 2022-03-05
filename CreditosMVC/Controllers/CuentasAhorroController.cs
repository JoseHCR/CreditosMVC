using CreditosMVC.Models;
using CreditosMVC.Models.ViewsModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace CreditosMVC.Controllers
{
    public class CuentasAhorroController : Controller
    {
        private readonly CreditosBancariosContext _context;

        public CuentasAhorroController(CreditosBancariosContext context)
        {
            _context = context;
        }
        public async Task<IActionResult> Index()
        {
            var todasCuentas = _context.TbCuentasAhorros.Include(e=>e.IdClienteNavigation);
            return View(await todasCuentas.ToListAsync());
        }

        public async Task<IActionResult> VerCuentas(int id)
        {
            var cuentasCliente = _context.TbCuentasAhorros.Include(e => e.IdClienteNavigation).Where(e=>e.IdCliente==id);
            return View(await cuentasCliente.ToListAsync());
        }

        

        public IActionResult Agregar(int id)
        {
            
            var cliente = _context.TbClientes.Where(a => a.IdCliente == id).ToList();
            string NombreDelCliente = "";
            if (cliente.Count > 0) 
            { 
                foreach (var c in cliente)
                {
                    NombreDelCliente = c.Nombre + " " + c.Apellidos;
                }

                ViewBag.ClienteNombre = NombreDelCliente;

                ViewData["Clientes"] = new SelectList(_context.TbClientes, "IdCliente", "Nombre", id);
            }
            else
            {
                return RedirectToAction(nameof(Index));
            }
            

            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Agregar(CuentasAhorroViewModel model)
        {
            if (ModelState.IsValid)
            {
                var cuenta = new TbCuentasAhorro()
                {
                    NumeroCuenta = model.NumeroCuenta,
                    SaldoActual = model.SaldoActual,
                    IdCliente = model.IdCliente,
                    FechaCreacion = DateTime.Now
                    
                     
                };

                _context.Add(cuenta);
                await _context.SaveChangesAsync();

                return RedirectToAction(nameof(Index));
            }


            ViewData["Clientes"] = new SelectList(_context.TbClientes, "IdCliente", "Nombre", model.IdCliente);

            return View(model);
        }

    }
}
