# Download the jdbc drivers #
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

# Write `.properties` file #
``` text
# type of database. Run with -dbhelp for details
schemaspy.t=pgsql11
# database properties: host, port number
schemaspy.host=172.17.0.1
schemaspy.port=5432
# get the database name by running \conninfo with psql
schemaspy.db=cream_db
# user and password
schemaspy.u=postgres
schemaspy.p=admin
# db scheme for which generate diagrams
#schemaspy.s=public
```
- `schemaspy.t` can be found by running
``` shell
java -jar jar/schemaspy-6.1.0.jar -dbhelp
```
- `schemaspy.host` needs to point to the host machine that has port to the database. Read more about it [on this confluence page](https://dreamsai.atlassian.net/wiki/spaces/CD/pages/17301813/Docker). To find the host machine run 
``` shell
ip addr | grep docker0
```

# Run #

``` shell
./generate_schema.sh $PROPERTIES_FILE
```
