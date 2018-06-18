(* basis/time.sml
 * Copyright (C) 1998 The Harlequin Group Limited.  All rights reserved.
 *)

require "__string_cvt";

signature TIME =
  sig
    eqtype time

    exception Time

    val zeroTime : time

    val fromReal: real -> time

    val toReal : time -> real

    val toSeconds : time -> int

    val toMilliseconds : time -> int

    val toMicroseconds : time -> int

    val fromSeconds : int -> time

    val fromMilliseconds : int -> time

    val fromMicroseconds : int -> time

    val compare : (time * time) -> order

    val + : time * time -> time
    val - : time * time -> time
    val < : time * time -> bool
    val <= : time * time -> bool
    val > : time * time -> bool
    val >= : time * time -> bool

    val now : unit -> time

    val fmt : int -> time -> string

    val toString : time -> string

    val fromString : string -> time option

    val scan : (char, 'a) StringCvt.reader -> 'a -> (time * 'a) option

  end
