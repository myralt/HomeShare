using HoliDayRental.Handlers;
using HoliDayRental.Models;
using HomeShare.BLL.Entities;
using HomeShare.Common.Repositories;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;


namespace HoliDayRental.Controllers
{
    public class BienController : Controller
    {
        private readonly IBienRepository<BienBLL> _service;

        public BienController(IBienRepository<BienBLL> service)
        {
            _service = service;
        }

        //Renvoie une liste complète des biens disponibles
        public IActionResult Index()
        {
            IEnumerable<BienList> list = _service.GetAll().Select(b => b.ToBienList());
            return View(list);
        }

        //Renvoie les détails d'un bien
        public IActionResult Details(int id)
        {
            BienDetails details = _service.Get(id).ToBienDetails();
            //details.Proprietaire = _service.GetProprio(details.IdMembre).ToBienProprio();
            //details.Options = _service.GetOptions(details.Id).Select(o => o.ToOption()).ToArray();
            //details.Avis = _service.GetAvis(details.Id).Select(a => a.TAvis()).ToArray();
            return View(details);
        }

        // GET: BienController/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: BienController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: BienController/Edit/5
        public IActionResult Edit(int id)
        {
            return View();
        }

        // POST: BienController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: BienController/Delete/5
        public IActionResult Delete(int id)
        {
            return View();
        }

        // POST: BienController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}
