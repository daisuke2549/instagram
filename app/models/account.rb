class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :likes, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :profile, dependent: :destroy
  delegate :birthday, :age, :gender, to: :profile, allow_nil: true
  
  def has_written?(post)
    posts.exists?(id: post.id)
  end

  def has_liked?(post)
    likes.exists?(post_id: post.id)
  end

  def display_name

  end
  def prepare_profile
    profile || build_profile
  end

  def avatar_image
    if profile&.image&.attached?
      profile.image
    else
      'Ellipse.png'
    end
  end

end

