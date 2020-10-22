# Batting Average

## Setup

```sh
docker build . -t batting_average
```

## Run

```sh
docker run -it batting_average ruby calculate --batting_file_path=Batting.csv --teams_file_path=Teams.csv
```

## Run with filters

```sh
docker run -it batting_average ruby calculate --batting_file_path=Batting.csv --teams_file_path=Teams.csv --filter-year=1991 --filter-team-name='New York Mets'
```

## Tests

```sh
docker run -it batting_average rspec
```
