class User < ApplicationRecord
    enum role: [:admin, :moderator, :member]
end
