(* basis/command_line.sml
 * Copyright (C) 1998 The Harlequin Group Limited.  All rights reserved.
 *)

signature COMMAND_LINE =
  sig
    val name: unit -> string
    val arguments: unit -> string list
  end
