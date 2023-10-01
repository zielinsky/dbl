(* This file is part of DBL, released under MIT license.
 * See LICENSE for details.
 *)

(** Main module of a translation from Unif to Core *)

(* Author: Piotr Polesiuk, 2023 *)

(** Translate program *)
val tr_program : Lang.Unif.program -> Lang.Core.program
