(* utils/mutex.sml
 * Copyright (C) 1998 The Harlequin Group Limited.  All rights reserved.
 *)



signature MUTEX =
sig
  exception Mutex of string
  type mutex
  val newCountingMutex: int -> mutex
  val newBinaryMutex: bool -> mutex
  val test: mutex list -> bool
  val testAndClaim : mutex list -> bool
  val wait: mutex list -> unit
  val signal: mutex list -> unit
  val query: mutex -> MLWorks.Threads.Internal.thread_id list
  val allSleeping: MLWorks.Threads.Internal.thread_id list -> bool
  val cleanUp : unit -> unit
  val critical: mutex list * ('a -> 'b)  -> 'a -> 'b
  val await: mutex list * (unit -> bool) -> unit
end 


         (* newCountingMutex counter
            returns a new counting mutex with initial value counter.

            newBinaryMutex isClaimed
            returns a new binary mutex with initial value isClaimed.

            test l
            returns true if all mutexes are free in l at the time of
            the procedure call, false otherwise.  No blocking.

            testAndClaim l
            like test, but actually claims the mutexes in l if they're
            all available, returning true.  Returns false otherwise.
            No blocking.
           
            wait l
            wait 'til all mutexes are free in l simultaneously

            signal l
            simultaneously signal that all the mutexes in l are free

            query m
            returns list of threads that are waiting on mutex m

            allSleeping l
            Returns true if every thread in l is sleeping simultaneously.
            Used for deadlock detection.

            cleanUp ()
            Kills off all threads except MLWorks' own.


            critical(l,f) a
            wait for mutexes l, apply f to a and return the result
            after signalling l

            await(l,c)
            waits until both every mutex in l is free, and
            condition c() evaluates to true, in which case
            it does *not* release the mutexes.
          *)

