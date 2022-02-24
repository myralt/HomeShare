using HoliDayRental.Handlers;
using HoliDayRental.Infrastructure.Helpers;
using HoliDayRental.Models;
using HomeShare.BLL;
using HomeShare.Common.Repositories;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;


namespace HoliDayRental.Controllers
{
    public class AccountController : Controller
    {
        private readonly ILogger<AccountController> _logger;
        private readonly IHttpContextAccessor _httpContext;
        private readonly IMembreRepository<MembreBLL> _service;

        public AccountController(ILogger<AccountController> logger, IHttpContextAccessor httpContext, 
            IMembreRepository<MembreBLL> service)
        {
            _logger = logger;
            _httpContext = httpContext;
            _service = service;
        }
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Register(AccountRegisterForm collection)
        {
            if (!ModelState.IsValid) return View(collection);
            try 
            {
                _service.Insert(collection.ToMembreBLL());
            
            } catch (Exception e)
            {
                TempData["Error"] = e.Message;
                Console.WriteLine(TempData["Error"]);
                return RedirectToAction(nameof(Register));
            }

            return RedirectToAction("Index", "Home");
        }

        //Exemple d'ajout de valeur pour une session permettant de spécifier que l'utilisateur est connecté
        //[HttpPost]
        //public IActionResult Register()
        //{
        //    _httpContext.HttpContext.Session.SetObjectAsJson("IsLogged", true);
        //    return View();
        //}
    }
}
