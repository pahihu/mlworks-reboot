(* basis/flags.sml
 * Copyright (C) 1998 The Harlequin Group Limited.  All rights reserved.
 *)

(* Move the POSIX_FLAGS signature to FLAGS, because we need it here too. *)

require "__sys_word";

signature FLAGS =
  sig

    eqtype  flags

    val toWord : flags -> SysWord.word
    val fromWord : SysWord.word -> flags

    val flags : flags list -> flags

    val allSet : (flags * flags) -> bool
    (* True if all flags in parameter 2 occur in parameter 1 *)

    val anySet : (flags * flags) -> bool
    (* True if any flags in parameter 2 occur in parameter 1 *)
  end
