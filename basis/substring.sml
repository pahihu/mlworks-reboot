(* basis/substring.sml
 * Copyright (C) 1998 The Harlequin Group Limited.  All rights reserved.
 *)
require "string";

signature SUBSTRING =
  sig
    type  substring
    structure String : STRING

    val base : substring -> (string * int * int)
    val string : substring -> string
    val substring : (string * int * int) -> substring
    val all : string -> substring
    val isEmpty : substring -> bool
    val getc : substring -> (char * substring) option
    val first : substring -> char option
    val triml : int -> substring -> substring
    val trimr : int -> substring -> substring
    val slice : (substring * int * int option) -> substring
    val sub : (substring * int) -> char
    val size : substring -> int
    val extract : string * int * int option -> substring
    val concat : substring list -> string
    val explode : substring -> char list
    val isPrefix : string -> substring -> bool
    val compare : (substring * substring) -> order
    val collate : ((char * char) -> order) -> (substring * substring) -> order
    val splitl : (char -> bool) -> substring -> (substring * substring)
    val splitr : (char -> bool) -> substring -> (substring * substring)
    val splitAt : (substring * int) -> (substring * substring)
    val dropl : (char -> bool) -> substring -> substring
    val dropr : (char -> bool) -> substring -> substring
    val takel : (char -> bool) -> substring -> substring
    val taker : (char -> bool) -> substring -> substring
    val position : string -> substring -> (substring * substring) 
    val translate : (char -> string) -> substring -> string  
    val tokens : (char -> bool) -> substring -> substring list 
    val fields : (char -> bool) -> substring -> substring list
    val foldl : ((char * 'a) -> 'a) -> 'a -> substring -> 'a
    val foldr : ((char * 'a) -> 'a) -> 'a -> substring -> 'a
    val app : (char -> unit) -> substring -> unit
    exception Span
    val span : substring * substring -> substring

  end
