#ifndef _TYPES_BI_
    
    #define _TYPES_BI_
    
    #define TYPES_VERSION_MAJOR 26
    #define TYPES_VERSION_MINOR 1
    const as string t_version => "types.bi v" & TYPES_VERSION_MAJOR & "." & TYPES_VERSION_MINOR
    
    #include "types.cfg"
    
    type    t_i8         as byte
    #define t_ci8        cbyte
    type    t_i8p        as byte ptr
    #define t_ci8p(_a_)  cptr(byte ptr, _a_)
    
    type    t_u8         as ubyte
    #define t_cu8        cubyte
    type    t_u8p        as ubyte ptr
    #define t_cu8p(_a_)  cptr(ubyte ptr, _a_)
    
    type    t_i16        as short
    #define t_ci16       cshort
    type    t_i16p       as short ptr
    #define t_ci16p(_a_) cptr(short ptr, _a_)
    
    type    t_u16        as ushort
    #define t_cu16       cushort
    type    t_u16p       as ushort ptr
    #define t_cu16p(_a_) cptr(ushort ptr, _a_)
    
    type    t_i32        as long
    #define t_ci32       clng
    type    t_i32p       as long ptr
    #define t_ci32p(_a_) cptr(long ptr, _a_)
    
    type    t_u32        as ulong
    #define t_cu32       culng
    type    t_u32p       as ulong ptr
    #define t_cu32p(_a_) cptr(ulong ptr, _a_)
    
    type    t_i64        as longint
    #define t_ci64       clngint
    type    t_i64p       as longint ptr
    #define t_ci64p(_a_) cptr(longint ptr, _a_)
    
    type    t_u64        as ulongint
    #define t_cu64       culngint
    type    t_u64p       as ulongint ptr
    #define t_cu64p(_a_) cptr(ulongint ptr, _a_)
    
    type    t_f32        as single
    #define tcf32        csng
    type    t_f32p       as single ptr
    #define t_cf32p(_a_) cptr(single ptr, _a_)
    
    type    t_f64        as double
    #define t_cf64       cdbl
    type    t_f64p       as double ptr
    #define t_cf64p(_a_) cptr(double ptr, _a_)
    
    #macro t_defineVectors(_a_)
        #ifndef t_##_a_##vec2
        union t_##_a_##vec2
            type : as t_##_a_ i, j : end type
            type : as t_##_a_ s, t : end type
            type : as t_##_a_ x, y : end type
            
            declare constructor ()
            declare constructor (byref as const t_##_a_, byref as const t_##_a_)
            declare constructor (byref as const t_##_a_##vec2)
            
            declare const operator cast () as string
            declare       operator let  (byref as const t_##_a_##vec2)
        end union
        
        constructor t_##_a_##vec2 ()
            ' Empty by design.
        end constructor
        
        constructor t_##_a_##vec2 (byref s1 as const t_##_a_, byref s2 as const t_##_a_)
            this.x => s1
            this.y => s2
        end constructor
        
        constructor t_##_a_##vec2 (byref v as const t_##_a_##vec2)
            this.x => v.x
            this.y => v.y
        end constructor
        
        operator t_##_a_##vec2.cast () as string
            return "<t_" & #_a_ & "vec2>{ x : " & this.x & ", y : " & this.y & " }"
        end operator
        
        operator t_##_a_##vec2.let (byref v as const t_##_a_##vec2)
            if @this <> @v then
                this.x => v.x
                this.y => v.y
            end if
        end operator
        #endif
        
        #ifndef t_##_a_##vec3
        union t_##_a_##vec3
            type : as t_##_a_ i, j, k : end type
            type : as t_##_a_ s, t, u : end type
            type : as t_##_a_ x, y, z : end type
            
            declare constructor ()
            declare constructor (byref as const t_##_a_, byref as const t_##_a_, byref as const t_##_a_ => 0)
            declare constructor (byref as const t_##_a_##vec2                  , byref as const t_##_a_ => 0)
            declare constructor (byref as const t_##_a_##vec3)
            
            declare const operator cast () as string
            declare       operator let  (byref as const t_##_a_##vec2)
            declare       operator let  (byref as const t_##_a_##vec3)
        end union
        
        constructor t_##_a_##vec3 ()
            ' Empty by design.
        end constructor
        
        constructor t_##_a_##vec3 (byref s1 as const t_##_a_, byref s2 as const t_##_a_, byref s3 as const t_##_a_ => 0)
            this.x => s1
            this.y => s2
            this.z => s3
        end constructor
        
        constructor t_##_a_##vec3 (byref v as const t_##_a_##vec2, byref s3 as const t_##_a_ => 0)
            this.x => v.x
            this.y => v.y
            this.z => s3
        end constructor
        
        constructor t_##_a_##vec3 (byref v as const t_##_a_##vec3)
            this.x => v.x
            this.y => v.y
            this.z => v.z
        end constructor
        
        operator t_##_a_##vec3.cast () as string
            return "<t_" & #_a_ & "vec3>{ x : " & this.x & ", y : " & this.y & ", z : " & this.z & " }"
        end operator
        
        operator t_##_a_##vec3.let (byref v as const t_##_a_##vec2)
            this.x => v.x
            this.y => v.y
            this.z => 0
        end operator
        
        operator t_##_a_##vec3.let (byref v as const t_##_a_##vec3)
            this.x => v.x
            this.y => v.y
            this.z => v.z
        end operator
        #endif
        
        #ifndef t_##_a_##vec4
        union t_##_a_##vec4
            type : as t_##_a_ i, j, k, l : end type
            type : as t_##_a_ s, t, u, v : end type
            type : as t_##_a_ x, y, z, w : end type
            
            declare constructor ()
            declare constructor (byref as const t_##_a_, byref as const t_##_a_, byref as const t_##_a_ => 0, byref as const t_##_a_ => 0)
            declare constructor (byref as const t_##_a_##vec2                  , byref as const t_##_a_ => 0, byref as const t_##_a_ => 0)
            declare constructor (byref as const t_##_a_##vec3                                               , byref as const t_##_a_ => 0)
            declare constructor (byref as const t_##_a_##vec4)
            
            declare const operator cast () as string
            declare       operator let  (byref as const t_##_a_##vec2)
            declare       operator let  (byref as const t_##_a_##vec3)
            declare       operator let  (byref as const t_##_a_##vec4)
        end union
        
        constructor t_##_a_##vec4 ()
            ' Empty by design.
        end constructor
        
        constructor t_##_a_##vec4 (byref s1 as const t_##_a_, byref s2 as const t_##_a_, byref s3 as const t_##_a_ => 0, byref s4 as const t_##_a_ => 0)
            this.x => s1
            this.y => s2
            this.z => s3
            this.w => s4
        end constructor
        
        constructor t_##_a_##vec4 (byref v as const t_##_a_##vec2, byref s3 as const t_##_a_ => 0, byref s4 as const t_##_a_ => 0)
            this.x => v.x
            this.y => v.y
            this.z => s3
            this.w => s4
        end constructor
        
        constructor t_##_a_##vec4 (byref v as const t_##_a_##vec3, byref s4 as const t_##_a_ => 0)
            this.x => v.x
            this.y => v.y
            this.z => v.z
            this.w => s4
        end constructor
        
        constructor t_##_a_##vec4 (byref v as const t_##_a_##vec4)
            this.x => v.x
            this.y => v.y
            this.z => v.z
            this.w => v.w
        end constructor
        
        operator t_##_a_##vec4.cast () as string
            return "<t_" & #_a_ & "vec4>{ x : " & this.x & ", y : " & this.y & ", z : " & this.z & ", w : " & this.w & " }"
        end operator
        
        operator t_##_a_##vec4.let (byref v as const t_##_a_##vec2)
            this.x => v.x
            this.y => v.y
            this.z => 0
            this.w => 0
        end operator
        
        operator t_##_a_##vec4.let (byref v as const t_##_a_##vec3)
            this.x => v.x
            this.y => v.y
            this.z => v.z
            this.w => 0
        end operator
        
        operator t_##_a_##vec4.let (byref v as const t_##_a_##vec4)
            this.x => v.x
            this.y => v.y
            this.z => v.z
            this.w => v.w
        end operator
        #endif
    #endmacro
    
    #ifndef t_arrayChunkSize
        #define t_arrayChunkSize 10
    #endif
    
    type t_baseArray
        public:
            declare const operator cast () as string
            
            declare const property length () as integer
            declare const property size   () as integer
            
            declare const function toJSON () as string
        protected:
            as integer _l, _ ' Length (in items).
                       _s    ' Size (in items).
    end type
    
    operator t_baseArray.cast () as string
        return "<t_undefinedArray>"
    end operator
    
    property t_baseArray.length () as integer
        return this._l
    end property
    
    property t_baseArray.size () as integer
        return this._s
    end property
    
    function t_baseArray.toJSON () as string
        return "[]"
    end function
    
    #macro t_defineArray(_a_)
        #ifndef t_##_a_##array
        type t_##_a_##array extends t_baseArray
            public:
                declare constructor ()
                declare constructor (byref as const integer)
                declare constructor (byref as const t_##_a_##array)
                declare destructor  ()
                
                declare const operator []   (byref as const integer) byref as t_##_a_
                declare       operator &=   (byref as const t_##_a_)
                'declare       operator &=   (byref as const t_##_a_)
                declare const operator cast () as string
                'declare       operator let  (byref as const t_##_a_)
                
                'declare property length (byref as const integer)
                
                declare       function append  overload (byref as const t_##_a_)        as integer
                'declare       function append           (byref as const t_##_a_##array) as integer
                declare const function forEach overload (as sub (byref as t_##_a_))                         as boolean
                declare const function forEach          (as sub (byref as t_##_a_, byref as const integer)) as boolean
                'declare       function insert  overload (byref as const integer, byref as const t_##_a_)        as integer
                'declare       function insert           (byref as const integer, byref as const t_##_a_##array) as integer
                'declare const function map              (byref as t_##_a_##array, as function (byref as const t_##_a_) as t_##_a_) as boolean
                'declare       function prepend overload (byref as const t_##_a_)        as integer
                'declare       function prepend          (byref as const t_##_a_##array) as integer
                'declare       function remove           (byref as const integer, byref as const integer => 1) as integer
                declare const function toJSON           () as string
            protected:
                as t_##_a_##p _p, _ ' Payload.
                              _d    ' Dummy.
        end type
        
        constructor t_##_a_##array ()
            this._s => t_arrayChunkSize
            this._p => new t_##_a_[t_arrayChunkSize]
            this._d => new t_##_a_
        end constructor
        
        constructor t_##_a_##array (byref l as const integer)
            if 0 < l then
                this._l => l
                this._s => iif(this._l mod t_arrayChunkSize, (this._l \ t_arrayChunkSize + 1) * t_arrayChunkSize, this._l)
            else
                #ifdef t_verbose
                print "<t_" & #_a_ & "array.constructor> Error. Array length must be a positive number. Defaulting to 0."
                #endif
                this._s => t_arrayChunkSize
            end if
            this._p => new t_##_a_[this._s]
            this._d => new t_##_a_
        end constructor
        
        constructor t_##_a_##array (byref a as const t_##_a_##array)
            if a._l then
                this._l => a._l
                this._s => iif(this._l mod t_arrayChunkSize, (this._l \ t_arrayChunkSize + 1) * t_arrayChunkSize, this._l)
                this._p => new t_##_a_[this._s]
                for i as integer => 0 to this._l - 1
                    this._p[i] => a._p[i]
                next i
            else
                this._s => t_arrayChunkSize
                this._p => new t_##_a_[t_arrayChunkSize]
            end if
            this._d => new t_##_a_
        end constructor
        
        destructor t_##_a_##array ()
            delete[] this._p
            delete   this._d
        end destructor
        
        operator t_##_a_##array.[] (byref i as const integer) byref as t_##_a_
            if (0 <= i) and (i < this._l) then return this._p[i]
            return *(this._d)
        end operator
        
        operator t_##_a_##array.&= (byref v as const t_##_a_)
            this.append(v)
        end operator
        
        'operator t_##_a_##array.&= (byref a as const t_##_a_##array)
        '    this.append(a)
        'end operator
        
        operator t_##_a_##array.cast () as string
            return "<t_" & #_a_ & !"array>{\n    length : " & this._l & _
                                        !",\n    size   : " & this._s & !"\n}"
        end operator
        
        'operator t_##_a_##array.let (byref a as const t_##_a_##array)
        '    if @this <> @a then
        '        
        '    end if
        'end operator
        
        function t_##_a_##array.append overload (byref v as const t_##_a_) as integer
            if this._l = this._s then
                this._s += t_arrayChunkSize
                dim as t_##_a_##p q => new t_##_a_[this._s]
                for i as integer => 0 to this._l - 1
                    q[i] => this._p[i]
                next i
                delete[] this._p
                this._p => q
            end if
            this._p[this._l] => v
            this._l += 1
            return this._l
        end function
        
        'function t_##_a_##array.append (byref a as const t_##_a_##array) as integer
        '    if @this <> @a then
        '        
        '    else
        '        
        '    end if
        '    return this._l
        'end function
        
        function t_##_a_##array.forEach overload (f as sub (byref as t_##_a_)) as boolean
            if this._l then
                if f then
                    for i as integer => 0 to this._l - 1
                        f(this._p[i])
                    next i
                    return true
                #ifdef t_verbose
                else
                    print "<t_" & #_a_ & "array.forEach> Unable to proceed. Callback function is undefined."
                #endif
                end if
            #ifdef t_verbose
            else
                print "<t_" & #_a_ & "array.forEach> Unable to proceed. Array is empty."
            #endif
            end if
            return false
        end function
        
        function t_##_a_##array.forEach (f as sub (byref as t_##_a_, byref as const integer)) as boolean
            if this._l then
                if f then
                    for i as integer => 0 to this._l - 1
                        f(this._p[i], i)
                    next i
                    return true
                #ifdef t_verbose
                else
                    print "<t_" & #_a_ & "array.forEach> Unable to proceed. Callback function is undefined."
                #endif
                end if
            #ifdef t_verbose
            else
                print "<t_" & #_a_ & "array.forEach> Unable to proceed. Array is empty."
            #endif
            end if
            return false
        end function
        
        'function t_##_a_##array.insert overload (byref i as const integer, byref v as const t_##_a_) as integer
        '    
        '    return this._l
        'end function
        
        'function t_##_a_##array.insert (byref i as const integer, byref a as const t_##_a_##array) as integer
        '    
        '    return this._l
        'end function
        
        'function t_##_a_##array.map (byref a as t_##_a_##array, f as function (byref as const t_##_a_) as t_##_a_) as boolean
        '    
        'end function
        
        'function t_##_a_##array.prepend overload (byref v as const t_##_a_) as integer
        '    
        '    return this._l
        'end function
        
        'function t_##_a_##array.prepend (byref a as const t_##_a_##array) as integer
        '    
        '    return this._l
        'end function
        
        function t_##_a_##array.toJSON overload () as string
            select case this._l
            case 0 : return "[]"
            case 1 : return "[" & this._p[0] & "]"
            case else
                dim as string r => "[" & this._p[0]
                for i as integer => 1 to this._l - 1
                    r &= "," & this._p[i]
                next i
                return r & "]"
            end select
        end function
        #endif
    #endmacro
    
#endif