using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockMannegment_DataAccess
{
    public class Context
    {
        private readonly string _conettionString;
        private readonly IConfiguration _configuration;

        public Context(IConfiguration configuration)
        {
            _configuration = configuration;
            _conettionString = _configuration.GetConnectionString("connection");
        }

        public IDbConnection CreateConnection() => new SqlConnection(_conettionString);
        
    }
}
