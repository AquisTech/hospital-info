class EmailAddress < ApplicationRecord
  belongs_to :emailable, polymorphic: true

  enum email_type: { main: 0, support: 1 }
end
