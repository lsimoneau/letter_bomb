module LetterBomb
  class MailersController < ApplicationController
    def index
      @mailer_classes = LetterBomb::Preview.classes
    end

    def show
      class_name  = params[:mailer_class]
      action_name = params[:mailer_action]

      @action = class_name.constantize.preview_action(
        action_name,
        format: params[:format]
      )

      respond_to do |format|
        format.html {
          render layout: "letter_bomb/application"
        }

        format.text {
          render layout: "letter_bomb/application",
                 formats: [:html],
                 content_type: 'text/html'
        }
      end
    end
  end
end
