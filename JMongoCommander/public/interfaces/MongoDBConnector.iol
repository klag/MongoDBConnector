type JsonParserExceptionType: void {
  .message: string
}

/*----------------------------------------------------*/

type MongoDBConnectRequest:void{
  .host : string
  .dbname : string
  .port :int
  .password:string
  .username:string
  .timeZone:string
  .jsonStringDebug?:bool
  .logStreamDebug?:bool
}

type MongoDBConnectResponse: void

type MongoDBQueryRequest:void{
   .collection: string
   .filter?:undefined
   .sort?:undefined
   .limit?: int
}

type MongoDBQueryResponse:void{
   .document*: undefined
}
type MongoDBInsertRequest:void{
  .collection: string
  .document:undefined
}

type MongoDBInsertResponse:void


type MongoDBUpdateRequest:void{
  .collection: string
  .filter:undefined
  .documentUpdate:undefined
}

type MongoDBUpdateResponse:void

type MongoDBDeleteRequest:void{
  .collection: string
  .filter?:undefined
}

type MongoDBDeleteResponse:void

type MongoDBAggregateRequest:void{
    .collection: string
    .filter*:string{
       ?
    }
}

type MongoDBAggregateResponse:void{
    .document*:undefined
}

type MongoDBListCollectionRequest:undefined

type MongoDBListCollectionResponse:void{
  .collection*:string
}
interface MongoDBInterface {
  RequestResponse:
  connect( MongoDBConnectRequest )( MongoDBConnectResponse )
      throws MongoException  MongoConnectionError,
  query( MongoDBQueryRequest )( MongoDBQueryResponse )
      throws MongoException JsonParserException( JsonParserExceptionType ),
  insert( MongoDBInsertRequest )( MongoDBInsertResponse )
      throws MongoException JsonParserException( JsonParserExceptionType ),
  update( MongoDBUpdateRequest )( MongoDBUpdateResponse )
      throws MongoException JsonParserException( JsonParserExceptionType ),
  delete( MongoDBDeleteRequest )( MongoDBDeleteResponse )
      throws MongoException JsonParserException( JsonParserExceptionType ),
  aggregate( MongoDBAggregateRequest )( MongoDBAggregateResponse )
      throws MongoException JsonParserException( JsonParserExceptionType ),
  listCollection( MongoDBListCollectionRequest )( MongoDBListCollectionResponse )
      throws MongoException JsonParserException( JsonParserExceptionType ),
  getDBReadConcern( undefined )( undefined ),
  listDB( undefined )( undefined ),
  createRole( undefined )( undefined ),
  readRoles( undefined )( undefined ),
  updateRole( undefined )( undefined ),
  dropRole( undefined )( undefined )
}


outputPort MongoDB {
Interfaces: MongoDBInterface
}

embedded {
Java:
	"joliex.mongodb.MongoDbConnector" in MongoDB
}
