class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  
  # パスワードには半角英数字のみとバリデーションをかける
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Password is invalid. Include both letters and numbers' 
  
  # last_nameとfirst_nameは全角漢字とひらがなのみとバリデーションをかける
  validates :last_name, presence: true, format: {with: /\A[一-龠ぁ-ん]+\z/, message: "Last name is invalid. Input full-width characters" }
  validates :first_name, presence: true, format: {with: /\A[一-龠ぁ-ん]+\z/, message: "First_name is invalid. Input full-width characters" }

  # last_name_kanaとfirst_name_kanaは全角カナ文字のみとバリデーションをかける
  validates :last_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: "Last name kana is invalid. Input full-width katakana characters" }
  validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: "First name kana is invalid. Input full-width katakana characters" }
  
  # birth_dataは空欄と「---」にバリデーションをかける
  validates :birth_data, presence: true, numericality: { other_than: 1, message: "Birth date can't be blank" } 

end
