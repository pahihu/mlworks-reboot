(*  ==== BASIS EXAMPLES : DATE_DEMO signature ====
 *
 *  Copyright (C) 1996 Harlequin Ltd.
 *
 *  Description
 *  -----------
 *  This module defines functions to demonstrate the use of the Date structure
 *  in the basis library.
 *
 *)


signature DATE_DEMO =
  sig

    (* Print the date at which a file was last modified. *)

    val fileDate : string -> unit


    (* Print the current date. *)

    val dateNow : unit -> unit

  end
