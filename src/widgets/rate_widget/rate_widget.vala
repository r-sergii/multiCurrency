//using Gtk;
//using GLib;
//using Gdk;
//using MyLib;

namespace Multicurrency {

    const string LIGHTGREY = "lightgrey";
    const string DARKGREEN = "darkgrey";

    class RateWidget : Gtk.Button //
    {
        string rate;
        int trend;
        double open;
        double close;

        Gtk.Image iTrend;
        Gtk.Label lRate;

        public RateWidget (double _open, double _close) {
            open = _open;
            close = _close;

            char[] buf = new char[double.DTOSTR_BUF_SIZE];
	        rate = close.to_str(buf);
	        int len = rate.length;
	        if(rate.length > 6) {
	            rate = rate.substring(0,6);

	        }
	        else {
	            rate = rate.substring(0,len);
	        }

            //Gtk.Image iTrend;
	        if(close > open) {
	            trend = 1;
	            iTrend = new Gtk.Image.from_icon_name("up_green-hdpi") {
                    pixel_size = 16
                };
	        } else if (close < open) {
	            trend = -1;
	            iTrend = new Gtk.Image.from_icon_name("down_red-hdpi") {
                    pixel_size = 16
                };
	        } else {
	            trend = 0;
	            iTrend = new Gtk.Image.from_icon_name("equal_blue-hdpi") {
                    pixel_size = 16
                };
	        }

//	        (rate.substring(0,6));
//	        Gtk.Label
	        lRate = new Gtk.Label (rate);
	        Gtk.Box vBox = new Gtk.Box (Gtk.Orientation.VERTICAL, 1);
            vBox.set_homogeneous (false);

	        lRate.set_markup ("<span size='12000'>" + rate + "</span>");
	        lRate.set_justify (Gtk.Justification.LEFT);

            lRate.set_use_markup(true);
            lRate.remove_css_class(LIGHTGREY);
            lRate.add_css_class(LIGHTGREY);

            vBox.append (iTrend);
            vBox.append (lRate);

            this.set_label ((string)null);
            this.set_child (vBox);

            this.remove_css_class(LIGHTGREY);
            this.add_css_class(LIGHTGREY);
        }

        public RateWidget.fromModel (CurrencyModel model) {
            open = model.open;
            close = model.close;

            char[] buf = new char[double.DTOSTR_BUF_SIZE];
	        rate = close.to_str(buf);
//	        if(rate.length > 7) {
	//            rate = rate.substring(0,6);
	  //      }
	        int len = rate.length;
	        if(rate.length > 6) {
	            rate = rate.substring(0,6);

	        }
	        else {
	            rate = rate.substring(0,len);
	        }

//            Gtk.Image iTrend;
	        if(close > open) {
	            trend = 1;
	            iTrend = new Gtk.Image.from_icon_name("up_green-hdpi") {
                    pixel_size = 16
                };
	        } else if (close < open) {
	            trend = -1;
	            iTrend = new Gtk.Image.from_icon_name("down_red-hdpi") {
                    pixel_size = 16
                };
	        } else {
	            trend = 0;
	            iTrend = new Gtk.Image.from_icon_name("equal_blue-hdpi") {
                    pixel_size = 16
                };
	        }

//	        new Gtk.Label (rate.substring(0,6));
//	        Gtk.Label
	        lRate = new Gtk.Label (rate);
	        Gtk.Box vBox = new Gtk.Box (Gtk.Orientation.VERTICAL, 1);
            vBox.set_homogeneous (false);

	        lRate.set_markup ("<span size='12000'>" + rate + "</span>");
	        lRate.set_justify (Gtk.Justification.LEFT);

            lRate.set_use_markup(true);
            lRate.remove_css_class(LIGHTGREY);
            lRate.add_css_class(LIGHTGREY);

            vBox.append (iTrend);
            vBox.append (lRate);

            this.set_label ((string)null);
            this.set_child (vBox);

            this.remove_css_class(LIGHTGREY);
            this.add_css_class(LIGHTGREY);
        }

        public void update (CurrencyModel model) {
            open = model.open;
            close = model.close;

            char[] buf = new char[double.DTOSTR_BUF_SIZE];
	        rate = close.to_str(buf);

	        int len = rate.length;
	        if(rate.length > 6) {
	            rate = rate.substring(0,6);

	        }
	        else {
	            rate = rate.substring(0,len);
	        }

	        if(close > open) {
	            trend = 1;
	            iTrend.set_from_icon_name("up_green-hdpi");
	        } else if (close < open) {
	            trend = -1;
	            iTrend.set_from_icon_name("down_red-hdpi");
	        } else {
	            trend = 0;
	            iTrend.set_from_icon_name("equal_blue-hdpi");
	        }


	        lRate.set_markup ("<span size='12000'>" + rate + "</span>");
	        lRate.set_justify (Gtk.Justification.LEFT);

            lRate.set_use_markup(true);
            lRate.remove_css_class(LIGHTGREY);
            lRate.add_css_class(LIGHTGREY);
        }
    }
}
