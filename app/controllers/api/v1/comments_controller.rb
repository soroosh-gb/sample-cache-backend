class Api::V1::CommentsController < ApplicationController
    skip_before_action :authorized
    def index
        comments = Comment.all 

        render json: comments
    end

    def show
        comment = Comment.find(params[:id])

        render json: comment
      end

    def create
        comment = Comment.create(comment_params)

        render json: comment
    end

    def update
        # byebug
        comment =  Comment.find(params[:id]) 
        comment.update(text: params[:text])
        
        render json: (comment)
    end

    def destroy
        comment =  Comment.find(params[:id])
        
        comment.destroy

        render json: comment

    end

    

    private

    def comment_params
        params.require(:comment).permit!
    end

   
end
