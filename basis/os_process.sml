(* basis/os_process.sml
 * Copyright (C) 1998 The Harlequin Group Limited.  All rights reserved.
 *)

signature OS_PROCESS =
  sig
    eqtype status

    val success : status

    val failure : status

    val system : string -> status

    val atExit : (unit -> unit) -> unit

    val exit : status -> 'a

    val terminate : status -> 'a

    val getEnv : string -> string option
  end
