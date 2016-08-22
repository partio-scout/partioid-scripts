#!/usr/bin/python

import sys

if (len(sys.argv)) != 4:
    print 'read_del.py <old users file> <new users file> <output file>'
    sys.exit(2)

old_users = open(sys.argv[1], 'r')
new_users = open(sys.argv[2], 'r')
output = open(sys.argv[3], 'w')

for line_old in old_users:
    old_membernumber = line_old.split(',')[0]
    user_found = False
    for line_new in new_users:
        new_membernumber = line_new.split(',')[0]
        if new_membernumber == old_membernumber:
            user_found = True
            break
    if user_found == False:
        output.write(line_old)
        
output.close()
new_users.close()
old_users.close()