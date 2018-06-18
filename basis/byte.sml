(* basis/byte.sml
 * Copyright (C) 1998 The Harlequin Group Limited.  All rights reserved.
 *)

require "__word8";
require "__word8_array";
require "__word8_vector";
require "__substring";
signature BYTE =
  sig
    val byteToChar : Word8.word -> char
    val charToByte : char -> Word8.word
    val bytesToString : Word8Vector.vector -> string
    val stringToBytes : string -> Word8Vector.vector
    val unpackStringVec : (Word8Vector.vector * int * int option) -> string (* raises Subscript *)
    val unpackString : (Word8Array.array * int * int option) -> string (* raises Subscript *)
    val packString : (Word8Array.array * int * Substring.substring) -> unit 
  end
