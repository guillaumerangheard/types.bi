#macro t_define_array(_a_,_t_,_z_)
type _a_##array extends baseArray
    public:
        declare constructor ()
        declare constructor (byref as const integer)
        declare constructor (byref as const integer, as sub (byref as _t_))
        declare constructor (byref as const integer, as sub (byref as _t_, byref as const integer), byref as const boolean => false)
        declare constructor (byref as const _a_##array)
        declare destructor  ()
        
        declare       operator &=   (byref as const _t_)
        declare       operator &=   (byref as const _a_##array)
        declare       operator []   (byref as const integer) byref as _t_
        declare const operator cast () as string
        declare       operator let  (byref as const _a_##array)
        
        declare const property avg    () as double
        declare       property length (byref as const integer)
        declare const property max    () as _t_
        declare const property min    () as _t_
        
        declare       function forEach overload (as sub      (byref as _t_)                                   , byref as const boolean => false) as boolean
        declare       function forEach          (as function (byref as _t_)                         as boolean, byref as const boolean => false) as boolean
        declare       function forEach          (as sub      (byref as _t_, byref as const integer)           , byref as const boolean => false) as boolean
        declare       function forEach          (as function (byref as _t_, byref as const integer) as boolean, byref as const boolean => false) as boolean
        declare const function toJSON           () as string
    protected:
        as _t_ ptr _p ' Payload.
        as _t_     _d ' Dummy value.
end type

' constructors / destructor ====================================================

constructor _a_##array ()
    ' Empty.
end constructor

constructor _a_##array (byref l as const integer)
    if 0% < l then
        this._l => l
        this._p => new _t_[l]
    #ifdef TYPES_VERBOSE
    else
        print "<types." & #_a_ & "array.constructor> Array length (" & l & ") must be equal to or greater than 1."
    #endif
    end if
end constructor

constructor _a_##array (byref l as const integer, f as sub (byref as _t_))
    if 0% < l then
        this._l => l
        this._p => new _t_[l]
        if f then
            for i as integer => 0% to l - 1%
                f(this._p[i])
            next i
        #ifdef TYPES_VERBOSE
        else
            print print "<types." & #_a_ & "array.constructor> Constructing function is undefined."
        #endif
        end if
    #ifdef TYPES_VERBOSE
    else
        print "<types." & #_a_ & "array.constructor> Array length (" & l & ") must be equal to or greater than 1."
    #endif
    end if
end constructor

'constructor _a_##array (byref l as const integer, f as sub (byref as _t_, byref as const integer), byref r as const boolean => false)
'    if 0% < l then
'        this._l => l
'        this._p => new _t_[l]
'        if f then
'            if r then : for i as integer => l - 1% to 0% step -1% : f(this._p[i], i) : next i
'            else      : for i as integer => 0%     to l - 1%      : f(this._p[i], i) : next i
'            end if
'        #ifdef TYPES_VERBOSE
'        else
'            print print "<types." & #_a_ & "array.constructor> Constructing function is undefined."
'        #endif
'        end if
'    #ifdef TYPES_VERBOSE
'    else
'        print "<types." & #_a_ & "array.constructor> Array length (" & l & ") must be equal to or greater than 1."
'    #endif
'    end if
'end constructor

'constructor _a_##array (byref a as const _a_##array)
'    if a._l then
'        this._l => a._l
'        this._p => new _t_[a._l]
'        for i as integer => 0% to a._l - 1%
'            this._p[i] => a._p[i]
'        next i
'    end if
'end constructor

destructor _a_##array ()
    if this._p then delete[] this._p
end destructor

' operators ====================================================================

' types.<t>array.&= ------------------------------------------------------------

'operator _a_##array.&= (byref n as const _t_)
'    if this._l then
'        this._l += 1%
'        dim as _t_ ptr q => new _t_[this._l]
'        for i as integer => 0% to this._l - 2%
'            q[i] => this._p[i]
'        next i
'        q[this._l - 1%] => n
'        delete[] this._p
'        this._p => q
'    else
'        this._l     => 1%
'        this._p     => new _t_[1%]
'        this._p[0%] => n
'    end if
'end operator

'operator _a_##array.&= (byref a as const _a_##array)
'    if this._l then
'        dim as _t_ ptr q => new _t_[this._l + a._l]
'        dim as integer i
'        for i => 0% to this._l - 1%
'            q[i] => this._p[i]
'        next i
'        for i => 0% to a._l - 1%
'            q[this._l + i] => a._p[i]
'        next i
'        this._l += a._l
'        delete[] this._p
'        this._p => q
'    else
'        this._l => a._l
'        this._p => new _t_[a._l]
'        for i as integer => 0% to a._l - 1%
'            this._p[i] => a._p[i]
'        next i
'    end if
'end operator

' types.<t>array.[] ------------------------------------------------------------

'operator _a_##array.[] (byref i as const integer) byref as _t_
'    if (0% <= i) and (i < this._l) then return this._p[i]
'    this._d => _z_
'    return this._d
'end operator

' types.<t>array.cast ----------------------------------------------------------

'operator _a_##array.cast () as string
'    return "<types." & #_a_ & "array>{ length : " & this._l & " }"
'end operator

' types.<t>array.let -----------------------------------------------------------

'operator _a_##array.let (byref a as const _a_##array)
'    if @this <> @a then
'        this._l => 0%
'        if this._p then
'            delete[] this._p
'            this._p => 0
'        end if
'        if a._l then
'            this._l => a._l
'            this._p => new _t_[a._l]
'            for i as integer => 0% to a._l - 1%
'                this._p[i] => a._p[i]
'            next i
'        end if
'    end if
'end operator

' properties ===================================================================

' types.<t>array.avg -----------------------------------------------------------

'property _a_##array.avg () as double
'    if this._l then
'        dim as double r
'        for i as integer => 0% to this._l - 1%
'            #if _a_ = f64
'            r += this._p[i]
'            #else
'            r += cdbl(this._p[i])
'            #endif
'        next i
'        return r / cdbl(this._l)
'    end if
'    return 0d
'end property

' types.<t>array.length --------------------------------------------------------

'property _a_##array.length (byref l as const integer)
'    if 0% = l then
'        this._l => 0%
'        if this._p then
'            delete[] this._p
'            this._p => 0
'        end if
'    elseif 1% <= l then
'        if l <> this._l then
'            dim as _t_ ptr q => new _t_[l]
'            for i as integer => 0% to iif(l < this._l, l, this._l) - 1%
'                q[i] => this._p[i]
'            next i
'            this._l => l
'            delete[] this._p
'            this._p => q
'        end if
'    #ifdef TYPES_VERBOSE
'    else
'        print "<types." & #_a_ & "array.length> Array length (" & l & ") must be equal to or greater than 0."
'    #endif
'    end if
'end property

' types.<t>array.max -----------------------------------------------------------

'property _a_##array.max () as _t_
'    select case this._l
'    case 0% : return _z_
'    case 1% : return this._p[0%]
'    case else
'        dim as _t_ n => this._p[0%]
'        for i as integer => 1% to this;_l - 1%
'            if n < this._p[i] then n => this._p[i]
'        next i
'        return n
'    end select
'end property

' types.<t>array.min -----------------------------------------------------------

'property _a_##array.min () as _t_
'    select case this._l
'    case 0% : return _z_
'    case 1% : return this._p[0%]
'    case else
'        dim as _t_ n => this._p[0%]
'        for i as integer => 1% to this;_l - 1%
'            if this._p[i] < n then n => this._p[i]
'        next i
'        return n
'    end select
'end property

' methods ======================================================================

'function a_a##array.forEach overload (f as sub (byref as _t_), byref r as const boolean => false) as boolean
'    if this._l then
'        if f then
'            if r then : for i as integer => this._l - 1% to 0% step -1%  : f(this._p[i]) : next i
'            else      : for i as integer => 0%           to this._l - 1% : f(this._p[i]) : next i
'            end if
'            return true
'        #ifdef TYPES_VERBOSE
'        else
'            print "<types." & #_a_ & "array.forEach> Unable to iterate. Iterating function is undefined."
'        #endif
'        end if
'    #ifdef TYPES_VERBOSE
'    else
'        print "<types." & #_a_ & "array.forEach> Unable to iterate. Array is empty."
'    #endif
'    end if
'    return false
'end function

'function a_a##array.forEach (f as function (byref as _t_) as boolean, byref r as const boolean => false) as boolean
'    if this._l then
'        if f then
'            if r then : for i as integer => this._l - 1% to 0% step -1%  : if false = f(this._p[i]) then : exit for : end if : next i
'            else      : for i as integer => 0%           to this._l - 1% : if false = f(this._p[i]) then : exit for : end if : next i
'            end if
'            return true
'        #ifdef TYPES_VERBOSE
'        else
'            print "<types." & #_a_ & "array.forEach> Unable to iterate. Iterating function is undefined."
'        #endif
'        end if
'    #ifdef TYPES_VERBOSE
'    else
'        print "<types." & #_a_ & "array.forEach> Unable to iterate. Array is empty."
'    #endif
'    end if
'    return false
'end function

'function _a_##array.forEach (f as sub (byref as _t_, byref as const integer), byref r as const boolean => false) as boolean
'    if this._l then
'        if f then
'            if r then : for i as integer => this._l - 1% to 0% step -1%  : f(this._p[i], i) : next i
'            else      : for i as integer => 0%           to this._l - 1% : f(this._p[i], i) : next i
'            end if
'            return true
'        #ifdef TYPES_VERBOSE
'        else
'            print "<types." & #_a_ & "array.forEach> Unable to iterate. Iterating function is undefined."
'        #endif
'        end if
'    #ifdef TYPES_VERBOSE
'    else
'        print "<types." & #_a_ & "array.forEach> Unable to iterate. Array is empty."
'    #endif
'    end if
'    return false
'end function

'function a_a##array.forEach (f as function (byref as _t_, byref as const integer) as boolean, byref r as const boolean => false) as boolean
'    if this._l then
'        if f then
'            if r then : for i as integer => this._l - 1% to 0% step -1%  : if false = f(this._p[i], i) then : exit for : end if : next i
'            else      : for i as integer => 0%           to this._l - 1% : if false = f(this._p[i], i) then : exit for : end if : next i
'            end if
'            return true
'        #ifdef TYPES_VERBOSE
'        else
'            print "<types." & #_a_ & "array.forEach> Unable to iterate. Iterating function is undefined."
'        #endif
'        end if
'    #ifdef TYPES_VERBOSE
'    else
'        print "<types." & #_a_ & "array.forEach> Unable to iterate. Array is empty."
'    #endif
'    end if
'    return false
'end function

' types.<t>array.toJSON --------------------------------------------------------

'function _a_##array.toJSON () as string
'    select case this._l
'    case 0% : return "[]"
'    case 1% : return "[" & this._p[0%] & "]"
'    case else
'        dim as string r => "[" & this._p[0%]
'        for i as integer => 1% to this._l - 1%
'            r &= "," & this._p[i]
'        next i
'        return r & "]"
'    end select
'end function

#endmacro