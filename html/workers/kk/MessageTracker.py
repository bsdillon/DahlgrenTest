import sys
from html.workers.kk.parser import Parser

# http://www.cplusplus.com/reference/map/map/map/
# https://realpython.com/iterate-through-dictionary-python/
# message = sys.argv[1]

# get a dictionary of references
parser = Parser()
ref = parser.parse_from_url('https://www.jcs.mil/Portals/36/Documents/'
                            'Doctrine/Other_Pubs/ms_2525d.pdf',
                            [34, 35, 36])
table_ref = ref["Reference"]

message = open('message.txt', 'w')
# test that generates random strings of filed characters
# generate message
count = 0
while count < 10:
    message.write(parser.get_random_string(8) + '\n')
    count += 1

# writing cpp starts here
cpp = open("MessageDriver.cpp", "w")
cpp.write('#include abstractdriver.h\n#include<iostream>\n#include<fstream>'
          '\n\n')

cpp.write("std::map<char, string> getMap()\n{\n")
cpp.write("\tstd::map<char, std::string> reference;\n")
for key in table_ref:
    cpp.write("\treference[\'" + key + "\'] = \"" + table_ref[key] + "\";\n")

cpp.write("\nint main()\n{\n")
cpp.write("\tstd::map<char, string> ref = getMap();\n")
cpp.write("\tfstream file;\n\tstring word;\n")
cpp.write("\tfile.open(\"""message.txt""\".c_str());\n")
cpp.write("\twhile(file > word) {\n")
cpp.write("\t\tfor (int i = 0; i < word.length(); i++) {\n")
cpp.write("\t\t\tif (ref.count(word.at(i)) > 0) {\n")
cpp.write("\t\t\t\tcout << word.at(i) << \""" -> ""\" "
          "<< refMap[word.at(i)] << \"""\\n""\";\n")
cpp.write("\t\t\t}\n")
cpp.write("\t\t\telse {\n")
cpp.write("\t\t\t\tcout << \"""Title not found. Invalid Key"" << "
          "\"""\\n""\";\n")
cpp.write("\t\t\t}\n")
cpp.write("\t\t}\n")
cpp.write("\t}\n")
cpp.write("\n\treturn 0;\n}\n")
# writing cpp ends here

cpp.close()
