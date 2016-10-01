class AssignmentsController < ApplicationController
  def index
    @assignments = Assignment.all
  end

  def edit
    @assignment = set_assignment
    @assignment_note = AssignmentNote.new
  end

  def start
    set_assignment.in_progress!
    redirect_to edit_assignment_path,
                flash: { success: "Ha comenzado la tarea" }
  end

  def complete
    set_assignment.complete!
    redirect_to edit_assignment_path,
                flash: { success: "Ha finalizado la tarea" }
  end

  private

  def set_assignment
    Assignment.find(params[:id])
  end
end
