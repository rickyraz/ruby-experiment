# auth.rb
require 'argon2'

module Auth
  def self.hash_password(password)
    Argon2::Password.create(password, 
      # More iterations = slower but stronger
      t_cost: 4,           
      m_cost: 18,          # 2^18 = 256MB memory
      p_cost: 2,           # Use 2 threads
      hash_len: 64,        # 64-byte output
      salt_len: 32         # 32-byte salt
    )
  end

  def self.verify_password(password, hash)
    Argon2::Password.verify_password(password, hash)
  end
end