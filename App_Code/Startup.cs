using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(AIO_PROJECT.Startup))]
namespace AIO_PROJECT
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
