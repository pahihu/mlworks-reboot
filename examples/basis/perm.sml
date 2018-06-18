(*  ==== BASIS EXAMPLES : Perm structure ====
 *
 *  Copyright (C) 1996 Harlequin Ltd.
 *
 *  Description
 *  -----------
 *  This module demonstrates the use of the List structure in the basis
 *  library.  It provides functions to find all possible permutations and
 *  partitions of a given list or string.
 *
 *)

signature PERM =
  sig

    (* Find all permutations of a given list. *)

    val perm : 'a list -> 'a list list


    (* Find all permutations of a string. *)

    val permString : string -> string list


    (* Find all partitions of a given list. *)

    val partition : 'a list -> 'a list list list


    (* Find all partitions of a string. *)

    val partitionString : string -> string list list

  end
