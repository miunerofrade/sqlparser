///|
pub suberror SqlParserError {
  LexerError(LexerError)
  ParserError(ParserError)
} derive(Debug)

///|
pub fn parse_sql(
  dialect~ : &Dialect = MySQL::{ },
  input : String,
) -> Statements raise SqlParserError {
  let tokens = tokenize(dialect~, input) catch { e => raise LexerError(e) }
  let stmts = parse(dialect~, tokens) catch { e => raise ParserError(e) }
  { stmts, }
}

///|
pub extend SqlParserError with Debug::{to_repr}
