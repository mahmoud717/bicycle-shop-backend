class Option < ApplicationRecord
    has_many :suboptions, :class_name => "Option", :foreign_key => 'parent_id', :dependent => :destroy
    belongs_to :parent_option, :class_name => "Option", optional: true
    belongs_to :bicycle
end