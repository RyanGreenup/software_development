# Database Integration

- File IO
    - Reading to and from files
    - JSON, YAML and TOML
    - Using YAMl as a config file (i.e. read it in as a dict)
- Basics of SQLite and DuckDB
    - Sqlitebrowser
- Deploying PostgresQL for development


## Student Tasks

- Import the Iris data from Seaborn
- Write it to:
    - Json
    - Yaml
    - TOML
- Write it to a parquet file and view it with Visidata
- Use DuckDB to import that parquet file and view it with vdsql
- Adapt the GUI from last lesson to plot the data from the SQL database (you may use SQLite if you wish)
- Advanced Students
    - Use Docker to deploy PostgresQL
    - Use Python to import the Iris Dataset
    - Adapt the GUI to display that data
    - To begin, combine these two compose files into one and deploy them
        - postgres
            ```yaml
            version: '3.1'

            services:

              db:
                image: postgres
                restart: unless-stopped
                environment:
                  POSTGRES_PASSWORD: example
                  POSTGRES_HOST_AUTH_METHOD: trust
                  PGDATA: /var/lib/postgresql/data/pgdata
                volumes:
                  - ./data/pgdata:/var/lib/postgresql/data/pgdata
                ports:
                  - 5432:5432
              ```
        - PGAdmin

            ```yaml
            version: '3.1'

            services:

              db:
                image: postgres
                restart: unless-stopped
                environment:
                  POSTGRES_PASSWORD: example
                  POSTGRES_HOST_AUTH_METHOD: trust
                  PGDATA: /var/lib/postgresql/data/pgdata
                volumes:
                  - ./data/pgdata:/var/lib/postgresql/data/pgdata
                ports:
                  - 5432:5432

              adminer:
                image: adminer
                restart: always
                ports:
                  - 8787:8080
              pgadmin:
                  container_name: pgadmin4_container
                  image: dpage/pgadmin4
                  restart: always
                  environment:
                    PGADMIN_DEFAULT_EMAIL: admin@admin.com
                    PGADMIN_DEFAULT_PASSWORD: root
                  volumes:
                    - ./data/pgadmin:/var/lib/pgadmin
                  ports:
                    - "5050:80"
            ```


