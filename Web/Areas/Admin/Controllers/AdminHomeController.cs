﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.Models;

namespace Web.Areas.Admin.Controllers
{
    public class AdminHomeController : Controller
    {
        // GET: Admin/AdminHome

        [QuyenTruyCap(idChucNang = 1)]
        public ActionResult Index()
        {
            return View();
        }
    }
}