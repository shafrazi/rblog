class User < ApplicationRecord
  has_many :posts
  has_secure_password

  def self.search(query)
    where("name like ? OR email like ?", "%#{query}%", "%#{query}")
    #code
  end
end
