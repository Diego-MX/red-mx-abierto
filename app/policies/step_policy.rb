class StepPolicy < ApplicationPolicy
  def create?
    user.admin?
  end

  def update?
    create?
  end

  def destroy?
    create?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
