# types.bi
A configurable utility library for FreeBASIC.

It implements the `types` namespace, which (for now) contains normalised aliases for all of FreeBASIC numeric types: `byte`'s and `ubyte`'s become `types.int8`'s and `types.uint8`'s, `short`'s and `ushort`'s `types.int16`'s and `types.int16`'s, etc. I started writing it for myself, as a little tool to make my macros easier to write. It also implements 2, 3, and 4-dimensional tuples, which are basically vectors or, more specifically, `union`'s on top of which one can build their own UDT's (which is why I created them in the first place). It also implements arrays for each type (`types.int8` &rarr; `types.i8array`, `types.uint8` &rarr; `types.ui8array`, etc.)  whose properties and methods are modeled after ECMAScript's.

(I'll soon post a real manual.)
