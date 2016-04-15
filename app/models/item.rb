# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  article_id  :integer          not null
#  sort_rank   :integer          not null
#  target_type :string           not null
#  target_id   :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Item < ApplicationRecord
  belongs_to :article, touch: true
  belongs_to :target, polymorphic: true

  enum target_type: {
           twitter: 'ItemTwitter',
           link: 'ItemLink',
           quote: 'ItemQuote',
           text: 'ItemText',
           image: 'ItemImage',
           heading: 'ItemHeading',
           sub_heading: 'ItemSubHeading'
       }

  validates :sort_rank, presence: true
  validates :target_type, presence: true, inclusion: { in: Item.target_types.keys }
end
