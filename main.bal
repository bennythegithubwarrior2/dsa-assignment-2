import ballerina/http;
import ballerina/sql;
import ballerinax/mysql;
import ballerina/io;

// Define the client record
type Client record {
    int id?;
    string Firstname;
    string Lastname;
    string address;
    string phone;
};

// Initialize the MySQL client
mysql:Client dbClient = check new (host = "127.0.0.1", user = "kenny", password = "Kennyisthegoat21", database = "dsa_assignment");

service /clients on new http:Listener(8080) {

    // Resource to add a new client
    resource function post .(http:Caller caller, http:Request req) returns error? {
        json|http:ClientError payload = req.getJsonPayload();
        if (payload is http:ClientError) {
            check caller->respond("Invalid JSON payload");
            return;
        }

        Client newClient = check payload.cloneWithType(Client);
        sql:ParameterizedQuery sqlQuery = `INSERT INTO customerdetails (CustomerID, FirstName, LastName, Email, Phone, Address) VALUES (${newClient.Firstname}, ${newClient.Lastname}, ${newClient.address}, ${newClient.phone})`;
        sql:ExecutionResult|sql:Error result = dbClient->execute(sqlQuery);
        if (result is sql:ExecutionResult) {
            check caller->respond("Client added successfully");
            io:println("Client added successfully");
        } else {
            check caller->respond("Failed to add client");
        }
    }
}
