class ProfAndAbovePolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @model = model
  end

  def index?
    @current_user.not_student?
  end

  def show?
    @current_user.not_student? and @model.user == @current_user
  end
  
  def new?
    @current_user.not_student?
  end
  
  def edit?
    @current_user.not_student?
  end
  
  def create?
    @current_user.not_student?
  end

  def update?
    @current_user.not_student? and @model.user == @current_user
  end

  def destroy?
    @current_user.not_student? and @model.user == @current_user
  end

end
