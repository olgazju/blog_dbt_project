# Demo dbt project

This repository contains the source code for my post "How we mastered dbt: A true story"

## Local Setup for macOS

1. You should have a Firebolt account

2. Install [Docker](https://docs.docker.com/desktop/mac/install/)

3. Install Python and requirements.txt

    `pip install -r requirements.txt`

4. Create .env file in the root folder and fill the following variables:

    ```FIREBOLT_USER=
    FIREBOLT_PASSWORD=
    FIREBOLT_DATABASE=
    FIREBOLT_DATABASE_HOST=
    LOCAL_SCHEMA=dev
    FIREBOLT_ACCOUNT_NAME=
    FIREBOLT_ENGINE=
    ```
5. Export it.

    `export $(grep -v '^#' .env | xargs)`

6. Be sure that your Firebolt engine is running

7. Check the connection

    `dbt debug`

8. Run models

    `dbt run`

## Docker image

1. Install Docker Desktop and run it

2. Build docker image

    `docker build --tag dbt_project .`

3. Run any dbt command

    `docker run -it --env-file .env --publish 8080:8080 dbt_project dbt debug`
    `docker run -it --env-file .env --publish 8080:8080 dbt_project dbt run`
