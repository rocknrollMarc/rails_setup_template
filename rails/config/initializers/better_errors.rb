if Rails.env.development?
  # Enables Pry when inspecting an exception.
  BetterErrors.use_pry!
end
