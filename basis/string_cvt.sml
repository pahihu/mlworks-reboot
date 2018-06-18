(* basis/string_cvt.sml
 * Copyright (C) 1998 The Harlequin Group Limited.  All rights reserved.
 *)

signature STRING_CVT =
  sig
    datatype radix = BIN | OCT | DEC | HEX
    datatype realfmt = 
      EXACT
    | SCI of int option
    | FIX of int option
    | GEN of int option

    type cs
    type ('a,'b) reader

    val scanString : ((char, cs) reader -> ('a, cs) reader) -> string -> 'a option
    val skipWS : (char,'a) reader -> 'a -> 'a
    val padLeft : char -> int -> string -> string
    val padRight : char -> int -> string -> string
    val scanList : ((char list -> (char * char list) option) -> char list -> ('a * 'b) option) -> char list -> 'a option

    val splitl : (char -> bool) -> (char,'a) reader -> 'a -> (string * 'a)
    val takel : (char -> bool) ->  (char,'a) reader -> 'a -> string
    val dropl : (char -> bool) ->  (char,'a) reader -> 'a -> 'a

  end

