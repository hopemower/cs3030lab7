Feature: Script must be named "filter.pl", present and be marked as executable
	Scenario: filter.pl must be found
		When I run `getfile` 
		Then a file named "../../bin/filter.pl" should exist
		Then 5 points are awarded

	Scenario: filter.pl must be executable
		When I run `filter.pl`
		Then 5 points are awarded
