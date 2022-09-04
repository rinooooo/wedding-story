class PostForm
  include ActiveModel::Model

  attr_accessor :attendance, :name, :name_kana, :category_gloom, :category_bride, :address, :mail, :departure, :go_home, :message, :wedding_id,
                :tag_name, :post_id,
                :tag_id
  
  with_options presence: true do
    validates :attendance
    validates :name
    validates :name_kana
    validates :address
    validates :mail
    validates :message
    validates :wedding_id
    validates :tag_name
  end

  def save
    post = Post.create(attendance: attendance, name: name, name_kana: name_kana, category_gloom: category_gloom, category_bride: category_bride, address: address, mail: mail, departure: departure,
      go_home: go_home, message: message, wedding_id: wedding_id)
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save
    PostTag.create(post_id: post.id, tag_id: tag.id)
  end
end