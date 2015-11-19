class ParticipantsController < ApplicationController

  before_action :find_occurrence, only: [:create]

  def create
    @participant = current_user.participants.new(occurrence: @occurrence)
    @participant.save
    owner = @occurrence.event.user
    UserMailer.participate(current_user, @occurrence, owner).deliver_now
    redirect_to :back
  end

  def destroy
    Participant.find(params[:id]).destroy
    redirect_to :back
  end

  private

  def find_occurrence
    @occurrence = Occurrence.find(params[:occurrence_id])
  end

  def participant_params
    params.require(:participant).permit(:occurrence_id, :user_id)
  end

end
