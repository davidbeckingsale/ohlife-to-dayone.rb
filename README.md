# ohlife-to-dayone.rb

This script parses a text file exported from [ohlife](http://ohlife.com/), 
with multiple "entries" with the following format:

    YYYY-mm-dd
    
    This is my entry.

And creates a new DayOne entry for each date, content pair.
For each entry added you will see a printout, like this:

    New entry : ~/path/to/some/entry.doentry


## Assumptions

- File starts with a date.
- No error checking!
- Assumes entries are from 2011 or 2012.

## Credit to:
- [DayOne sample script](https://gist.github.com/977766)
- [Brett Terpstra's script](http://brettterpstra.com/logging-with-day-one-geek-style/)
