(* basis/list.sml
 * Copyright (C) 1998 The Harlequin Group Limited.  All rights reserved.
 *)

signature LIST =
  sig

    datatype list = datatype list

    exception Empty

    val null : 'a list -> bool 

    val length : 'a list -> int 

    val @ : 'a list * 'a list -> 'a list

    val hd : 'a list -> 'a                (* raises Empty *)

    val tl : 'a list -> 'a list           (* raises Empty *)

    val last : 'a list -> 'a                (* raises Empty *)

    val nth : 'a list * int -> 'a           (* raises Subscript *)

    val take : ('a list * int ) -> 'a list

    val drop : ('a list * int ) -> 'a list

    val rev : 'a list -> 'a list 

    val concat : 'a list list -> 'a list

    val revAppend : 'a list * 'a list -> 'a list

    val app : ('a -> unit) -> 'a list -> unit

    val map : ('a -> 'b) -> 'a list -> 'b list

    val mapPartial : ('a -> 'b option) -> 'a list -> 'b list

    val find : ('a -> bool) -> 'a list -> 'a option

    val filter    : ('a -> bool) -> 'a list -> 'a list

    val partition : ('a -> bool ) -> 'a list -> ('a list * 'a list)

    val foldl : ('a * 'b -> 'b) -> 'b -> 'a list -> 'b

    val foldr : ('a * 'b -> 'b) -> 'b -> 'a list -> 'b

    val exists : ('a -> bool) -> 'a list -> bool

    val all    : ('a -> bool) -> 'a list -> bool

    val tabulate : (int * (int -> 'a)) -> 'a list   (* raises Size *)

  end (* signature LIST *)