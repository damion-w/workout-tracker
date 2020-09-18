class ExercisesController < ApiController
    before_action :require_login, except: [:index, :show]

    def index
        exercises = Exercise.all
        render json: { exercises: exercises }
    end

    def show
        exercise = Exercise.find(params[:id])
        render json: { exercise: exercise }
    end

    def create
        exercise = Exercise.new(exercise_params)
        exercise.user = current_user
        
        if exercise.save
            render json: { message: 'ok', exercise: exercise }
        else
            render json: { message: 'Could not create monster' }
        end
    end

    private
    def exercise_params
        params.require(:exercise).permit(:name, :set, :reps)
    end

end
