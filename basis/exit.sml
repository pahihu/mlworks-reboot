(* basis/exit.sml
 * Copyright (C) 1998 The Harlequin Group Limited.  All rights reserved.
 *)

signature EXIT =
  sig
    eqtype status

    val success : status

    val failure : status

    val uncaughtIOException : status

    val badUsage : status

    val stop : status

    val save : status

    val badInput : status

    val atExit : (unit -> unit) -> unit

    val exit : status -> 'a

    val terminate : status -> 'a

  end
