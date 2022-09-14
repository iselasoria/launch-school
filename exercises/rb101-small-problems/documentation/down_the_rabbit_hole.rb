# Sometimes, the documentation is going to leave you scratching your heard.
# In a very early assignment in LS, you are tasked with writing a program that loads
# some text messages from a YAML file. We do this with `YAML::load_file`

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')