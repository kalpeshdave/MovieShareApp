class Video < ApplicationRecord
  belongs_to :user
  validates :url, format: { with: /(youtu\.be\/|youtube\.com\/(watch\?(.*&)?v=|(embed|v)\/))([^\?&"'>]+)/ }, presence: true

  after_create :update_embad_url

  private

  def update_embad_url
  	update(url: YoutubeGenerator.video_embed(self.url))
  end
end
