(*  ==== BASIS EXAMPLES : Normal structure ====
 *
 *  Copyright (C) 1996 Harlequin Ltd.
 *
 *  Description
 *  -----------
 *  This module calculates probabilities in a normal distribution.  It
 *  illustrates the use of the Math structure in the basis library.
 *
 *)


require "normal";
require "__quadrature";
require "$.basis.__math";
require "$.basis.__real";

structure Normal : NORMAL =
  struct

    (* This is the probability density function for the normal distribution. *)

    val realEq = Real.==
    infix realEq
    fun normal variance mean =
      let
	val sigma = Math.sqrt variance
      in
	fn x => Math.exp (~ (Math.pow ((x - mean) / sigma, 2.0) / 2.0))
	        / (sigma * Math.sqrt (2.0 * Math.pi))
      end


    (* This will provide reasonable accuracy for the calculations. *)
    val accuracy = SOME 0.0001

    
    (* Calculate the probability of lying between 'left' and 'right' in a
     normal distribution with parameters 'mean' and 'variance'.  Infinities
     are coped with by utilising the symmetry of the normal distribution
     curve. *)

    fun prob (mean, variance, left, right) =
      let
	val f = normal variance mean
      in

	if left >= right then
	  0.0
	else

	  if left realEq Real.negInf andalso right realEq Real.posInf then
	    1.0
	  else

	    if left realEq Real.negInf then
	      0.5 + Quadrature.integrate (f, mean, right, accuracy)
	    else

	      if right realEq Real.posInf then
		0.5 + Quadrature.integrate (f, left, mean, accuracy)
	      else

		Quadrature.integrate (f, left, right, accuracy)
      end

  end
