include "console.iol"
include "string_utils.iol"
include "time.iol"

include "public/interfaces/MongoDBConnector.iol"

init {
    scope( ConnectionMongoDbScope ) {
      install ( default => valueToPrettyString@StringUtils( ConnectionMongoDbScope )();
                           println@Console(s)()
      );
      with( connectValue ) {
          .host = "localhost";
          .dbname ="Test";
          .password = "test";
          .username = "admin";
          .timeZone = "Europe/Berlin";
          .port = 27017;
          .jsonStringDebug = true
      };
      connect@MongoDB( connectValue )();
      println@Console( "Connected to database " + connectValue.dbname )()
  }
}


main {
  scope( InsertMongoTest ) {
        install( default => valueToPrettyString@StringUtils( InsertMongoTest )( s );
                            println@Console( s )()
        );

        getCurrentTimeMillis@Time()( currentTime );


        q.collection = "CustomerSales";
        with( q.document ) {
            .name    = "Balint2";
            .surname = "Maschio2";
            .code = "LALA01";
            .age = 28;
            with( .poligon ) {
               .type = "Polygon";
               .coordinates[0].log= 65.4;
               .coordinates[0].lat= 65.4;
               .coordinates[1].log= 67.4;
               .coordinates[1].lat= 65.4;
               .coordinates[2].log= 65.4;
               .coordinates[2].lat= 66.4
            };
            .date = L123124321432;
            .date.("@type") = "datetime"
        };
        valueToPrettyString@StringUtils( q )( s );
        println@Console(" q >>>> " + s )();
        insert@MongoDB( q )( result );
        valueToPrettyString@StringUtils( result )( s );
        println@Console("result >>>> " + s )()
    }
}
