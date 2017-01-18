using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Web.Configuration;

/// <summary>
/// SQLHelper 的摘要说明
/// </summary>
public class SQLHelper
{
	public SQLHelper()
	{
		
	}

    public static string getConnStr()
    {
        return WebConfigurationManager.ConnectionStrings["conn"].ToString();
    }
}