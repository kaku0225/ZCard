class BoardPolicy < ApplicationPolicy
  def hide?(board)
    user && user.role == 'bm' && record.user == user
  end

  def lock?
    hide?
  end

  def open
    lock?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
