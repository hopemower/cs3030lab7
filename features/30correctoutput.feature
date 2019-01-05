Feature: Script outputs the correct data

	Scenario: Script correctly implements simple string replacement
		Given a file named "small123" with:
		"""
		one
		two
		three
		"""
		When I run `filter.pl 'e' '@'` interactively
		And I pipe in the file "small123"
		Then the stdout should contain:
		"""
		on@
		two
		thr@@
		"""
		And the stderr should not contain anything
		Then 20 points are awarded

	Scenario: Script correctly implements regular expression in FROMSTRING
		Given a file named "gettysburg" with:
		"""
		four score and seven years ago,
		our forefathers brought forth onto this continent
		a new nation, conceived in liberty 
		and dedicated to the proposition
		that all men are created equal.
		"""
		When I run `filter.pl '\b\w{4,5}\b' '4to5'` interactively
		And I pipe in the file "gettysburg"
		Then the stdout should contain:
		"""
		4to5 4to5 and 4to5 4to5 ago,
		our forefathers brought 4to5 4to5 4to5 continent
		a new nation, conceived in liberty 
		and dedicated to the proposition
		4to5 all men are created 4to5.
		"""
		And the stderr should not contain anything
		Then 20 points are awarded

	Scenario: Script correctly implements regular expression in FROMSTRING and TOSTRING
		Given a file named "gettysburg" with:
		"""
		four score and seven years ago,
		our forefathers brought forth onto this continent
		a new nation, conceived in liberty 
		and dedicated to the proposition
		that all men are created equal.
		"""
		When I run `filter.pl '([aeiou])([aeiou])' '$2$1'` interactively
		And I pipe in the file "gettysburg"
		Then the stdout should contain:
		"""
		fuor score and seven yaers ago,
		uor forefathers bruoght forth onto this continent
		a new natoin, concieved in liberty 
		and dedicated to the propositoin
		that all men are craeted eqaul.
		"""
		And the stderr should not contain anything
		Then 20 points are awarded

