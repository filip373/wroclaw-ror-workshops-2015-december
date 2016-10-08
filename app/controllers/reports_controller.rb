class ReportsController < ApplicationController
  expose(:subject_items) { SubjectItem.includes(:teacher, :students) }

  before_action :authenticate_user!

  def subjects
  end
end
