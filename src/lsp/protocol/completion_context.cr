module LSP
  struct CompletionContext
    include JSON::Serializable

    # How the completion was triggered.
    @[JSON::Field(key: "triggerKind")]
    property trigger_kind : CompletionTriggerKind

    # The trigger character (a single character) that has trigger code complete.
    # Is undefined if `triggerKind !== CompletionTriggerKind.TriggerCharacter`
    @[JSON::Field(key: "triggerCharacter")]
    property trigger_character : String | Nil
  end
end
