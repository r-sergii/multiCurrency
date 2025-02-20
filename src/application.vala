namespace Multicurrency {
    public class Application : Adw.Application {

        public Adw.ColorScheme theme { get; set; }
        private Multicurrency.CurrencyService _currencyService;

        private Multicurrency.SettingsService _settingsService;

        private MyLib.InfoLinux info;

        public Application () {
            Object (application_id: "io.github.r_sergii.multiCurrency", flags: ApplicationFlags.FLAGS_NONE);
        }

        construct {
            ActionEntry[] action_entries = {
                { "language", this.on_language_action },
                { "about", this.on_about_action },
                { "preferences", this.on_preferences_action },
                { "quit", this.on_quit }
            };
            this.add_action_entries (action_entries, this);
            this.set_accels_for_action ("app.language", {"<primary>l"});
            this.set_accels_for_action ("app.about", {"<primary>a"});
            this.set_accels_for_action ("app.quit", {"<primary>q"});

            var set_theme_action = new GLib.PropertyAction ("set_app_theme", this, "theme");
            set_theme_action.notify.connect (this.set_app_theme);
            this.add_action (set_theme_action);

            // Css settings
//            var provider = new Gtk.CssProvider ();
  //          provider.load_from_resource ("/ua/inf/multiapps/multiCurrency/theme_switcher.css");
    //        Gtk.StyleContext.add_provider_for_display (Gdk.Display.get_default (), provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);

            info = new MyLib.InfoLinux ();
//            stdout.printf ("%s\n", info.os + "-" + info.cpu);

            _settingsService = new SettingsService ();
            _currencyService = new CurrencyService ();
        }

        private bool isRun;

        public override void activate () {
            base.activate ();

            init_app_theme ();

            var provider = new Gtk.CssProvider ();
            provider.load_from_resource ("/io/github/r_sergii/multiCurrency/theme_switcher.css");
            Gtk.StyleContext.add_provider_for_display (Gdk.Display.get_default (), provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);

            var win = this.active_window;
            if (win == null) {

                var connectService = new ConnectService ();
                bool result = connectService.connect ();
                if (result == false) {
                    var noconnect = new Multicurrency.NoConnectWindow (this);
                    noconnect.present ();
                    return;
                }

                var locale = this.settingsService.locale;

                var appsLoad = new Multicurrency.AppsLoadService (info, _settingsService.locale.locale );
                appsLoad.insert ();

                var splash = new Multicurrency.SplashWindow (this);
                splash.present ();
                _currencyService.getItems ();
                Timeout.add (3000, make_window);
                _currencyService.full ();
//                win = this.create_window ();
  //              win.present ();
                this.set_app_theme ();
//                win = new Multicurrency.Window (this);
            }
            win.present ();
        }

        public Multicurrency.CurrencyService currencyService {
            get {
                return _currencyService;
            }
        }

        public Multicurrency.SettingsService settingsService {
            get {
                return _settingsService;
            }
        }

        public void init () {
            var win = new Multicurrency.MainWindow (this);
            win.present ();
        }

        private bool make_window()
        {
            var win = new Multicurrency.MainWindow (this);
//            win.set_position ( Gtk.WindowPosition.CENTER );// (GTK_WIN_POS_CENTER);
            win.present ();
            return false;
        }

        private Multicurrency.MainWindow create_window () {

            var win = new Multicurrency.MainWindow (this);

            // Css settings
            var provider = new Gtk.CssProvider ();
            provider.load_from_resource ("/io/github/r_sergii/multiCurrency/theme_switcher.css");
            Gtk.StyleContext.add_provider_for_display (Gdk.Display.get_default (), provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);

            return win;
        }

        private void on_about_action () {
//            string[] authors = { "r-sergii" };
  //          Gtk.show_about_dialog (this.active_window,
    //                               "program-name", "multicurrency",
      //                             "authors", authors,
        //                           "version", "0.1.0");

            var win = new Adw.AboutWindow () {
                application_name = "multiCurrency",
                application_icon = "io.github.r_sergii.multiCurrency",
                version = "0.1.0",
                copyright = "Copyright © 2025 Serhii Rudchenko",
//                license_type = License.Apache-2.0,
                developer_name = "Serhii Rudchenko",
                developers = {"Serhii Rudchenko email:sergej.rudchenko@gmail.com"},
                translator_credits = _("translator-credits"),
                website = "https://r-serega.github.io/mapps/",
                issue_url = "email:multiApps@i.ua"
            };
            win.set_transient_for (this.active_window);
            win.show ();

        }

        private void on_preferences_action () {
//            message ("app.preferences action activated");
        }

        private void init_app_theme () {
            var th = settingsService.theme;
            switch (th.theme) {
                case 0: theme = Adw.ColorScheme.DEFAULT;
                        break;
                case 1: theme = Adw.ColorScheme.FORCE_LIGHT;
                        break;
                case 2: theme = Adw.ColorScheme.FORCE_DARK;
                        break;
                case 3: theme = Adw.ColorScheme.PREFER_LIGHT;
                        break;
                case 4: theme = Adw.ColorScheme.PREFER_DARK;
                        break;
                default: theme = Adw.ColorScheme.DEFAULT;
                        break;
            }
            Adw.StyleManager.get_default ().set_color_scheme (this.theme);
        }

        private void set_app_theme () {
            Adw.StyleManager.get_default ().set_color_scheme (this.theme);
//            message (this.theme.to_string());

            var th = settingsService.theme;

            switch(theme) {
                case Adw.ColorScheme.FORCE_LIGHT:
//                    message ("FL");
                    th.theme = 1;
                    break;
                case Adw.ColorScheme.FORCE_DARK:
//                    message ("FD");
                    th.theme = 2;
                    break;
                case Adw.ColorScheme.PREFER_LIGHT:
//                    message ("PFL");
                    th.theme = 3;
                    break;
                case Adw.ColorScheme.PREFER_DARK:
//                    message ("PFL");
                    th.theme = 4;
                    break;
                case Adw.ColorScheme.DEFAULT:
//                    message ("DEF");
                    th.theme = 0;
                    break;
                default:
//                    message ("default");
                    th.theme = 0;
                    break;
            }
//            th.toSettings ();
            settingsService.writeTheme ();
        }

        private void on_language_action () {
//            message ("language action show activated");

            var language = new Multicurrency.LanguageWindow (this.active_window as Multicurrency.MainWindow);
            language.set_transient_for (this.active_window);
            language.show ();

//            (this.active_window as Multiclock.MainWindow).init_menu ();
        }

        private void on_quit () {
//            this.get_windows ().foreach ((obj) => {
  //              var win = (Multiclock.MainWindow) obj;
    //            win.close_all ();
      //      });
            Multicurrency.MainWindow win = this.active_window as Multicurrency.MainWindow;
            win.on_close_application ();
        }
    }
}
