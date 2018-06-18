(*  ==== BASIS EXAMPLES : Binary structure ====
 *
 *  Copyright (C) 1996 Harlequin Ltd.
 *
 *  Description
 *  -----------
 *  This module defines a type 'binary' that is a vector of bits.  It provides
 *  functions to convert strings and bytes (ie. Word8.word) to and from the
 *  binary type.  These functions use the Vector, Word8 and Word8Vector 
 *  structures in their implementations.  Functions are also provided to
 *  convert a string to and from the vector of binaries representing the ASCII
 *  code of each character. These functions illustrate the Byte structure.
 *
 *)

require "binary";
require "$.basis.__vector";
require "$.basis.__byte";
require "$.basis.__word8";
require "$.basis.__word8_vector";
require "$.basis.__word";


structure Binary : BINARY =
  struct

    datatype bit = ZERO | ONE
    

    (* Store binary as a vector of bits, with the lsb at the left. *)
    type binary = bit Vector.vector

     
    exception Binary


    (* Convert a bit to a character: either #"0" or #"1". *)

    fun bitToChar ZERO = #"0"
      | bitToChar ONE = #"1"


    (* Convert a character to a bit.  Raise Binary for invalid characters. *)

    fun charToBit #"0" = ZERO
      | charToBit #"1" = ONE
      | charToBit _ = raise Binary


    (* Convert a string of 0s and 1s into a binary.  Return NONE if string
     contains invalid characters.  The list must be reversed since the
     binary is stored in the reverse order to the original string. *)

    fun fromString s = 
      SOME (Vector.fromList (map charToBit (rev (explode s))))
      handle Binary => NONE


    (* Convert 'bin' into a string of 0s and 1s, reversing to give
     correct order. *)

    fun toString bin = 
      let
	fun bits i = 
	  bitToChar (Vector.sub (bin, i)) :: bits (i + 1)
	  handle Subscript => [] 
      in
	implode (rev (bits 0))
      end
      

    (* Extract the nth bit from 'byte' *)

    fun getBit byte n = 
      let
	val mask = Word8.<< (Word8.fromInt 1, Word.fromInt n);
	val b = Word8.andb (byte, mask)
      in
	if b = (Word8.fromInt 0) then ZERO else ONE
      end
    

    (* Convert a byte to a binary by extracting every bit in turn. *)

    fun fromByte byte = Vector.tabulate (8, (getBit byte))


    (* Calculate 2 to the power of p. *)

    fun pow2 p = Word8.<< (Word8.fromInt 1, Word.fromInt p)


    (* Create a table of the first 8 powers of 2. *)

    val powersOfTwo = Word8Vector.tabulate (8, pow2)


    (* For the 'i'th bit of a byte, add the appropriate power of 2 to 'total'.
     eg. if bit 3 is ONE then add on 8. *)

    fun addBits (i, ZERO, total) = total
      | addBits (i, ONE, total) =
	Word8.+ (Word8Vector.sub (powersOfTwo, i), total)


    (* Add up the appropriate values of all bits in 'bin'.  This is done
     by folding addBits over the whole of 'bin'.  Vector.foldli is used so
     as to pass the index to addBits. *)

    fun toByte bin = 
      if Vector.length bin > 8 then
	raise Size
      else
	Vector.foldli addBits (Word8.fromInt 0) (bin, 0, NONE)


    (* Convert string 's' to the vector of binaries representing
     the ASCII code of each character. *)

    fun toAscii s =
      let
	val byteVector = Byte.stringToBytes s
	fun doByte i = fromByte (Word8Vector.sub (byteVector, i))
      in
	Vector.tabulate (size s, doByte)
      end


    (* Convert vector of binaries to the string made up of the characters given
     by their ASCII values. *)

    fun fromAscii ascii = 
      let
	fun doByte i = toByte (Vector.sub (ascii, i))
      in
	Byte.bytesToString (Word8Vector.tabulate (Vector.length ascii, doByte))
      end


    (* Print out each ASCII binary making up the string 's'. *)

    fun printAscii s =
      let
	fun display bin = print (toString bin ^ "\n")
      in
	Vector.app display (toAscii s)
      end

  end
