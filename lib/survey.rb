class Survey < ActiveRecord::Base
  has_many(:questions)

  before_save(:titlecase_name)

  private

  def titlecase_name
    self.name=(name().titlecase())
  end
end
