class VrpWorker
  include Sidekiq::Worker

  def perform(solution_id)
    debugger
  end
end
