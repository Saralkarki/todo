class TodoItem < ApplicationRecord
  belongs_to :todo_list

  def completed?
    !completed_at.blank?
  end

  def incomplete?
    completed_at.blank?
  end
end
