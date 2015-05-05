class UserPolicy < ApplicationPolicy
  def edit?
    user.id == record.id
  end

  def update?
    edit?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
