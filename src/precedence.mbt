///|
pub fn BinaryOperator::get_precedence(self : Self) -> Precedence {
  match self {
    Plus | Minus => PlusMinus
    Mul | Div | IntegerDiv | Mod => MulDivMod
    Eq | Neq | Lt | Gt | LtEq | GtEq | Spaceship => Eq
    And => And
    Or => Or
    // PostgreSQL JSON operators - higher precedence than comparison
    JsonExtract
    | JsonExtractText
    | JsonExtractPath
    | JsonExtractPathText
    | JsonContains
    | JsonContainedIn => JsonOperator
  }
}

///|
pub(all) enum Precedence {
  PlusMinus
  MulDivMod
  Eq
  Like
  And
  Or
  Between
  UnaryNot
  JsonOperator
}

///|
pub fn Precedence::value(self : Precedence) -> Int32 {
  match self {
    And => 10
    Like => 19
    Eq => 20
    MulDivMod => 40
    PlusMinus => 30
    Or => 5
    Between => 20
    UnaryNot => 15
    JsonOperator => 35 // Between PlusMinus and MulDivMod
  }
}
