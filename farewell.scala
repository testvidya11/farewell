#!/bin/sh
exec scala "$0" "$@"
!#

val KEY = "i hope in the next ten years there would be no other farewell letter brilliant than this one";

val encrypted = scala.io.Source.fromFile(args(0)).mkString.replaceAll("\\s", "").split(",")
val sb = new StringBuilder

for (i <- 0 to encrypted.length - 1) {
  sb.append((encrypted(i).toInt ^ KEY(i % KEY.length)).asInstanceOf[Char])
}

print(sb)
