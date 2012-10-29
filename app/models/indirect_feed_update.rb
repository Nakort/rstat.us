class IndirectFeedUpdate
  include MongoMapper::Document
  belongs_to :indirect_feed
  key :indirect_feed_id, ObjectId
  
  belongs_to :update
  key :update_id, ObjectId

  belongs_to :original_update, :class => Update
  key :original_update_id, ObjectId

end
