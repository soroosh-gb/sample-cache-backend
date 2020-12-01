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
        comment =  Comment.find(params[:id]) 
        new_commnet = comment.update(text: params[:text], user_id: params[:user_id], sample_id: params[:sample_id])
        
        render json: new_comment
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
