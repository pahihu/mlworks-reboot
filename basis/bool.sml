(* basis/bool.sml
 * Copyright (C) 1998 The Harlequin Group Limited.  All rights reserved.
 *)
require "__string_cvt";
signature BOOL =
  sig
    datatype bool = datatype bool
    val not : bool -> bool
    val fromString : string -> bool option
    val scan : (char, 'a) StringCvt.reader -> 'a -> (bool * 'a) option
    val toString : bool -> string
  end
