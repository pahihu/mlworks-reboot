(* basis/date.sml
 * Copyright (C) 1998 The Harlequin Group Limited.  All rights reserved.
 *)

require "../system/__time";
require "__string_cvt";


signature DATE =
  sig
    datatype weekday = Mon | Tue | Wed | Thu | Fri | Sat | Sun

    datatype month = Jan | Feb | Mar | Apr | May | Jun
                   | Jul | Aug | Sep | Oct | Nov | Dec

    type date
      (* Dates always work over at least the period 1900..2200 as
         specified by the Basis library.
         They are also reliable over a much greater period (limited only
         by integer arithmetic) but the exact range is machine
         dependent and differs according to what operations are performed.
         Some operations (involving Time.time) only work over a
         shorter period (again machine dependent, the lower limit
         of times is always time.zeroTime).
         You will never receive an inaccurate date due to rounding
         errors or overflow.  Attempts to create a date outside the
         valid range will always raise exception Date.  So if you assume
         an unlimited range of dates, you can be sure of either getting
         the correct answer, or an exception. *)

    exception Date

    val year : date -> int         (* returns the year, e.g. 1997 *)
    val month : date -> month      (* returns the month *)
    val day : date -> int          (* returns day of the month, >=1 *)
    val hour : date -> int         (* returns hour of the day *)
    val minute : date -> int       (* returns minute of the hour *)
    val second : date -> int       (* returns second of the minute *)
    val weekDay : date ->  weekday (* returns day of the week *)
    val yearDay : date -> int      (* returns day of the year, >=1 *)

    val offset : date -> Time.time option 
        (* return time west of UTC.  NONE is localtime, SOME(Time.zeroTime)
           is UTC.
           Europe will be reported as SOME(23 hours), one hour _ahead_
           of GMT. *)
    val isDst : date -> bool option
        (* returns SOME(true) if daylight savings time is in effect; returns
           SOME(false) if not, and returns NONE if we don't know. *)

    val date :
      { year   : int,
        month  : month,
        day    : int,
        hour   : int,
        minute : int,
        second : int,
        offset : Time.time option } ->
      date
        (* Creates a canonical date from the given values.  If the 
           resulting date is outside the range supported by the 
           implementation, the Date exception is raised. *)

    val localOffset : unit -> Time.time
        (* Returns the offset from UTC for the local timezone. *) 

    val fromTimeLocal : Time.time -> date
        (* Returns the date in the local timezone for the given (UTC) time.
           This is like the ANSI C function localtime.
           offset of the date will be NONE. *)

    val fromTimeUniv : Time.time -> date
        (* Returns the date in the UTC timezone for the given (UTC) time.
           This is like the ANSI C function gmtime.
           offset of the date will be SOME(Time.zeroTime). *)

    val toTime : date -> Time.time
        (* Returns the time value corresponding to the date in the host
           system.  This raises Date exception if the date cannot be 
           represented as a time value. *)

    (* Dates as text must be in 24 character format,
       e.g. "Thu Sep 25 10:08:30 1997".*)
    val toString   : date -> string
    val fmt        : string -> date -> string
    val fromString : string -> date option
    val scan       : (char, 'a) StringCvt.reader -> (date, 'a) StringCvt.reader

    val compare : (date * date) -> order
        (* Returns the relative order of two dates ignoring DST and 
           timezone information. *)

  end
