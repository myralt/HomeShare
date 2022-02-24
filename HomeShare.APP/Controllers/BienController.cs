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

        // GET: BienController
        public IActionResult Index()
        {
            IEnumerable<BienList> list = _service.GetAll().Select(b => b.ToBienList());
            return View(list);
        }

        // GET: BienController/Details/5
        public IActionResult Details(int id)
        {
            return View();
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
