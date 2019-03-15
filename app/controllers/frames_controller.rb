class FramesController < ApplicationController
    def index
        @line=Line.find(params[:line_id])
        @frame=@line.frames        
    end

    def create
        @line=Line.find(params[:line_id])
        points=roll_update
        @frame=@line.frames.create(roll_1: points[0],roll_2: points[1], score:(points[0]+points[1]))
        @frame.update(move: move)
        if @line.frames.length>1
            t=@line.frames.last.id-1
        else
            t=@line.frames.last.id
        end
        @frame.update(total: @line.frames.last.score+ @line.frames.find(t).total)
        redirect_to line_frames_path(@line)        
    end   

    def roll_update        
        arr=[]
        2.times  do     
            roll=rand(11) # roll es el número de pines que se botaron de 0 a 10
            if roll==10
                arr[0]=roll
                arr[1]= 0
                break
            else 
                roll2=rand(11-roll)
                arr[0]=roll
                arr[1]=roll2
            end            
            
        end 
        @arr=arr #pines en el turno 1 y 2         
    end

    def move
        p @arr
        if @arr[0]==10
            "STRIKE"
        elsif (@arr[0]+@arr[1])==10
            "SPARE"
        elsif ((@arr[0]+@arr[1])<=9 && (@arr[0]+@arr[1])>6)
            s=["¡SERÁ LA PRÓXIMA!","¡BUEN TIRO!","¡CASI PERFECTO!"]
            inx=rand(3)
            s[inx]
        else  
            s=["¡UPS!","QUÉ PASA?"]
            inx=rand(2)
            s[inx]
        end
     end


    private
    def frame_params
        params.require(:frame).permit(:roll_1,:roll_2,:score,:move)
    end

end