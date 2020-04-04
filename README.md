# Update Java #
The `JDBC` files have been compiled to run with the Java 57 (i.e. SE 13) runtime engine. Therefore ensure java is updated with 

``` shell
sudo add-apt-repository ppa:linuxuprising/java
sudo apt-get update
sudo apt-get install oracle-java13-installer
```

# Download the jdbc #
I have put an example `mssql-jdbc-8.2.2.jre13.jar` that I got by:
1. Going onto the [microsoft sql jdbc page](https://docs.microsoft.com/en-us/sql/connect/jdbc/download-microsoft-jdbc-driver-for-sql-server?view=sql-server-ver15)
2. Clicking developer options and monitoring **network** to see what request is sent when I click on the download button
3. Running `wget` on the url found in step 2
``` shell
wget https://download.microsoft.com/download/4/0/8/40815588-bef6-4715-bde9-baace8726c2a/sqljdbc_8.2.2.0_enu.zip
```
4. Unzipping and copying file over the jdbc file

``` shell
unzip *.zip
```

# Running #
Then run 
``` shell
java -jar schemaspy-6.1.0.jar -configFile schemaspy.mssql.properties  -vizjs
```

