class Comment < ApplicationRecord

  belongs_to :prototype  
  belongs_to :user 
  validates :content, presence: true
  #validates :カラム名, バリデーションの種類

end
