(* basis/text_io.sml
 * Copyright (C) 1998 The Harlequin Group Limited.  All rights reserved.
 *)

require "imperative_io.sml";
require "text_stream_io.sml";
require "__char";
require "__char_vector";
require "__text_prim_io";
require "__substring";
require "__string_cvt";

signature TEXT_IO =
  sig

    type  vector
    type  elem

    type  instream

    type  outstream

    val input : instream -> vector

    val input1 : instream -> elem option

    val inputN : (instream * int) -> vector

    val inputAll : instream -> vector

    val canInput : (instream * int) -> bool

    val lookahead : instream -> elem option

    val closeIn : instream -> unit

    val endOfStream : instream -> bool

    val output : (outstream * vector) -> unit

    val output1 : (outstream * elem) -> unit

    val flushOut : outstream -> unit

    val closeOut : outstream -> unit

    structure StreamIO : TEXT_STREAM_IO

    val getPosIn: instream -> StreamIO.in_pos

    val setPosIn: (instream * StreamIO.in_pos) -> unit


    val mkInstream : StreamIO.instream -> instream

    val getInstream : instream -> StreamIO.instream

    val setInstream : (instream * StreamIO.instream) -> unit

    val getPosOut : outstream -> StreamIO.out_pos

    val setPosOut : (outstream * StreamIO.out_pos) -> unit

    val mkOutstream : StreamIO.outstream -> outstream

    val getOutstream : outstream -> StreamIO.outstream

    val setOutstream : (outstream * StreamIO.outstream) -> unit


    val inputLine : instream -> string

    val outputSubstr : (outstream * Substring.substring) -> unit

    val print : string -> unit

    val openIn : string -> instream
    val openOut : string -> outstream
    val openAppend : string -> outstream

    val openString: string -> instream

    val stdIn : instream
    val stdOut : outstream
    val stdErr : outstream

    val scanStream: ((Char.char, StreamIO.instream) StringCvt.reader
                  -> ('a,StreamIO.instream) StringCvt.reader)
                  -> instream -> 'a option

  end
  where type vector = CharVector.vector
  where type elem = char
