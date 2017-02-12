class User < ActiveRecord::Base
  has_many :posts
  has_many :audit_logs
  validates_presence_of :first_name, :last_name, :phone

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  PHONE_REGEX = /\A[0-9]*\Z/

  validates_format_of :phone, with: PHONE_REGEX

  validates :phone, length: { is: 10 }

  def full_name
    last_name.upcase + ', ' + first_name.upcase
  end
end
