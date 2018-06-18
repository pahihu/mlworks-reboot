(*  ==== BASIS EXAMPLES : NORMAL signature ====
 *
 *  Copyright (C) 1996 Harlequin Ltd.
 *
 *  Description
 *  -----------
 *  This module calculates probabilities in a normal distribution.  It
 *  illustrates the use of the Math structure in the basis library.
 *
 *)


signature NORMAL =
  sig

    (* prob (mean, variance, left, right)
     Calculate the probability of lying between 'left' and 'right' in a
     normal distribution with parameters 'mean' and 'variance'.  Infinities
     are allowed for 'left' and 'right'. *)

    val prob : real * real * real * real -> real

  end
