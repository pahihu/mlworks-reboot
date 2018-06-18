(* === random utility - used by guess demo ===
 * 
 * Copyright (C) 1998.  The Harlequin Group plc.
 * 
 *)

require "__real";

local

  val a = 16807.0 and m = 2147483647.0

in

  fun nextrand seed = 
    let val t = a * seed
    in
      floor (Real.rem (t - m * real (floor (t/m)), 1000.0))
    end

end;

