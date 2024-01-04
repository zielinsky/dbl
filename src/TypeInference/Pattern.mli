(* This file is part of DBL, released under MIT license.
 * See LICENSE for details.
 *)

(** Type-inference for patterns *)

(* Author: Piotr Polesiuk, 2023,2024 *)

open Common

(** Check if given pattern fits in given scope and has given type.
  Returns extended environment, translated pattern, and the effect of
  pattern-matching (matching against ADT constructors is impure). The scope
  is passed separately from environment, since the scope of the pattern flows
  top-down in a complex patterns, while the environment flows left-to-right.
  *)
val check_type :
  env:Env.t -> scope:T.scope -> S.pattern -> T.typ ->
    Env.t * T.pattern * ret_effect

(** Infer type of given formal argument. Returns extended environment,
  a pattern that represents an argument, its type, and the effect of
  pattern-matching *)
val infer_arg_type : Env.t -> S.arg -> Env.t * T.pattern * T.typ * ret_effect

(** Check if given argument has given type. Returns extended environment,
  translated argument as pattern, and the effect of pattern-matching *)
val check_arg_type : Env.t -> S.arg -> T.typ -> Env.t * T.pattern * ret_effect

(** Infer types of given named formal parameters. Returns extended environment,
  the effect of pattern-matching, and the list of translated parameters as
  triples: name, pattern, and its type *)
val infer_inst_arg_types :
  Env.t -> S.inst_arg list ->
    Env.t * (S.name * T.pattern * T.typ) list * ret_effect

(** Accumulate all results of given function called on all names of implicit
  parameters bound by given pattern *)
val fold_implicit : ('a -> S.name -> 'a) -> 'a -> S.pattern -> 'a