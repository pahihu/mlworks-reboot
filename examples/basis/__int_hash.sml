(*  ==== BASIS EXAMPLES : IntHash structure ====
 *
 *  Copyright (C) 1996 Harlequin Ltd.
 *
 *  Description
 *  -----------
 *  This structure defines a hash table that takes integer keys.  The 
 *  HashTable functor demonstrates the use of the Array structure in the
 *  basis library.
 *
 *)


require "_hash_table";
require "__int_key";

structure IntHash = HashTable (IntKey)
