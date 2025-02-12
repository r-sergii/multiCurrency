namespace Multicurrency {

    const string BLUE = "blue";

    class FillWidget : Gtk.Frame //
    {
        public FillWidget () {

	        Gtk.Box vBox = new Gtk.Box (Gtk.Orientation.VERTICAL, 1);
            vBox.set_homogeneous (false);

            this.set_label ((string)null);
            this.set_child (vBox);

            this.remove_css_class(BLUE);
            this.add_css_class(BLUE);
        }
    }
}
