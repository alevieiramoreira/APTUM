//import { setInterval } from 'timers';
//import { request } from 'https';
//import { connect } from 'http2';

const SerialPort = require('serialport');
const Readline = SerialPort.parsers.Readline;

class ArduinoDataRead {

    constructor() {
        this.listData = [];
    }

    get List() {
        return this.listData;
    }

    SetConnection() {

        SerialPort.list().then(listSerialDevices => {

            let listArduinoSerial = listSerialDevices.filter(serialDevice => {
                return serialDevice.vendorId == 2341 && serialDevice.productId == 43;
                //return serialDevice.vendorId == '2A03' && serialDevice.productId == '0043';
            });

            if (listArduinoSerial.length != 1) {
                throw new Error("Arduino não conectado ou muitas placas conectadas");
            }

            console.log("Arduino encontrado na com %s", listArduinoSerial[0].comName);

            return listArduinoSerial[0].comName;

        }).then(arduinoCom => {

            let arduino = new SerialPort(arduinoCom, { baudRate: 9600 });

            const parser = new Readline();
            arduino.pipe(parser);

            parser.on('data', (data) => {
                inserirRegistro(data);
                this.listData.push(parseFloat(data));
            });

        }).catch(error => console.log(error));
    }
}

const serial = new ArduinoDataRead();
serial.SetConnection();

module.exports.ArduinoData = { List: serial.List }

var Connection = require('tedious').Connection;
var config = {
    userName: 'bia_pc',
    password: 'b123456@',
    server: 'biapc.database.windows.net',
    // If you are on Microsoft Azure, you need this:  
    options: { encrypt: true, database: 'tb_expl' }
};
var connection = new Connection(config);
connection.on('connect', function (err) {
    if (err) {
        console.error('Erro ao tentar conexão com banco ' + err);
    } else {
        console.log("Conectado com o SQL Server");
    }
});


var Request = require('tedious').Request;
var TYPES = require('tedious').TYPES;
var ultimoregistro = Date.now();
var media;



function inserirRegistro(valor) {
	
			if (Date.now() - ultimoregistro >= 60 * 5000) {
				request = new Request("insert into tb_historico (temp_momento, temp_media,data_historico) values(@valor, (select avg(TEMPERATURA_TEMP) from TB_TEMPERATURA_REAL WHERE (DATA_TEMP < DateAdd(Hour, -3, Current_timestamp) and DATA_TEMP > DateAdd(Hour, -4, Current_timestamp))), DateAdd(Hour, -3, Current_timestamp));", function (err) {
					if (err) {
						console.log(err);
					}
				});
				request.addParameter('valor', TYPES.Float, valor);
				connection.execSql(request);
				ultimoregistro = Date.now();
			}
			else{
				request = new Request("INSERT into TB_TEMPERATURA_REAL values ( @temperatura, DateAdd(Hour, -3, Current_timestamp), NULL);", function (err) {
					if (err) {
						console.log(err);
					}
				});
				request.addParameter('temperatura', TYPES.Float, valor);
				connection.execSql(request);
			}
}