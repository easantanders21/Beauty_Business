const mysql = require('mysql');
const { promisify } = require('util')

// Setting the default values to create connection with database
// const mysqlConnection = mysql.createConnection({
//     host: 'localhost',
//     user: 'root',
//     password: 'root',
//     database: 'db_products',
//     multipleStatements: true // allow to use the backtips for multiple statements

// });

// mysqlConnection.connect((err) => {
//     if(err){
//         console.log(err);
//         return;
//     } else {
//         console.log('Conectado a la Base de Datos:', mysqlConnection.config.database);
//     }
// });

// module.exports = mysqlConnection;

const mysqlConnection = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'db_products',
    multipleStatements: true // allow to use the backtips for multiple statements

});

mysqlConnection.getConnection((err, connection) => {
    if(err){
        console.log(err);
        return;
    }

    if(connection) {
        connection.release();
        console.log('Conectado a la Base de Datos');
        return;
    }
});

mysqlConnection.query = promisify(mysqlConnection.query);

module.exports = mysqlConnection;
