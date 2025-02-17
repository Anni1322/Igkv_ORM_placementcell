// db.js
const sql = require("mssql/msnodesqlv8");


// Anil database 
var config = {
server: "ANNI\\SQLEXPRESS",
database: "placementcell",
driver: "msnodesqlv8",
options: {
    trustedConnection: true
}
};

// Connect to the database
sql.connect(config, function(err) {
    if (err) console.log(err);
    else console.log("Database connected successfully");
});

// Export the sql object to be used in other modules
module.exports = sql;



 