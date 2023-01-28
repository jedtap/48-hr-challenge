# frozen_string_literal: true

class ModalComponent < ViewComponent::Base
  def initialize(title, user_id)
    @title = title
    @user_id = user_id
  end

end
