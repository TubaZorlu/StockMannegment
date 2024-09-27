using Dapper;
using StockMannegment_DataAccess;
using StockMannegment_Dtos.CategoryDtos;
using StockMannegment_Dtos.StockMovementDtos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockMannegment_Business.StockMovementRepository
{
    public class StockMovementRepository : IStockMovementRepository
    {
        private readonly Context _context;

        public StockMovementRepository(Context context)
        {
            _context = context;
        }

        public async Task<List<AllStockMovementDto>> FilterByDateRangeStockMovementAsync(DateTime dateStart, DateTime dateEnd)
        {
            string query = @"
                            SELECT 
                            p.ID AS ProductId,
                            p.ProductName,
                            p.Status,
	                        u.UnitName,
                            si.ShortName AS Size, 
                            c.CategoryName,
                            c.ID AS CategoryId, 
                            SUM(s.Stock) AS TotalEntryQuantity,    
	                        p.CurrentStock,
	                        p.WarningQuantity,
                            MAX(s.EnterDate) AS LastEntryDate   
                        FROM Product p
                        JOIN Category c ON p.CategoryID = c.ID
                        JOIN Stock_Enter s ON s.ProductID = p.ID
                        JOIN Unit u ON s.UnitID = u.ID
                        JOIN Size si ON si.ID = p.SizeID
                        WHERE s.EnterDate BETWEEN @dateStart AND @dateEnd
                        GROUP BY p.ID, p.ProductName, si.ShortName, c.CategoryName, c.ID,p.CurrentStock,p.WarningQuantity,u.UnitName,p.Status
                        ORDER BY p.ID;
                        ";

            var parameters = new DynamicParameters();
            parameters.Add("@dateStart", dateStart);
            parameters.Add("@dateEnd", dateEnd);
            using (var connection = _context.CreateConnection())
            {
                
                var result = await connection.QueryAsync<AllStockMovementDto>(query, parameters);
                return result.ToList();
            }
        }

        public async Task<List<AllStockMovementDto>> GetAllStockMovementAsync()
        {
            string procedureName = "GetStockMovementDetails";

            using (var connection = _context.CreateConnection())
            {
                var result = await connection.QueryAsync<AllStockMovementDto>(
                    procedureName,
                    commandType: CommandType.StoredProcedure 
                );

                return result.ToList(); 
            }

        }

        public async Task<List<MontlyCategoryMovementDto>> GetMontlyCategoryStockMovement(int categoryId)
        {

            string query = @"
                            SELECT
	                        c.ID as CategoryId,
                            c.CategoryName,          
                            YEAR(s.ExitDate) AS Year, 
                            MONTH(s.ExitDate) AS Month, 
                            SUM(s.Stock) AS TotalExit 
                        FROM 
                            Stock_Exit s
                        JOIN 
                            Product p ON s.ProductID = p.ID
                        JOIN 
                            Category c ON p.CategoryID = c.ID
                        where c.ID=@categoryId
                        GROUP BY
	                        c.ID,
                            c.CategoryName, 
                            YEAR(s.ExitDate), 
                            MONTH(s.ExitDate)
                        ORDER BY 
	                        c.ID,
                            c.CategoryName, 
                            Year, 
                            Month;
	

                                
                            ";
            var parameters = new DynamicParameters();
            parameters.Add("@categoryId", categoryId);
            using (var connection = _context.CreateConnection())
            {

                var result = await connection.QueryAsync<MontlyCategoryMovementDto>(query, parameters);
                return result.ToList();
            }
        }

        public async Task<List<MonytlProductStockMovementDto>> GetMontlyProductStockMovement(int productId)
        {
            string query = @"
                                   SELECT 
                                    s.ProductID,
                                    p.ProductName, 
                                    YEAR(s.ExitDate) AS Year, 
                                    MONTH(s.ExitDate) AS Month, 
                                    SUM(s.Stock) AS TotalExit
                                FROM 
                                    Stock_Exit s
                                JOIN 
                                    Product p ON s.ProductID = p.ID 
                                WHERE 
                                    s.ProductID = @productId
                                GROUP BY 
                                    s.ProductID,
                                    p.ProductName, 
                                    YEAR(s.ExitDate),
                                    MONTH(s.ExitDate)
                                ORDER BY 
                                    Year, 
                                    Month;
                                
                            ";
            var parameters = new DynamicParameters();
            parameters.Add("@productId", productId);
            using (var connection = _context.CreateConnection())
            {

                var result = await connection.QueryAsync<MonytlProductStockMovementDto>(query,parameters);
                return result.ToList();
            }
        }
    }
}
