class TodoList < ApplicationRecord
    has_many :todo_items, :dependent => :delete_all
    belongs_to :user
    def completed?
        !completed_at.blank?
      end
    
      def incomplete?
        completed_at.blank?
      end
end
