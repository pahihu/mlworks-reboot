(* basis/char.sml
 * Copyright (C) 1998 The Harlequin Group Limited.  All rights reserved.
 *)
require "__string_cvt";
signature CHAR =
  sig

    eqtype char
    eqtype string

    val maxOrd : int
    val minChar : char
    val maxChar : char

    val chr : int -> char (* raise Chr *)
    val ord : char -> int

    val succ : char -> char (* raise Chr *)
    val pred : char -> char (* raise Chr *)

    val <  : (char * char) -> bool
    val <= : (char * char) -> bool
    val >  : (char * char) -> bool
    val >= : (char * char) -> bool

    val compare : (char * char) -> order
    val contains : string -> char -> bool
    val notContains : string -> char -> bool
    val isLower : char -> bool
    val isUpper : char -> bool
    val isDigit : char -> bool
    val isAlpha : char -> bool
    val isAlphaNum : char -> bool
    val isAscii : char -> bool
    val isSpace : char -> bool
    val toLower : char -> char
    val toUpper : char -> char
    val isCntrl : char -> bool
    val isGraph : char -> bool
    val isHexDigit : char -> bool
    val isPrint: char -> bool

    val isPunct : char -> bool
    val fromString : string -> char option
    val toString : char -> string
    val scan : (char, 'a) StringCvt.reader -> 'a -> (char * 'a) option

    val fromCString : string -> char option
    val toCString : char -> string


  end; (* CHAR *)
