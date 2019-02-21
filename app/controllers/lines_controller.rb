class LinesController < ApplicationController
    def new
        @line=Line.new
    end

    def create
        Line.create(line_params)
        @line=Line.last(params[:id])
        redirect_to line_frames_path(@line)
    end

    private
    def line_params
        params.require(:line).permit(:name)
    end
end