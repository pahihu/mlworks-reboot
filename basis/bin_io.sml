(* basis/bin_io.sml
 * Copyright (C) 1998 The Harlequin Group Limited.  All rights reserved.
 *)

require "imperative_io";
require "stream_io";
require "__word8";
require "__word8_vector";
require "__bin_prim_io";

signature BIN_IO =
  sig

    include IMPERATIVE_IO
      sharing type vector =StreamIO.vector
      sharing type elem =  StreamIO.elem

    val openIn : string -> instream
    val openOut : string -> outstream

    val openAppend : string -> outstream

  end
  where type vector = Word8Vector.vector
  where type elem = Word8.word 
  where type StreamIO.reader = BinPrimIO.reader
  where type StreamIO.writer = BinPrimIO.writer
