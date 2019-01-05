Feature: Script reports to the right place and exits properly

	Scenario: With parameters missing, "Usage:" msg and exits with rc=1
		When I run `filter.pl`
		And the stderr should contain "Usage:"
		And the stdout should not contain anything
		Then the exit status should be 1
		Then 5 points are awarded

	Scenario: Exits rc=0 on successful completion with empty strings
		Given a file named "small123" with:
		"""
		one
		two
		three
		"""
		When I run `filter.pl '' ''` interactively
		And I pipe in the file "small123"
		Then the output should contain:
		"""
		one
		two
		three
		"""
		And the stderr should not contain anything
		Then the exit status should be 0
		Then 5 points are awarded

	Scenario: reads via stdin and writes to stdout only (two tests in one)
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

