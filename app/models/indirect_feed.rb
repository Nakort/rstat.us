class IndirectFeed

  include MongoMapper::Document

  belongs_to :user
  key :user_id, ObjectId

  many :indirect_feed_updates

  def add_update(update)
    return false if update.original_id and indirect_feed_updates.where(:original_update_id => update.original_id).any?
    indirect_feed_update = IndirectFeedUpdate.new
    indirect_feed_update.update = update
    indirect_feed_update.original_update = update.original || update 
    indirect_feed_updates << indirect_feed_update
    indirect_feed_update
  end

end
