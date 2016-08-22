#!/usr/bin/python

import sys

if (len(sys.argv)) != 4:
    print 'read_upd.py <old users file> <new users file> <output file>'
    sys.exit(2)

old_users = open(sys.argv[1], 'r')
new_users = open(sys.argv[2], 'r')
output = open(sys.argv[3], 'w')

for line_new in new_users:
    new_membernumber = line_new.split(',')[0]
    user_found = False
    old_user_line = ''
    for line_old in old_users:
        old_membernumber = line_old.split(',')[0]
        if new_membernumber == old_membernumber:
            user_found = True
            old_user_line = line_old
            break
    if user_found == True and line_new != old_user_line:
        output.write(line_new)

output.close()
new_users.close()
old_users.close()
