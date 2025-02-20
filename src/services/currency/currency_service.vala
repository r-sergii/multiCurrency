namespace Multicurrency {

    public class CurrencyService {
        public Gee.ArrayList<CurrencyModel> listRates;

        public CurrencyService() {
            listRates = new Gee.ArrayList<CurrencyModel> ();
        }

        public void getItems () {
            var currencyProvider = new CurrencyProvider ();
            currencyProvider.getItems ( listRates );
//            message (listRates.size.to_string ());
        }

        private CurrencyModel getModel (string nameRate) {
            for(int i=0;i<listRates.size;i++) {
                if(listRates[i].quotes == nameRate) {
                    return listRates[i];
                }
            }
            var date = new DateTime.now_local ();
            return new CurrencyModel("EUR/USD", date.to_string (), 1.0000, 1.0000);
        }

        public Multicurrency.CurrencyModel tUSDEUR { get; set; }
        public Multicurrency.CurrencyModel tUSDGBP { get; set; }
        public Multicurrency.CurrencyModel tUSDJPY { get; set; }
        public Multicurrency.CurrencyModel tUSDCHF { get; set; }
        public Multicurrency.CurrencyModel tUSDCAD { get; set; }
        public Multicurrency.CurrencyModel tUSDAUD { get; set; }
        public Multicurrency.CurrencyModel tUSDNZD { get; set; }

        public Multicurrency.CurrencyModel tEURUSD { get; set; }
        public Multicurrency.CurrencyModel tEURGBP { get; set; }
        public Multicurrency.CurrencyModel tEURJPY { get; set; }
        public Multicurrency.CurrencyModel tEURCHF { get; set; }
        public Multicurrency.CurrencyModel tEURCAD { get; set; }
        public Multicurrency.CurrencyModel tEURAUD { get; set; }
        public Multicurrency.CurrencyModel tEURNZD { get; set; }

        public Multicurrency.CurrencyModel tGBPUSD { get; set; }
        public Multicurrency.CurrencyModel tGBPEUR { get; set; }
        public Multicurrency.CurrencyModel tGBPJPY { get; set; }
        public Multicurrency.CurrencyModel tGBPCHF { get; set; }
        public Multicurrency.CurrencyModel tGBPCAD { get; set; }
        public Multicurrency.CurrencyModel tGBPAUD { get; set; }
        public Multicurrency.CurrencyModel tGBPNZD { get; set; }

        public Multicurrency.CurrencyModel tJPYUSD { get; set; }
        public Multicurrency.CurrencyModel tJPYEUR { get; set; }
        public Multicurrency.CurrencyModel tJPYGBP { get; set; }
        public Multicurrency.CurrencyModel tJPYCHF { get; set; }
        public Multicurrency.CurrencyModel tJPYCAD { get; set; }
        public Multicurrency.CurrencyModel tJPYAUD { get; set; }
        public Multicurrency.CurrencyModel tJPYNZD { get; set; }

        public Multicurrency.CurrencyModel tCHFUSD { get; set; }
        public Multicurrency.CurrencyModel tCHFEUR { get; set; }
        public Multicurrency.CurrencyModel tCHFGBP { get; set; }
        public Multicurrency.CurrencyModel tCHFJPY { get; set; }
        public Multicurrency.CurrencyModel tCHFCAD { get; set; }
        public Multicurrency.CurrencyModel tCHFAUD { get; set; }
        public Multicurrency.CurrencyModel tCHFNZD { get; set; }

        public Multicurrency.CurrencyModel tCADUSD { get; set; }
        public Multicurrency.CurrencyModel tCADEUR { get; set; }
        public Multicurrency.CurrencyModel tCADGBP { get; set; }
        public Multicurrency.CurrencyModel tCADJPY { get; set; }
        public Multicurrency.CurrencyModel tCADCHF { get; set; }
        public Multicurrency.CurrencyModel tCADAUD { get; set; }
        public Multicurrency.CurrencyModel tCADNZD { get; set; }

        public Multicurrency.CurrencyModel tAUDUSD { get; set; }
        public Multicurrency.CurrencyModel tAUDEUR { get; set; }
        public Multicurrency.CurrencyModel tAUDGBP { get; set; }
        public Multicurrency.CurrencyModel tAUDJPY { get; set; }
        public Multicurrency.CurrencyModel tAUDCHF { get; set; }
        public Multicurrency.CurrencyModel tAUDCAD { get; set; }
        public Multicurrency.CurrencyModel tAUDNZD { get; set; }

        public Multicurrency.CurrencyModel tNZDUSD { get; set; }
        public Multicurrency.CurrencyModel tNZDEUR { get; set; }
        public Multicurrency.CurrencyModel tNZDGBP { get; set; }
        public Multicurrency.CurrencyModel tNZDJPY { get; set; }
        public Multicurrency.CurrencyModel tNZDCHF { get; set; }
        public Multicurrency.CurrencyModel tNZDCAD { get; set; }
        public Multicurrency.CurrencyModel tNZDAUD { get; set; }

        public string sDateTime { get; set; }
        public string sDate { get; set; }
        public string sHour { get; set; }
        public string sMin { get; set; }
        public string gmt { get; set; }

        public void full () {
            tUSDEUR = getModel ("USD/EUR");
            tUSDGBP = getModel ("USD/GBP");
            tUSDJPY = getModel ("USD/JPY");
            tUSDCHF = getModel ("USD/CHF");
            tUSDCAD = getModel ("USD/CAD");
            tUSDAUD = getModel ("USD/AUD");
            tUSDNZD = getModel ("USD/NZD");

            tEURUSD = getModel ("EUR/USD");
            tEURGBP = getModel ("EUR/GBP");
            tEURJPY = getModel ("EUR/JPY");
            tEURCHF = getModel ("EUR/CHF");
            tEURCAD = getModel ("EUR/CAD");
            tEURAUD = getModel ("EUR/AUD");
            tEURNZD = getModel ("EUR/NZD");

            tGBPUSD = getModel ("GBP/USD");
            tGBPEUR = getModel ("GBP/EUR");
            tGBPJPY = getModel ("GBP/JPY");
            tGBPCHF = getModel ("GBP/CHF");
            tGBPCAD = getModel ("GBP/CAD");
            tGBPAUD = getModel ("GBP/AUD");
            tGBPNZD = getModel ("GBP/NZD");

            tJPYUSD = getModel ("JPY/USD");
            tJPYEUR = getModel ("JPY/EUR");
            tJPYGBP = getModel ("JPY/GBP");
            tJPYCHF = getModel ("JPY/CHF");
            tJPYCAD = getModel ("JPY/CAD");
            tJPYAUD = getModel ("JPY/AUD");
            tJPYNZD = getModel ("JPY/NZD");

            tCHFUSD = getModel ("CHF/USD");
            tCHFEUR = getModel ("CHF/EUR");
            tCHFGBP = getModel ("CHF/GBP");
            tCHFJPY = getModel ("CHF/JPY");
            tCHFCAD = getModel ("CHF/CAD");
            tCHFAUD = getModel ("CHF/AUD");
            tCHFNZD = getModel ("CHF/NZD");

            tCADUSD = getModel ("CAD/USD");
            tCADEUR = getModel ("CAD/EUR");
            tCADGBP = getModel ("CAD/GBP");
            tCADJPY = getModel ("CAD/JPY");
            tCADCHF = getModel ("CAD/CHF");
            tCADAUD = getModel ("CAD/AUD");
            tCADNZD = getModel ("CAD/NZD");

            tAUDUSD = getModel ("AUD/USD");
            tAUDEUR = getModel ("AUD/EUR");
            tAUDGBP = getModel ("AUD/GBP");
            tAUDJPY = getModel ("AUD/JPY");
            tAUDCHF = getModel ("AUD/CHF");
            tAUDCAD = getModel ("AUD/CAD");
            tAUDNZD = getModel ("AUD/NZD");

            tNZDUSD = getModel ("NZD/USD");
            tNZDEUR = getModel ("NZD/EUR");
            tNZDGBP = getModel ("NZD/GBP");
            tNZDJPY = getModel ("NZD/JPY");
            tNZDCHF = getModel ("NZD/CHF");
            tNZDCAD = getModel ("NZD/CAD");
            tNZDAUD = getModel ("NZD/AUD");

            sDateTime = listRates[0].datetime;
            sDate = listRates[0].datetime.substring (0,10);
            sHour = listRates[0].datetime.substring (11,2);
            sMin = listRates[0].datetime.substring (14,2);
            gmt = "GMT";
        }
    }
}
