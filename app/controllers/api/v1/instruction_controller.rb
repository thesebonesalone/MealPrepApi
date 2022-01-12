module Api
    module V1
        class InstructionController < ApplicationController

            def create
                instruction = instruction.new(instruction_params)
                if instruction.save
                    data = {instruction: instruction, message: "Success"}
                    render :json => data
                else
                    data = {message: "Could not create instruction"}
                    render :json => data
                end
            end
        end
    end
end