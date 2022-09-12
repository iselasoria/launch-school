# Locate the ruby documentation for methods File::path and File#path. How are they different?

# File::path
# This method returns the string representation of a file path
# File.path("/dev/null")

# File#path
# Returns the pathname used to create file as a string.

# File.new("testfile").path               #=> "testfile"
# File.new("/tmp/../tmp/xxx", "w").path   #=> "/tmp/../tmp/xxx"