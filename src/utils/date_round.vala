namespace MyLib
{
    public class DateRound {

        public DateRound () {;}

        public GLib.DateTime roundHour() {
            GLib.DateTime date = new GLib.DateTime.now_utc ();

            return new GLib.DateTime(new GLib.TimeZone.local(),
                    date.get_year(), date.get_month(), date.get_day_of_month(),
                    date.get_hour(), 0, 0.0);
        }
    }
}
