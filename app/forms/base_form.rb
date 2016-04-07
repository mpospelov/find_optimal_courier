require 'reform/form/coercion'

class BaseForm < Reform::Form
  include Coercion

  private

  def save_model
    sync
    model.save!
  end
end
