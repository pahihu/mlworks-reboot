(*  ==== BASIS EXAMPLES : Match structure ====
 *
 *  Copyright (C) 1996 Harlequin Ltd.
 *
 *  Description
 *  -----------
 *  This module performs basic pattern matching of strings.  It demonstrates
 *  the use of the Substring structure in the basis library.
 *
 *)


require "match";
require "$.basis.__substring";

structure Match : MATCH =
  struct


    (* Determine whether a given character is a wildcard #"*". *)

    fun wildcard #"*" = true
      | wildcard _ = false


    (* Determine whether string 's' is a suffix of substring 'ss'. *)

    fun isSuffix s ss =
      let
	val suffix = Substring.all s
	val diff = Substring.size ss - size s
      in
        if (diff > 0) then
         Substring.compare (suffix, (Substring.slice (ss, diff, NONE))) = EQUAL
        else
         false
      end


    (* Determine whether a list of strings can match with the given substring.
     eg. ["abc", "ef", "j"] matches with "abcdefghij".  This is done by
     working left to right through the substring, searching for each string in
     the list in turn, and chopping off the appropriate part of the substring
     each time a match is found. *)

    fun matchList (_, []) = true

      (* An empty string should match automatically. *)
      | matchList (ss, (""::t)) = matchList (ss, t)

      (* The last string in the list must be a suffix of 'ss'. *)
      | matchList (ss, [s]) = isSuffix s ss

      (* Check whether each string in the list is a prefix of 'ss'.  If not,
       chop the first character off 'ss' and try again. *)
      | matchList (ss, (h::t)) =
	if Substring.isEmpty ss then false
	else
	  if Substring.isPrefix h ss then
	    matchList (Substring.triml (size h) ss, t)
	  else
	    matchList (Substring.triml 1 ss, (h::t))


    (* The first string in the list is special - it must be a prefix of 'ss'.
     The remainder may lie anywhere within 'ss' and are checked with 
     matchList. *)

    fun startMatch (ss, []) = true
      | startMatch (ss, [s]) = Substring.string ss = s
      | startMatch (ss, (h::t)) =
	Substring.isPrefix h ss
	andalso matchList (Substring.triml (size h) ss, t)


    (* Determine whether or not 'inputString' matches the pattern given by
     'matchString'.  Patterns may be any string, with the exception that the
     #"*" character represents a wildcard that will match with any number of
     characters. 

     The method used here is to divide up 'inputString' into various strings
     lying between the wildcards (by using Substring.fields), and then to
     match each one in turn. *)

    fun match (inputString, matchString) =
      startMatch (Substring.all inputString,
		  Substring.String.fields wildcard matchString)

  end


