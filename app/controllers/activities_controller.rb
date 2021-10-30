class ActivitiesController < ApplicationController
    skip_before_action :verify_authenticity_token

    #--------------------------------------------------------#
    #NOTA: AINDA PRECISA VER COMO PASSAR O ALERTA PARA O INDEX
    #--------------------------------------------------------#
    $alert = ""
    $alertWasAlreadySeen = false

    def index
        # listar as atividades
        @activities = Activity.all

        # criar uma atividade
        @activity = Activity.new
        
        if $alertWasAlreadySeen 
            @alert = $alert
            $alertWasAlreadySeen = true
        else
            @alert = ""
            $alertWasAlreadySeen = false
        end
    end
    
    def create
        activity = Activity.new(activity_params)

        if activity.name == "" || activity.name == nil
            $alert = "O nome da atividade é obrigatório"
        elsif activity.date == "" || activity.date == nil
            $alert = "A data da atividade é obrigatória"
        else
            if activity.save
                $alert = "Atividade salva com sucesso"
            else
                $alert = "Erro ao salvar nova atividade"
            end
        end

        write_alert_on_log
        redirect_to activities_index_url
    end

    def destroy
        activity = Activity.find(params[:id]);

        if activity.destroy
            $alert = "Atividade deletada com sucesso"
        else            
            $alert = "Erro ao deletar atividade"
        end

        write_alert_on_log
        redirect_to activities_index_url
    end

    private

    def activity_params
        params.require(:activity).permit(:name, :description, :date)
    end

    def write_alert_on_log
        Rails.logger.debug "--------------------------------------"
        Rails.logger.debug "Mensagem de alerta: " + $alert
        Rails.logger.debug "--------------------------------------"
    end
end