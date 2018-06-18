(*  ==== BASIS EXAMPLES : KEY signature ====
 *
 *  Copyright (C) 1996 Harlequin Ltd.
 *
 *  Description
 *  -----------
 *  This signature defines hashing functions for a type 'key'.
 *
 *)


signature KEY =
  sig

    eqtype key


    (* A hash function. *)

    val hash : key * int -> int


    (* A rehashing function to be used when collisions occur. *)

    val rehash : key * int * int -> int

  end
