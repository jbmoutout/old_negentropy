class CollectionPolicy < ApplicationPolicy

  def new?
    true
  end

  def index?
    true
  end

  def show?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
