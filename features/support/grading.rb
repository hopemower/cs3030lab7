$total_points = 0

Before do
	# log Dir.pwd
	ENV['LIBC_FATAL_STDERR_'] = "1"

	if File.file?('/tmp/jenkins')
		#log "Found leftover file /tmp/jenkins...deleting"
		File.delete('/tmp/jenkins')
	end

	if File.directory?('/tmp/jenkins')
		#log "Found leftover folder /tmp/jenkins...deleting"
		FileUtils.rm_rf('/tmp/jenkins')
	end
end

After do
	if File.file?('/tmp/jenkins')
		log "WARNING: Found leftover file /tmp/jenkins...deleting"
		File.delete('/tmp/jenkins')
	end

	if File.directory?('/tmp/jenkins')
		log "NOTICE: Found leftover folder /tmp/jenkins...deleting"
		FileUtils.rm_rf('/tmp/jenkins')
	end

end

at_exit do
	log "A total of #{$total_points} points have been awarded."
end
