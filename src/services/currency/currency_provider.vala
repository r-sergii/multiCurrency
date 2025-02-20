namespace Multicurrency {

    class CurrencyProvider {
        const string baseUrl = "https://nodejs-mysql-nine.vercel.app/supabase";

        //Soup.Session session;
        //Soup.Message mes;
        Http.Client http;

        public CurrencyProvider() {
            //session = new Soup.Session ();
            http = new Http.Client();
        }

        public void getItems ( Gee.ArrayList<CurrencyModel> listRates ) {
            var host = baseUrl + "/read";

            try {
                var response = http.get( host );
                if ( response.status.code == 200 ){
                    //stdout.printf(@"My public IP address is: $(response)\n");
//                    message (response.to_string ());

                    var parser = new Json.Parser ();
                    parser.load_from_data ((string)response.to_string (), -1);
                    unowned Json.Node node = parser.get_root();
                    unowned Json.Array arr = node.get_array();
                    int i = 0;
                    foreach(unowned Json.Node item in arr.get_elements ()) {
                        listRates.add (new CurrencyModel.fromJson (item) );

                        i++;
//                        message(i.to_string());
                    }
                }
            } catch (Error err){
                stderr.printf(@"$(err.message)\n");
            }

/*
            var url = baseUrl + "/read";
            mes = new Soup.Message ("GET", url);
            session.send_message (mes);
            message ((string)mes.response_body.flatten().data);

            try {
                var parser = new Json.Parser ();
                parser.load_from_data ((string)mes.response_body.flatten().data, -1);
                unowned Json.Node node = parser.get_root();
                unowned Json.Array arr = node.get_array();
                int i = 0;
                foreach(unowned Json.Node item in arr.get_elements ()) {
                    listRates.add (new CurrencyModel.fromJson (item) );

                    i++;
                    message(i.to_string());
                }
            } catch (Error e) {
                message (baseUrl + "/ not valid");
            }
*/
        }
    }
}
