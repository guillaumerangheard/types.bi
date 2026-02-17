#include "types/types.bi"

print "Done compiling " & t_version & !".\n"

t_defineArray(f32)
dim as t_f32array a => type(11)
print a.toJSON

sleep
