(*  ==== BASIS EXAMPLES : MATCH signature ====
 *
 *  Copyright (C) 1996 Harlequin Ltd.
 *
 *  Description
 *  -----------
 *  This module performs basic pattern matching of strings.  It demonstrates
 *  the use of the Substring structure in the basis library.
 *
 *)


signature MATCH =
  sig

    (* Determine whether or not 'inputString' matches the pattern given by
     'matchString'.  Patterns may be any string, with the exception that the
     #"*" character represents a wildcard that will match with any number of
     characters. *)

    val match : string * string -> bool

  end
