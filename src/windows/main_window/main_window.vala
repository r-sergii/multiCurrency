namespace Multicurrency {
    [GtkTemplate (ui = "/io/github/r_sergii/multiCurrency/windows/main_window/main_window.ui")]
    public class MainWindow : Gtk.ApplicationWindow {

        private Gtk.CssProvider css_provider;

//        [GtkChild]
  //      private unowned Gtk.CenterBox center;
        [GtkChild]
        private unowned Gtk.Grid grid;
//        private unowned Gtk.Label label;

        private MyLib.ThemeSwitcher theme_switcher;
        [GtkChild]
        private unowned Gtk.MenuButton menu_button;

        public MainWindow (Gtk.Application app) {
            Object (application: app);
            this.bind_property("default-width", this, "windowWidth", BindingFlags.DEFAULT | BindingFlags.SYNC_CREATE);
            this.bind_property("default-height", this, "windowHeight", BindingFlags.DEFAULT | BindingFlags.SYNC_CREATE);
            this.bind_property("maximized", this, "isMaximized", BindingFlags.DEFAULT | BindingFlags.SYNC_CREATE);
        }

        public void init_menu () {
            var app = GLib.Application.get_default();
            var locale = (app as Multicurrency.Application).settingsService.locale;
            var currencyService = (app as Multicurrency.Application).currencyService;

            var menu = new GLib.Menu();
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            var item_theme = new GLib.MenuItem (_("custom"), null);//"app.set_app_theme");
            item_theme.set_attribute ("custom", "s", "theme");
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//            var item_preferences = new GLib.MenuItem (_("Preferences"), "app.preferences");
            var item_language = new GLib.MenuItem (_(locale.language), "app.language");
            var item_about = new GLib.MenuItem (_(locale.about +" multiCurrency"), "app.about");
            var item_quit = new GLib.MenuItem (_(locale.exit_), "app.quit");

//            message (locale.locale);

            menu.append_item (item_theme);
//            menu.append_item (item_preferences);
            menu.append_item (item_language);
            menu.append_item (item_about);
            menu.append_item (item_quit);

            var pop = (Gtk.PopoverMenu) this.menu_button.get_popover ();
            pop.set_menu_model (menu);

            this.theme_switcher = new MyLib.ThemeSwitcher ();
            pop.add_child (this.theme_switcher, "theme");

            set_title (locale.currency + ": " + currencyService.sDate + " " + currencyService.sHour + ":"
                + currencyService.sMin + " " + currencyService.gmt);
        }


        construct{
            this.resizable = false;
//            this.decorated = true;
            //set_resizable (false);
            init_menu ();

//            var pop = (Gtk.PopoverMenu) this.menu_button.get_popover ();
  //          this.theme_switcher = new MyLib.ThemeSwitcher ();
    //        pop.add_child (this.theme_switcher, "theme");

//            var currencyProvider = new CurrencyProvider ();
//            currencyProvider.getItems ();
//            var currencyService = new CurrencyService ();
//            currencyService.getItems ();

            grid.column_spacing = 2;
	        grid.row_spacing = 2;

            css_provider = new Gtk.CssProvider();
            css_provider.load_from_resource("/io/github/r_sergii/multiCurrency/rate_widget.css");
            Gtk.StyleContext.add_provider_for_display(Gdk.Display.get_default(),css_provider,Gtk.STYLE_PROVIDER_PRIORITY_USER);

            var usd = new Gtk.Image.from_icon_name("f_usd") {
                pixel_size = 64
            };
            var eur = new Gtk.Image.from_icon_name("f_eur") {
                pixel_size = 64
            };
            var gbp = new Gtk.Image.from_icon_name("f_gbp") {
                pixel_size = 64
            };
            var jpy = new Gtk.Image.from_icon_name("f_jpy") {
                pixel_size = 64
            };
            var chf = new Gtk.Image.from_icon_name("f_chf") {
                pixel_size = 64
            };
            var cad = new Gtk.Image.from_icon_name("f_cad") {
                pixel_size = 64
            };
            var aud = new Gtk.Image.from_icon_name("f_aud") {
                pixel_size = 64
            };
            var nzd = new Gtk.Image.from_icon_name("f_nzd") {
                pixel_size = 64
            };


            grid.attach (new FillWidget(), 0, 0, 1, 1);
            grid.attach (usd, 0, 1, 1, 1);
            grid.attach (eur, 0, 2, 1, 1);
            grid.attach (gbp, 0, 3, 1, 1);
            grid.attach (jpy, 0, 4, 1, 1);
            grid.attach (chf, 0, 5, 1, 1);
            grid.attach (cad, 0, 6, 1, 1);
            grid.attach (aud, 0, 7, 1, 1);
            grid.attach (nzd, 0, 8, 1, 1);

            var usd2 = new Gtk.Image.from_icon_name("f_usd") {
                pixel_size = 64
            };
            var eur2 = new Gtk.Image.from_icon_name("f_eur") {
                pixel_size = 64
            };
            var gbp2 = new Gtk.Image.from_icon_name("f_gbp") {
                pixel_size = 64
            };
            var jpy2 = new Gtk.Image.from_icon_name("f_jpy") {
                pixel_size = 64
            };
            var chf2 = new Gtk.Image.from_icon_name("f_chf") {
                pixel_size = 64
            };
            var cad2 = new Gtk.Image.from_icon_name("f_cad") {
                pixel_size = 64
            };
            var aud2 = new Gtk.Image.from_icon_name("f_aud") {
                pixel_size = 64
            };
            var nzd2 = new Gtk.Image.from_icon_name("f_nzd") {
                pixel_size = 64
            };

            grid.attach (usd2, 1, 0, 1, 1);
            grid.attach (eur2, 2, 0, 1, 1);
            grid.attach (gbp2, 3, 0, 1, 1);
            grid.attach (jpy2, 4, 0, 1, 1);
            grid.attach (chf2, 5, 0, 1, 1);
            grid.attach (cad2, 6, 0, 1, 1);
            grid.attach (aud2, 7, 0, 1, 1);
            grid.attach (nzd2, 8, 0, 1, 1);

            var app = GLib.Application.get_default();
            Multicurrency.CurrencyService currencyService
                = (app as Multicurrency.Application).currencyService;
            var locale = (app as Multicurrency.Application).settingsService.locale;

            var usdeur = new RateWidget.fromModel (currencyService.tUSDEUR);
            var usdgbp = new RateWidget.fromModel (currencyService.tUSDGBP);
            var usdjpy = new RateWidget.fromModel (currencyService.tUSDJPY);
            var usdchf = new RateWidget.fromModel (currencyService.tUSDCHF);
            var usdcad = new RateWidget.fromModel (currencyService.tUSDCAD);
            var usdaud = new RateWidget.fromModel (currencyService.tUSDAUD);
            var usdnzd = new RateWidget.fromModel (currencyService.tUSDNZD);

            grid.attach (new FillWidget(), 1, 1, 1, 1);
            grid.attach (usdeur, 2, 1, 1, 1);
            grid.attach (usdgbp, 3, 1, 1, 1);
            grid.attach (usdjpy, 4, 1, 1, 1);
            grid.attach (usdchf, 5, 1, 1, 1);
            grid.attach (usdcad, 6, 1, 1, 1);
            grid.attach (usdaud, 7, 1, 1, 1);
            grid.attach (usdnzd, 8, 1, 1, 1);

            var eurusd = new RateWidget.fromModel (currencyService.tEURUSD);
            var eurgbp = new RateWidget.fromModel (currencyService.tEURGBP);
            var eurjpy = new RateWidget.fromModel (currencyService.tEURJPY);
            var eurchf = new RateWidget.fromModel (currencyService.tEURCHF);
            var eurcad = new RateWidget.fromModel (currencyService.tEURCAD);
            var euraud = new RateWidget.fromModel (currencyService.tEURAUD);
            var eurnzd = new RateWidget.fromModel (currencyService.tEURNZD);

            grid.attach (eurusd, 1, 2, 1, 1);
            grid.attach (new FillWidget(), 2, 2, 1, 1);
            grid.attach (eurgbp, 3, 2, 1, 1);
            grid.attach (eurjpy, 4, 2, 1, 1);
            grid.attach (eurchf, 5, 2, 1, 1);
            grid.attach (eurcad, 6, 2, 1, 1);
            grid.attach (euraud, 7, 2, 1, 1);
            grid.attach (eurnzd, 8, 2, 1, 1);

            var gbpusd = new RateWidget.fromModel (currencyService.tGBPUSD);
            var gbpeur = new RateWidget.fromModel (currencyService.tGBPEUR);
            var gbpjpy = new RateWidget.fromModel (currencyService.tGBPJPY);
            var gbpchf = new RateWidget.fromModel (currencyService.tGBPCHF);
            var gbpcad = new RateWidget.fromModel (currencyService.tGBPCAD);
            var gbpaud = new RateWidget.fromModel (currencyService.tGBPAUD);
            var gbpnzd = new RateWidget.fromModel (currencyService.tGBPNZD);

            grid.attach (gbpusd, 1, 3, 1, 1);
            grid.attach (gbpeur, 2, 3, 1, 1);
            grid.attach (new FillWidget(), 3, 3, 1, 1);
            grid.attach (gbpjpy, 4, 3, 1, 1);
            grid.attach (gbpchf, 5, 3, 1, 1);
            grid.attach (gbpcad, 6, 3, 1, 1);
            grid.attach (gbpaud, 7, 3, 1, 1);
            grid.attach (gbpnzd, 8, 3, 1, 1);

            var jpyusd = new RateWidget.fromModel (currencyService.tJPYUSD);
            var jpyeur = new RateWidget.fromModel (currencyService.tJPYEUR);
            var jpygbp = new RateWidget.fromModel (currencyService.tJPYGBP);
            var jpychf = new RateWidget.fromModel (currencyService.tJPYCHF);
            var jpycad = new RateWidget.fromModel (currencyService.tJPYCAD);
            var jpyaud = new RateWidget.fromModel (currencyService.tJPYAUD);
            var jpynzd = new RateWidget.fromModel (currencyService.tJPYNZD);

            grid.attach (jpyusd, 1, 4, 1, 1);
            grid.attach (jpyeur, 2, 4, 1, 1);
            grid.attach (jpygbp, 3, 4, 1, 1);
            grid.attach (new FillWidget(), 4, 4, 1, 1);
            grid.attach (jpychf, 5, 4, 1, 1);
            grid.attach (jpycad, 6, 4, 1, 1);
            grid.attach (jpyaud, 7, 4, 1, 1);
            grid.attach (jpynzd, 8, 4, 1, 1);

            var chfusd = new RateWidget.fromModel (currencyService.tCHFUSD);
            var chfeur = new RateWidget.fromModel (currencyService.tCHFEUR);
            var chfgbp = new RateWidget.fromModel (currencyService.tCHFGBP);
            var chfjpy = new RateWidget.fromModel (currencyService.tCHFJPY);
            var chfcad = new RateWidget.fromModel (currencyService.tCHFCAD);
            var chfaud = new RateWidget.fromModel (currencyService.tCHFAUD);
            var chfnzd = new RateWidget.fromModel (currencyService.tCHFNZD);

            grid.attach (chfusd, 1, 5, 1, 1);
            grid.attach (chfeur, 2, 5, 1, 1);
            grid.attach (chfgbp, 3, 5, 1, 1);
            grid.attach (chfjpy, 4, 5, 1, 1);
            grid.attach (new FillWidget(), 5, 5, 1, 1);
            grid.attach (chfcad, 6, 5, 1, 1);
            grid.attach (chfaud, 7, 5, 1, 1);
            grid.attach (chfnzd, 8, 5, 1, 1);

            var cadusd = new RateWidget.fromModel (currencyService.tCADUSD);
            var cadeur = new RateWidget.fromModel (currencyService.tCADEUR);
            var cadgbp = new RateWidget.fromModel (currencyService.tCADGBP);
            var cadjpy = new RateWidget.fromModel (currencyService.tCADJPY);
            var cadchf = new RateWidget.fromModel (currencyService.tCADCHF);
            var cadaud = new RateWidget.fromModel (currencyService.tCADAUD);
            var cadnzd = new RateWidget.fromModel (currencyService.tCADNZD);

            grid.attach (cadusd, 1, 6, 1, 1);
            grid.attach (cadeur, 2, 6, 1, 1);
            grid.attach (cadgbp, 3, 6, 1, 1);
            grid.attach (cadjpy, 4, 6, 1, 1);
            grid.attach (cadchf, 5, 6, 1, 1);
            grid.attach (new FillWidget(), 6, 6, 1, 1);
            grid.attach (cadaud, 7, 6, 1, 1);
            grid.attach (cadnzd, 8, 6, 1, 1);

            var audusd = new RateWidget.fromModel (currencyService.tAUDUSD);
            var audeur = new RateWidget.fromModel (currencyService.tAUDEUR);
            var audgbp = new RateWidget.fromModel (currencyService.tAUDGBP);
            var audjpy = new RateWidget.fromModel (currencyService.tAUDJPY);
            var audchf = new RateWidget.fromModel (currencyService.tAUDCHF);
            var audcad = new RateWidget.fromModel (currencyService.tAUDCAD);
            var audnzd = new RateWidget.fromModel (currencyService.tAUDNZD);

            grid.attach (audusd, 1, 7, 1, 1);
            grid.attach (audeur, 2, 7, 1, 1);
            grid.attach (audgbp, 3, 7, 1, 1);
            grid.attach (audjpy, 4, 7, 1, 1);
            grid.attach (audchf, 5, 7, 1, 1);
            grid.attach (audcad, 6, 7, 1, 1);
            grid.attach (new FillWidget(), 7, 7, 1, 1);
            grid.attach (audnzd, 8, 7, 1, 1);

            var nzdusd = new RateWidget.fromModel (currencyService.tNZDUSD);
            var nzdeur = new RateWidget.fromModel (currencyService.tNZDEUR);
            var nzdgbp = new RateWidget.fromModel (currencyService.tNZDGBP);
            var nzdjpy = new RateWidget.fromModel (currencyService.tNZDJPY);
            var nzdchf = new RateWidget.fromModel (currencyService.tNZDCHF);
            var nzdcad = new RateWidget.fromModel (currencyService.tNZDCAD);
            var nzdaud = new RateWidget.fromModel (currencyService.tNZDAUD);

            grid.attach (nzdusd, 1, 8, 1, 1);
            grid.attach (nzdeur, 2, 8, 1, 1);
            grid.attach (nzdgbp, 3, 8, 1, 1);
            grid.attach (nzdjpy, 4, 8, 1, 1);
            grid.attach (nzdchf, 5, 8, 1, 1);
            grid.attach (nzdcad, 6, 8, 1, 1);
            grid.attach (nzdaud, 7, 8, 1, 1);
            grid.attach (new FillWidget(), 8, 8, 1, 1);

//            message (currencyService.sDateTime);
//            message (currencyService.sDate);
//            message (currencyService.sHour);
//            message (currencyService.sMin);

//            set_title ("Currency: " + currencyService.sDate + " " + currencyService.sHour + ":"
            set_title (locale.currency + ": " + currencyService.sDate + " " + currencyService.sHour + ":"
                + currencyService.sMin + " " + currencyService.gmt);

        }

        public int windowHeight {
            get { return get_height(); }
            set {
                Idle.add(() => {
//                    print(@"window height: $value\n");
                    return Source.REMOVE;
                });
                grid.set_size_request (get_width (), get_height ());
                grid.queue_draw ();
            }
        }

        public int windowWidth {
            get { return get_width(); }
            set {
                Idle.add(() => {
//                    print(@"window width: $value\n");
                    return Source.REMOVE;
                });
                //grid.set_size_request (get_width (), get_height ());
            }
        }

        public bool isMaximized {
            get { return maximized; }
            set {
                Idle.add(() => {
//                    print(@"window maximized: $isMaximized; width: $(get_width())\n");
                    return Source.REMOVE;
                });
            }
        }

        private void on_language_action () {
//            message ("language action show activated");

            var language = new Multicurrency.LanguageWindow (this);
            language.set_transient_for (this);
            language.show ();

            var pop = (Gtk.PopoverMenu) this.menu_button.get_popover ();
            pop.hide ();
        }

        public void on_close_application () {
            var app = GLib.Application.get_default();
            call_are_exit_dialog (app);
            //app.quit();
            //return true;
        }

        private void call_are_exit_dialog (GLib.Application app) {
//            var app = GLib.Application.get_default();
//            var theme = (app as Multiclock.Application).theme;
            var locale = (app as Multicurrency.Application).settingsService.locale;

//            var are_exit_dialog = new Adw.MessageDialog(this, _("Exit?"), _("Are you sure you want to exit?"));
  //          are_exit_dialog.add_response("cancel", _("_Cancel"));
    //        are_exit_dialog.add_response("ok", _("_Exit"));
            var are_exit_dialog = new Adw.MessageDialog(this, _(locale.exit_), _(locale.are_exit));
            are_exit_dialog.add_response("cancel", _(locale.cancel));
            are_exit_dialog.add_response("ok", _(locale.exit_));
            are_exit_dialog.set_default_response("ok");
            are_exit_dialog.set_close_response("cancel");
            are_exit_dialog.set_response_appearance("ok", SUGGESTED);
            are_exit_dialog.show();
            are_exit_dialog.response.connect((response) => {
                if (response == "ok") {
                    try {
                         app.quit();
                    } catch (Error e) {
                         stderr.printf ("Error: %s\n", e.message);
                    }
                }
                are_exit_dialog.close();
                //app.quit();
            });
        }
    }
}
