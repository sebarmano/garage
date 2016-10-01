class AssignmentNotesController < ApplicationController
  def create
    note = AssignmentNote.new(assignment_note_params)
    if note.save
      redirect_to edit_assignment_path(note.assignment),
                  flash: { success: "La nota ha sido agregada" }
    else
      redirect_to :back
    end
  end

  private

  def assignment_note_params
    params.require(:assignment_note).permit(:content, :assignment_id)
  end
end
