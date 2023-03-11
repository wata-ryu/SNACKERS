class Post < ApplicationRecord
    #アソシエーション
    has_many :bookmarks, dependent: :destroy
    has_many :comments, dependent: :destroy
    belongs_to :user
    belongs_to :genre
    
    #アクティブストレージで画像を取得できるようにする
    has_one_attached :image
    
    #バリデーション設定、trueと記述するとデータが存在しなければならない
    validates :title, presence: true, length: { in: 2..30 }
    validates :alcohol, presence: true, length: { in: 2..20 }
    validates :summary, presence: true, length: { in: 2..100 }
    validates :ingredient, presence: true, length: { in: 2..100 }
    validates :cook, presence: true, length: { in: 2..200 }
    validates :image, presence: true
    
    def bookmarked_by?(user)
      bookmarks.exists?(user_id: user.id)
    end
end
