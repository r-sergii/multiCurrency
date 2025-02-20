namespace Multicurrency {

    public abstract class CurrencyField {
        public const string quotes = "quotes";
        public const string datetime = "datetime";
        public const string open = "open";
        public const string close = "close";
    }

    public class CurrencyModel {
        public string quotes;
        public string datetime;
        public double open;
        public double close;

        public CurrencyModel(string _quotes, string _datetime, double _open, double _close) {
            quotes = _quotes;
            datetime = _datetime;
            open = _open;
            close = _close;
        }

        public CurrencyModel.fromJson (Json.Node item) {
//            CurrencyField currencyField = new CurrencyField();

            Json.Object obj = item.get_object ();
            foreach(unowned string name in obj.get_members ()) {
                switch(name) {
                    case CurrencyField.quotes:
                        unowned Json.Node it = obj.get_member (name);
                        quotes = obj.get_string_member (CurrencyField.quotes);
//                        message (quotes);
                        break;
                    case CurrencyField.datetime:
                        unowned Json.Node it = obj.get_member (name);
                        datetime = obj.get_string_member (CurrencyField.datetime);
//                        message (datetime);
                        break;
                    case CurrencyField.open:
                        unowned Json.Node it = obj.get_member (name);
                        open = obj.get_double_member (CurrencyField.open);
                        char[] buf = new char[double.DTOSTR_BUF_SIZE];
//                        message(open.to_str(buf));
                        break;
                    case CurrencyField.close:
                        unowned Json.Node it = obj.get_member (name);
                        close = obj.get_double_member (CurrencyField.close);
                        char[] buf = new char[double.DTOSTR_BUF_SIZE];
//                        message(close.to_str(buf));
                        break;
                    default:
                        break;
                }
            }
        }
    }
}
