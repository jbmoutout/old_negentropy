class InstumPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def stream?
    true
  end

  def collection?
    true
  end

  def add?
    true
  end

  def remove?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

end