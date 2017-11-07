# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  album_id   :integer          not null
#  ord        :integer          not null
#  lyrics     :text             not null
#  bonus      :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord

  belongs_to :album,
    class_name: 'Album',
    foreign_key: :album_id,
    primary_key: :id

end
