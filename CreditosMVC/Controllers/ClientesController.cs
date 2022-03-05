using CreditosMVC.Models;
using CreditosMVC.Models.ViewsModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace CreditosMVC.Controllers
{
    public class ClientesController : Controller
    {
        private readonly CreditosBancariosContext _context;

        public ClientesController(CreditosBancariosContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            var clientes = _context.TbClientes;
            return View(await clientes.ToListAsync());
        }

        public IActionResult Agregar()
        {            
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Agregar(ClientesViewModel model)
        {
            if (ModelState.IsValid)
            {
                var cliente = new TbCliente()
                {
                    Nombre = model.Nombre,
                    Apellidos = model.Apellidos,
                    NumeroIdentificacion=model.NumeroIdentificacion
                };

                _context.Add(cliente);
                await _context.SaveChangesAsync();

                return RedirectToAction(nameof(Index));
            }

            return View(model);
        }


        


    }
}
