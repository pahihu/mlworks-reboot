(*  ==== BASIS EXAMPLES : IntKey structure ====
 *
 *  Copyright (C) 1996 Harlequin Ltd.
 *
 *  Description
 *  -----------
 *  This module defines hashing functions for integer keys.
 *
 *)


require "key";

structure IntKey : KEY =
  struct

    type key = int


    (* A simple hash function. *)

    fun hash (hashKey : key, tableSize) = hashKey mod tableSize


    (* A simple rehashing function to be used when collisions occur. *)

    fun rehash (hashKey : key, index, tableSize) = 
      (index + 8 - (hashKey mod 8)) mod tableSize

  end

