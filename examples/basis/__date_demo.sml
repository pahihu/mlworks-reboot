(*  ==== BASIS EXAMPLES : DateDemo structure ====
 *
 *  Copyright (C) 1996 Harlequin Ltd.
 *
 *  Description
 *  -----------
 *  This module defines functions to demonstrate the use of the Date structure
 *  in the basis library.
 *
 *)


require "date_demo";
require "$.basis.__date";
require "$.system.__os";
require "$.system.__time";

structure DateDemo : DATE_DEMO =
  struct

    (* Print the date 'dt' *)

    fun printDate dt =
      (print (Date.toString dt);
       print "\n")
   

    (* Print the date at which 'file' was last modified. *)

    fun fileDate file = 
      printDate (Date.fromTimeLocal (OS.FileSys.modTime file))
      handle OS.SysErr (message, error) => 
	print ("System error:\n" ^ message ^ "\n")

      
    (* Print the current date. *)

    fun dateNow () = 
      printDate (Date.fromTimeLocal (Time.now ()))

  end
