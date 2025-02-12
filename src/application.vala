/* application.vala
 *
 * Copyright 2025 r-sergii
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

namespace Multicurrency {
    public class Application : Adw.Application {

        public Adw.ColorScheme theme { get; set; }
        private Multicurrency.CurrencyService _currencyService;

        public Application () {
            Object (application_id: "ua.inf.multiapps.multiCurrency", flags: ApplicationFlags.FLAGS_NONE);
        }

        construct {
            ActionEntry[] action_entries = {
                { "about", this.on_about_action },
                { "preferences", this.on_preferences_action },
                { "quit", this.quit }
            };
            this.add_action_entries (action_entries, this);
            this.set_accels_for_action ("app.quit", {"<primary>q"});

            var set_theme_action = new GLib.PropertyAction ("set_app_theme", this, "theme");
            set_theme_action.notify.connect (this.set_app_theme);
            this.add_action (set_theme_action);

            // Css settings
//            var provider = new Gtk.CssProvider ();
  //          provider.load_from_resource ("/ua/inf/multiapps/multiCurrency/theme_switcher.css");
    //        Gtk.StyleContext.add_provider_for_display (Gdk.Display.get_default (), provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);

            _currencyService = new CurrencyService ();
        }

        private bool isRun;

        public override void activate () {
            base.activate ();

            var provider = new Gtk.CssProvider ();
            provider.load_from_resource ("/ua/inf/multiapps/multiCurrency/theme_switcher.css");
            Gtk.StyleContext.add_provider_for_display (Gdk.Display.get_default (), provider, Gtk.STYLE_PROVIDER_PRIORITY_USER);

            var win = this.active_window;
            if (win == null) {
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
            provider.load_from_resource ("/ua/inf/multiapps/multiCurrency/theme_switcher.css");
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
                application_icon = "ua.inf.multiapps.multiCurrency",
                version = "0.1.0",
                copyright = "Copyright © 2025 Serhii Rudchenko",
//                license_type = License.GPL_3_0,
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
            message ("app.preferences action activated");
        }

        private void set_app_theme () {
            Adw.StyleManager.get_default ().set_color_scheme (this.theme);
        }
    }
}
