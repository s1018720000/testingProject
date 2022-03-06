# AS-Portal

### AS-Portal Project 

### Steps for Using this project 
JDK install   
Intellij IDEA   
install Git   
Clone   
Open gradle file as a project  


### Centos install flyway  
1.wget -qO- https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/6.2.2/flyway-commandline-6.2.2-linux-x64.tar.gz | tar xvz && sudo ln -s `pwd`/flyway-6.2.2/flyway /usr/local/bin

### Window install guide  22222
====== mysql db ============================  
install mysql >= 5.7 (5.7.34.0)  
tips：mysql 5.6 does not support flyway, must install version 5.7 and above  
create db name is monitor  
Modify it to your own database configuration in the `application-dev.yml` file  
run `MainApplication.java` to start the project  


Install problem
-Mysql
 1. delete Mysql folder under these paths
    (1) C:\ProgramData\MySQL
    (2) C:\Program Files\MySQL
    (3) C:\Users\{user}\AppData\Local\MySQL
 2. (1) cmd -> sc delete mysql -> if not process (2)
    (2) Services -> MySQL -> stop service
 3. Regedit 
    (1) \HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\services\eventlog\Application\MySQL
    (2) \HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\services\eventlog\Application\MySQL
    (3) \HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Eventlog\Application\MySQL
 4. If you get 1067 failed while installing, please check your my.ini file