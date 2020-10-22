# Batting Average

[![CI](https://github.com/wbotelhos/batting_average/workflows/CI/badge.svg?)](https://github.com/wbotelhos/batting_average/actions?query=workflow%3ACI)

## Setup

```sh
docker build . -t batting_average
```

## Run

```sh
docker run -it batting_average ruby calculate.rb --batting_file_path=data/Batting.csv --teams_file_path=data/Teams.csv
```

## Run with filters

```sh
docker run -it batting_average ruby calculate.rb --batting_file_path=data/Batting.csv --teams_file_path=data/Teams.csv --filter-year=1991 --filter-team-name='New York Mets'
```

## Tests

```sh
docker run -it batting_average rspec
```
