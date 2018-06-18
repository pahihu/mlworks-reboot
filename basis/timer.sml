(* basis/timer.sml
 * Copyright (C) 1998 The Harlequin Group Limited.  All rights reserved.
 *)


require "^.system.__time";

signature TIMER =
  sig
    type cpu_timer
    type real_timer

    val startCPUTimer : unit -> cpu_timer
    val totalCPUTimer : unit -> cpu_timer
    val checkCPUTimer : cpu_timer -> {usr:Time.time,sys:Time.time,gc:Time.time}

    val startRealTimer : unit -> real_timer
    val totalRealTimer : unit -> real_timer
    val checkRealTimer : real_timer -> Time.time

  end
