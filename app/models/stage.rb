class Stage < ActiveRecord::Base
  has_many :steps

  def save_and_add_new_steps(new_steps=[])
    # create stage and check if there
    # are any new_steps to save
    if self.save && new_steps.any?
      new_steps.each { |st| create_step(st) }
    end
  end

  private

  def create_step(step_name)
    self.steps.create(name: step_name)
  end
end
