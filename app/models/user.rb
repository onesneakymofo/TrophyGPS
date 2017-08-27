class User < ApplicationRecord
  include Gravtastic
  gravtastic
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :twitter]

  has_many :identities, dependent: :destroy
  has_many :posts, dependent: :destroy

  has_many :follower_relationships, foreign_key: :followed_id, class_name: 'Relationship'
  has_many :followers, through: :follower_relationships, source: :user

  has_many :following_relationships, foreign_key: :user_id, class_name: 'Relationship'
  has_many :following, through: :following_relationships, source: :followed

  def self.find_for_oauth(auth, signed_in_resource = nil)
    identity = Identity.find_for_oauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user

    if user.blank?
      email = auth.info.email
      user = User.where(email: email).first if email

      if user.blank?
        user = User.new(
          name: auth.extra.raw_info.name,
          #username: auth.info.nickname || auth.uid,
          email: email,
          password: Devise.friendly_token[0,20]
        )
        user.save!
      end
    end

    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end

  def gravatar
    # include MD5 gem, should be part of standard ruby install
    # require 'digest/md5'


    hash = Digest::MD5.hexdigest(email.downcase)

    # compile URL which can be used in <img src="RIGHT_HERE"...
    "https://www.gravatar.com/avatar/#{hash}"
  end


  def follower_id_for(user)
    self.follower_relationships.find_by_user_id(user.id)
  end
end
