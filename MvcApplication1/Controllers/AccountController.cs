using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
using MvcApplication1.Models;

namespace MvcApplication1.Controllers
{

    [HandleError]
    public class AccountController : Controller
    {

        public IFormsAuthenticationService FormsService { get; set; }
        public IMembershipService MembershipService { get; set; }

        protected override void Initialize(RequestContext requestContext)
        {
            if (FormsService == null) { FormsService = new FormsAuthenticationService(); }
            if (MembershipService == null) { MembershipService = new AccountMembershipService(); }

            base.Initialize(requestContext);
        }

        // **************************************
        // URL: /Account/LogOn
        // **************************************

        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(string reg_name, string reg_pwd, string reg_repwd)
        {
            MembershipCreateStatus status = MembershipService.CreateUser(reg_name, reg_pwd);
            JsonResult result = new JsonResult();
            result.Data = status;
            return result;
        }
        [HttpPost]
        public ActionResult Logon(string login_name, string login_pwd)
        {
            bool has_login = MembershipService.ValidateUser(login_name, login_pwd);
            JsonResult result = new JsonResult();
            result.Data = has_login;
            FormsService.SignIn(login_name);
            return result;
        }
    }
}
