using Shared_Projet_ASP.Repositories;

namespace Projet_ASP
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.
            builder.Services.AddControllersWithViews();

            #region Service BLL
            builder.Services.AddScoped<IProduitRepository<BLL.Entities.Produit>, BLL.Services.ProduitService>();
            #endregion

            #region Services DAL
            builder.Services.AddScoped<IProduitRepository<DAL.Entities.Produit>, DAL.Services.ProduitService>();
            #endregion

            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (!app.Environment.IsDevelopment())
            {
                app.UseExceptionHandler("/Home/Error");
            }
            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthorization();

            app.MapControllerRoute(
                name: "default",
                pattern: "{controller=Home}/{action=Index}/{id?}");

            app.Run();
        }
    }
}