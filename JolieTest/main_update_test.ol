include "console.iol"
include "./public/interfaces/MongoDbConnector.iol"
include "string_utils.iol"
main {
println@Console("hello")();
connectValue.host = "localhost";
connectValue.dbname ="prova";
connectValue.port = 27017;
connect@MongoDB(connectValue)();
q.collection = "prove";
q.query = "{nome: \"$name1\"}";
q.query.name1 = "Luca";
q.documentUpdate = "{$inc:{address:\"$address\"}}";
q.documentUpdate.address.city= "London";
q.documentUpdate.address.street= "Cherry St";
q.documentUpdate.address.streetNumber= 42;
valueToPrettyString@StringUtils (q)(s);
println@Console("q>>>>"+s)();
scope (updateScope){
     install (default=>  valueToPrettyString@StringUtils (updateScope)(s);
     println@Console("updateScope>>>>"+s)());
    update@MongoDB(q)(responseq)
};
valueToPrettyString@StringUtils (responseq)(s);
println@Console("responseq>>>>"+s)()
}