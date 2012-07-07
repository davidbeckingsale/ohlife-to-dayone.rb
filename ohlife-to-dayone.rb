#!/usr/bin/env ruby
#
# ohlife-to-dayone.rb
# David Beckingsale (www.davidbeckingsale.com)
#
# This script parses a text file with multiple "entries" with
# the following format:
#
#   YYYY-mm-dd
#
#   This is my entry.
#
# And creates a new DayOne entry for the parsed date and text.
# The whole file will be processed.

require "open3"

if ARGV.length != 1
    print "Usage: ./ohlife-to-dayone.rb <file>"
else
    infile = ARGV[0]
end


File.open(infile, "r") do |file|
    # Assumes the file starts with a date line!
    # I can't remember if I edited my OhLife.com file first...
    date = file.gets
    content = ""

    while line = file.gets
        # Keep going until you find a new date line...
        if /201[12]-[01][0-9]-[0-3][0-9]/ =~ line
            Open3.popen3("/Applications/Day One.app/Contents/MacOS/dayone", "-d=\"#{date}\"", "new") do |stdin, stdout, stderr|
                stdin.write(content)
                stdin.close_write
                puts stdout.read
            end
            # Set the new date.
            date = line
            # Reset content string.
            content = ""
            next
        end

        # Add the current line to our content string, this is reset
        # when we add to DayOne.
        content += line
    end
end
