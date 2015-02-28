class DialogPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def collection?
    true
  end

  def add?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

end