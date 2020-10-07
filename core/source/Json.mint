/* A module for parsing and stringifying JSON format. */
module Json {
  /*
  Parses a string into an `Object`, returns `Maybe.nothing()`
  if the parsing failed.

    Json.parse("{}") == Maybe.just(`{}`)
    Json.parse("{") == Maybe.nothing()
  */
  fun parse (input : String) : Maybe(Object) {
    `
    (() => {
      try {
        return #{Maybe::Just(`JSON.parse(#{input})`)}
      } catch (error) {
        return #{Maybe::Nothing}
      }
    })()
    `
  }

  /*
  Stringifies an `Object` into JSON string.

    Json.stringify(`{ a: "Hello" }`) == "{ \"a\": \"Hello\" }"
  */
  fun stringify (input : Object) : String {
    `JSON.stringify(#{input})`
  }
}
