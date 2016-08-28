using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Western_Sydney_Hotel.Startup))]
namespace Western_Sydney_Hotel
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
