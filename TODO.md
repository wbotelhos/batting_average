# Batting Average App

Batting average is simple and a common way to measure batter’s performance.
Create an app that will ingest a raw CSV file with player statistics and
presents simple UI for ranking and filtering players based on their batting
performance.


## Interface

The application should take an input in form of a CSV file. The file will be
comma separated CSV with headers. The headers that interest you are: “playerID”,
“yearID”, “stint”, teamID”, “AB”, and “H”.

Batting Average is calculated as: BA = H/AB (Hits / At Bats).

Once the file is loaded and processed, the user will see the following table
sorted by Batting Averages:

```
+----------+--------+--------------+-----------------+
| playerID | yearId | Team name(s) | Batting Average |
+----------+--------+--------------+-----------------+
| ...                                                |
+----------------------------------------------------+
```

If the player has more stints in the season, calculate batting average for the
whole season (across all stints), team names are comma separated in that case.
Format the batting average to 3 decimals.

The table should be filterable by any of these:

* Player ID (use autocomplete/searchable select)
* Year (simple select)

When filter is selected, the table presents players that match the filter,
sorted according to their batting average.


## CSV files

The input CSV file is `Batting.csv`. This file includes "teamID", use the
file `Teams.csv` to map "teamID" to a team's real name. You can process the
teams file and have the data ready in your app to map out "teamID" to team
names, it doesn't need to be uploaded from the user.


## Guidelines

* Use any of the major languages that can run on OSX
* The app can be client only or client-server split, up to you
* Do not fork this repo, create a clean one for a solution
* Feel free to ask for any clarification
