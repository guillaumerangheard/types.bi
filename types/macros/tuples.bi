#macro t_define_tuples(_a_,_t_)
union _a_##t2
    type : as _t_ i, j : end type
    type : as _t_ s, t : end type
    type : as _t_ x, y : end type
end union
union _a_##t3
    type : as _t_ i, j, k : end type
    as _a_##t2 ij
    type : as _t_ r, g, b : end type
    type : as _t_ s, t, u : end type
    as _a_##t2 st
    type : as _t_ x, y, z : end type
    as _a_##t2 xy
end union
union _a_##t4
    type : as _t_ i, j, k, l : end type
    as _a_##t2 ij
    as _a_##t3 ijk
    type : as _t_ r, g, b, a : end type
    type : as _t_ s, t, u, v : end type
    as _a_##t2 st
    as _a_##t3 stu
    type : as _t_ x, y, z, w : end type
    as _a_##t2 xy
    as _a_##t3 xyz
end union
#endmacro