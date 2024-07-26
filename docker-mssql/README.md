# Docker: Microsoft SQL Server

From this folder, run the command

```
docker compose up -d
```

To change the initial setup of the database, edit the [init.sql](./init-db/init.sql) file.

## Product Edition

There is an environment variable in the `docker-compose.yml` file that specifies the product edition to use for the container. The default value is **Developer**. The following table describes the different valid values for this variable.

| Value       | Description                                                                                                                 |
|-------------|-----------------------------------------------------------------------------------------------------------------------------|
| Developer   | Full-featured edition, free for development and testing purposes. Not licensed for production use.                          |
| Express     | Free, lightweight edition with limited resources and feature set, ideal for small applications or development environments. |
| Standard    | Mid-tier edition with a balanced feature set for most business workloads. Requires a paid license.                          |
| Enterprise  | High-end edition with all available SQL Server features, Requires a paid license.                                           |
| Evaluation  | Enterprise edition features, free for 180 days to evaluate SQL Server capabilities.                                         |
| Product Key | You can specify a product key (e.g., MSSQL_PID=AAAAA-BBBBB-CCCCC-DDDDD-EEEEE) to activate a specific licensed version.      |

## Connecting using DBeaver

Enter the following values into the specified fields on the *Main* tab of the *Connection settings* modal dialog to create a new connection:

| Field Name  | Value                    |
|-------------|--------------------------|
| Server Host | localhost                |
| Database    | master                   |
| Port        | 1433                     |
| Username    | sa                       |
| Password    | *&lt;MSSQL_PASSWORD&gt;* |

Click on the **Test Connection...** button to verify that the connection can be made successfully.

