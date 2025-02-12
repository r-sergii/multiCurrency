namespace MyLib
{
    public class CircularProgress : Gtk.DrawingArea {

//        private double xCentr;
  //      private double yCentr;
        //int
    //    private double radius;
        private double _percentage;

        [Description(nick = "Percentage/Value", blurb = "The percentage value [0.0 ... 1.0]")]
        public double percentage {
            get {
                return _percentage;
            }
            set {
                if (value > 1.0) {
                    _percentage = 1.0;
                } else if (value < 0.0) {
                    _percentage = 0.0;
                } else {
                    _percentage = value;
                }
            }
        }

        public CircularProgress (int width = 300, int height = 300)
        {
            this.set_size_request (width, height);
            this.set_draw_func (draw_func);
        }

        private void draw_func (Gtk.DrawingArea drawing_area, Cairo.Context context, int width, int height)
        {
		    weak Gtk.StyleContext style_context = drawing_area.get_style_context ();
//              GtkStyleContext *context = gtk_widget_get_style_context(widget);

            double center_x = width/2.0;
            double center_y = height/2.0;
	        double radius = double.min (width / 2, height / 2) / 2;
	    }
    }
}
