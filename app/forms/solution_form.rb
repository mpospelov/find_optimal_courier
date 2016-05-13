class SolutionForm < BaseForm
  INITIAL_STATE = 'started'.freeze

  property :date
  validates :date, presence: true

  private

  def save_model
    model.state = INITIAL_STATE
    super
    VrpWorker.perform_async(model.id)
  end
end
