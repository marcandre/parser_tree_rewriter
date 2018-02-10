module Parser
  ##
  # Diagnostic messages (errors, warnings and notices) that can be generated.
  #
  # @see Diagnostic
  #
  # @api public
  #
  new_messages = MESSAGES.merge({
    # Rewriter diagnostics
    :different_replacements        => 'different replacements: %{replacement} vs %{other_replacement}',
    :swallowed_insertions          => 'this replacement:',
    :swallowed_insertions_conflict => 'swallows some inner rewriting actions:',
    :crossing_deletions            => 'the deletion of:',
    :crossing_deletions_conflict   => 'is crossing:',
    :crossing_insertions           => 'the rewriting action on:',
    :crossing_insertions_conflict  => 'is crossing that on:',
  }).freeze
  remove_const(:MESSAGES)
  const_set(:MESSAGES, new_messages)
end
