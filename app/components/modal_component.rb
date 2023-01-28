# frozen_string_literal: true

class ModalComponent < ViewComponent::Base
  def initialize(title, user_id, group)
    @title = title
    @user_id = user_id
    @group = group
  end

end
