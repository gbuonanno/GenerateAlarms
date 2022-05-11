%Proyecto para generar alarmar a la base de datos de MySQL
% Linq Case
%Gino Buonanno

clear all;
clc

j=8;

% Establish connection with MySQL database 
vendor = "MySQL";
opts = databaseConnectionOptions("jdbc",vendor);
opts = setoptions(opts, ...
    'DataSourceName',"MySQL", ...
    'JDBCDriverLocation',"C:\Program Files (x86)\MySQL\Connector J 8.0\mysql-connector-java-8.0.28.jar", ...
    'DatabaseName',"test",'Server',"localhost", ...
    'PortNumber',3306);

% Establish connection the local host, username and password
username = "root";
password = "SUNRISE";
status = testConnection(opts,username,password);
saveAsDataSource(opts)

datasource = "MySQL";
conn = database(datasource,username,password);
%In case of failed connection message in command window

conn.Message

table_name = "test.alarms";
%(Primary key was eliminated for testing )
ID=2;
Unique_ID=2;
Date= "2022-10-03 11:15:01";

Data = table(ID,Unique_ID,Date,'VariableNames',{'ID','Unique_ID','Date'});
sqlwrite(conn,table_name,Data);








