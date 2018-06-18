(* basis/text_stream_io.sml
 * Copyright (C) 1998 The Harlequin Group Limited.  All rights reserved.
 *)

require "stream_io.sml";
require "__char";
require "__char_vector";
require "__text_prim_io";
require "__substring";
require "__string_cvt";

signature TEXT_STREAM_IO =
  sig

    include STREAM_IO

    val inputLine : instream -> (string * instream)

    val outputSubstr : (outstream * Substring.substring) -> unit

  end
  where type vector = CharVector.vector
  where type elem = Char.char
  where type reader = TextPrimIO.reader
  where type writer = TextPrimIO.writer
  where type pos = TextPrimIO.pos
