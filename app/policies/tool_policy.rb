class ToolPolicy < ApplicationPolicy
  def new?
    user.admin?
  end

  def create?
    new?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
