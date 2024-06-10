#ifndef _TYPES_BI_
    #define _TYPES_BI_
    #include "types.cfg"
    #include "macros/macros.bi"
    namespace types
        
        const as integer versionMajor => 0%, _
                         versionMinor => 2%
        const as string  versionString => "types v" & versionMajor & "." & versionMinor
        
' types.int8 -------------------------------------------------------------------
        
        type int8 as byte
        #define t_ci8 cbyte
        type i8p as int8 ptr
        #define t_ci8p(_a_) cptr(i8p,_a_)
        #ifdef TYPES_TUPLES
            t_define_tuples(i8,int8)
        #endif
        #ifdef TYPES_ARRAYS
            t_define_array(i8,int8,0)
        #endif
        
' types.uint8 ------------------------------------------------------------------
        
        type uint8 as ubyte
        #define t_cui8 cubyte
        type ui8p as uint8 ptr
        #define t_cui8p(_a_) cptr(ui8p,_a_)
        #ifdef TYPES_TUPLES
            t_define_tuples(ui8,uint8)
        #endif
        #ifdef TYPES_ARRAYS
            t_define_array(ui8,uint8,0)
        #endif
    
' types.int16 ------------------------------------------------------------------
        
        type int16 as short
        #define t_ci16 cshort
        type i16p as int16 ptr
        #define t_ci16p(_a_) cptr(i16p,_a_)
        #ifdef TYPES_TUPLES
            t_define_tuples(i16,int16)
        #endif
        #ifdef TYPES_ARRAYS
            t_define_array(i16,int16,0)
        #endif
    
' types.uint16 -----------------------------------------------------------------
        
        type uint16 as ushort
        #define t_cui16 cushort
        type ui16p as uint16 ptr
        #define t_cui16p(_a_) cptr(ui16p,_a_)
        #ifdef TYPES_TUPLES
            t_define_tuples(ui16,uint16)
        #endif
        #ifdef TYPES_ARRAYS
            t_define_array(ui16,uint16,0)
        #endif
    
' types.int32 ------------------------------------------------------------------
        
        type int32 as long
        #define t_ci32 clng
        type i32p as int32 ptr
        #define t_ci32p(_a_) cptr(i32p,_a_)
        #ifdef TYPES_TUPLES
            t_define_tuples(i32,int32)
        #endif
        #ifdef TYPES_ARRAYS
            t_define_array(i32,int32,0l)
        #endif
    
' types.uint32 -----------------------------------------------------------------
        
        type uint32 as ulong
        #define t_cui32 culng
        type ui32p as uint32 ptr
        #define t_cui32p(_a_) cptr(ui32p,_a_)
        #ifdef TYPES_TUPLES
            t_define_tuples(ui32,uint32)
        #endif
        #ifdef TYPES_ARRAYS
            t_define_array(ui32,uint32,0ul)
        #endif
    
' types.int64 ------------------------------------------------------------------
        
        type int64 as longint
        #define t_ci64 clngint
        type i64p as int64 ptr
        #define t_ci64p(_a_) cptr(i64p,_a_)
        #ifdef TYPES_TUPLES
            t_define_tuples(i64,int64)
        #endif
        #ifdef TYPES_ARRAYS
            t_define_array(i64,int64,0ll)
        #endif
    
' types.uint64 -----------------------------------------------------------------
        
        type uint64 as ulongint
        #define t_cui64 culngint
        type ui64p as uint64 ptr
        #define t_cui64p(_a_) cptr(ui64p,_a_)
        #ifdef TYPES_TUPLES
            t_define_tuples(ui64,uint64)
        #endif
        #ifdef TYPES_ARRAYS
            t_define_array(ui64,uint64,0ull)
        #endif
    
' types.flt32 ------------------------------------------------------------------
        
        type flt32 as single
        #define c_cf32 csng
        type f32p as flt32 ptr
        #define t_cf32p(_a_) cptr(f32p,_a_)
        #ifdef TYPES_TUPLES
            t_define_tuples(f32,flt32)
        #endif
        #ifdef TYPES_ARRAYS
            t_define_array(f32,flt32,0f)
        #endif
    
' types.flt64 ------------------------------------------------------------------
        
        type flt64 as double
        #define t_cf64 cdbl
        type f64p as flt64 ptr
        #define t_cf64p(_a_) cptr(f64p,_a_)
        #ifdef TYPES_TUPLES
            t_define_tuples(f64,flt64)
        #endif
        #ifdef TYPES_ARRAYS
            t_define_array(f64,flt64,0d)
        #endif
    
    end namespace
#endif