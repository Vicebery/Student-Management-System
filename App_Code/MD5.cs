using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

/// <summary>
/// MD5 的摘要说明
/// </summary>
public class MD5
{
    public static string Back_MD5(string toCryString)
    {
        return FormsAuthentication.HashPasswordForStoringInConfigFile(toCryString, "MD5");
    }
}