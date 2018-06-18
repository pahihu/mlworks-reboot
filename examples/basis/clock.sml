(*  ==== BASIS EXAMPLES : CLOCK signature ====
 *
 *  Copyright (C) 1996 Harlequin Ltd.
 *
 *  Description
 *  -----------
 *  This module provides functions to clock the progress of the current
 *  process.  It demonstrates both the Timer and the Time structures in the
 *  basis library.
 *
 *)


signature CLOCK =
  sig

    (* Restart the timers. *)

    val reset : unit -> unit


    (* Print the overall time elapsed and the user time elapsed.
     Calculate and print the percentage of time spent on the current
     process. *)

    val clock : unit -> unit

  end
