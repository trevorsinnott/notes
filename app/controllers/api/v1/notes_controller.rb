module Api
    module V1
        class NotesController < ApplicationController
            def index
                notes = Note.order('created_at DESC')
                render json: {status: 'SUCCESS', message: 'Loaded notes', data: notes}, status: :ok
            end

            def show
                note = Note.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Loaded note', data: note}, status: :ok
            end

            def create
                note = Note.new(note_params)
                
                if note.save
                    render json: {status: 'SUCCESS', message: 'Saved note', data: note}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Note not saved', data: note.errors}, status: :unprocessable_entity
                end
            end

            def destroy
                note = Note.find(params[:id])
                note.destroy
                render json: {status: 'SUCCESS', message: 'Deleted note', data: note}, status: :ok
            end

            def update
                note = Note.find(params[:id])
                if note.update_attributes(note_params)
                    render json: {status: 'SUCCESS', message: 'Updated note', data: note}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Note not updated', data: note.errors}, status: :unprocessable_entity
                end
            end

            private
            
            def note_params
                params.permit(:body)
            end
        end
    end
end