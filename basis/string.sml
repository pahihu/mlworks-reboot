(* basis/string.sml
 * Copyright (C) 1998 The Harlequin Group Limited.  All rights reserved.
 *)

require "char";

signature STRING =
  sig
    structure Char : CHAR
    eqtype char
      sharing type char = Char.char
    eqtype string
    val maxSize : int
    val size : string -> int
    val sub : (string * int) -> char
    val extract : (string * int * int option) -> string 
    val concat    : string list -> string
    val ^         : string * string -> string
    val implode   : char list -> string
    val explode : string -> char list
    val translate : (char -> string) -> string -> string 
    val compare : (string * string) -> order
    val str : char -> string
    val isPrefix : string -> string -> bool
    val substring : (string * int * int) -> string
    val fields : (char -> bool) -> string -> string list
    val tokens : (char -> bool) -> string -> string list
    val collate : (char * char -> order) -> (string * string) -> order

    val map  : ( char -> char) -> string -> string
    val mapi : (int * char -> char) -> string * int * int option -> string

    val fromString : string -> string option
    val toString : string -> string

    val fromCString : string -> string option
    val toCString : string -> string

    val <= : string * string -> bool
    val <  : string * string -> bool
    val >= : string * string -> bool
    val >  : string * string -> bool
  end
