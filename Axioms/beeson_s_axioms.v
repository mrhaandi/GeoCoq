(** We describe here an intuitionistic version of Tarski's axiom system proposed
by Michael Beeson. *)

Class intuitionistic_Tarski_neutral_dimensionless := {
 ITpoint : Type;
 IBet : ITpoint -> ITpoint -> ITpoint -> Prop;
 ICong : ITpoint -> ITpoint -> ITpoint -> ITpoint -> Prop;
 Cong_stability : forall A B C D, ~ ~ ICong A B C D -> ICong A B C D;
 Bet_stability : forall A B C, ~ ~ IBet A B C -> IBet A B C;
 IT (A B C : ITpoint) := ~ (A<>B /\ B<>C /\ ~ IBet A B C);
 ICol (A B C : ITpoint) :=  ~ (~ IT C A B /\ ~ IT A C B /\ ~ IT A B C);
 Ibetween_identity : forall A B, ~ IBet A B A;
 Icong_identity : forall A B C, ICong A B C C -> A = B;
 Icong_pseudo_reflexivity : forall A B : ITpoint, ICong A B B A;
 Icong_inner_transitivity : forall A B C D E F,
   ICong A B C D -> ICong A B E F -> ICong C D E F;
 Iinner_pasch : forall A B C P Q,
   IBet A P C -> IBet B Q C -> ~ ICol A B C -> 
   exists x, IBet P x B /\ IBet Q x A;
 Ibetween_symmetry : forall A B C, IBet A B C -> IBet C B A;
 Ibetween_inner_transitivity : forall A B C D, IBet A B D -> IBet B C D -> IBet A B C;
 Ifive_segment  : forall A A' B B' C C' D D',
    ICong A B A' B' ->
    ICong B C B' C' ->
    ICong A D A' D' ->
    ICong B D B' D' ->
    IT A B C -> IT A' B' C' -> A <> B -> ICong C D C' D';
 Isegment_construction : forall A B C D,
    A<>B -> exists E, IT A B E /\ ICong B E C D;
 Ilower_dim : exists A, exists B, exists C, ~ IT C A B /\ ~ IT A C B /\ ~ IT A B C
}.