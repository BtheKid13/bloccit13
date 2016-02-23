class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  belongs_to :topic
  after_create :send_favorite_emails

  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true

   default_scope {order('updated_at ASC')}

  private

  def send_favorite_emails
    post.favorites.each do |favorite|
      Mailman.new_comment(favorite.user, post, self).deliver_now
    end
  end
end
