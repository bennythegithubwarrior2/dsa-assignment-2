import ballerina/sql;
import ballerinax/mysql;
import ballerina/io;
import ballerina/log;
import ballerinax/mysql.driver as _;






public function checkAvailableTimeslots(string deliveryDay, string ShipmentType = "StandardDelivery") returns boolean|int[]|error {

    mysql:Client dbClient = check new ( 
        host = "localhost", 
        port = 3306, 
        database = "dsaproject", 
        user = "bennyman123", 
        password = "Sunday11"
    );

    
    sql:ParameterizedQuery countQuery = `SELECT COUNT(*) AS requestCount FROM shipment_requests 
                                         WHERE deliveryDay = ${deliveryDay} AND shipmentType = ${shipmentType}`;

    
    stream<record {}, sql:Error> countStream = dbClient->query(countQuery);

   
    int requestCount = 0;

    
    error? e = countStream.forEach(function(record {} result) {
        requestCount = check result["requestCount"];
    });

    
    check countStream.close();

    
    if (requestCount >= 6) {
        check dbClient.close();
        return false;
    }

    
    sql:ParameterizedQuery selectQuery = `SELECT deliveryTime FROM shipment_requests 
        WHERE deliveryDay = ${deliveryDay}`;

    
    stream<record {}, sql:Error> resultStream = dbClient->query(selectQuery);

    
    int[] occupiedTimeslots = [];

    
    e = resultStream.forEach(function(record {} result) {
        int deliveryTime = check result["deliveryTime"];
        occupiedTimeslots.push(deliveryTime);
    });

    
    check resultStream.close();

    
    int[] allTimeslots = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24];

    
    int[] availableTimeslots = [];
    foreach int timeslot in allTimeslots {
        if (!occupiedTimeslots.includes(timeslot)) {
            availableTimeslots.push(timeslot);
        }
    }

    
    check dbClient.close();

    return availableTimeslots;
}
