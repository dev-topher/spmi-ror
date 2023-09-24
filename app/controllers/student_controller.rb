class StudentController < ApplicationController
    def index

        @data_user = Student.includes(career: :college).find_by(user_id: current_user.id)

        @announcement = Announcement.find(1)

        ###################################################################
        #   Cálculo de créditos máximos
        ###################################################################
        
        creditos_carrera = @data_user.career.credits
        max_creditos = (@announcement.max_creditos_sct.to_f / 100.0)
        creditos_max_convocatoria = (creditos_carrera * max_creditos)



        validador = false
        postulacion_multiple = false


        ###################################################################
        #   Lógica de validación para realizar postulaciones
        ###################################################################

        if @data_user.credits_approved > @announcement.min_creditos_sct &&
            @data_user.credits_approved < creditos_max_convocatoria.to_i &&
            @data_user.regular_student &&
            @data_user.failed_subjects <= @announcement.ramos_reprobados &&
            !postulacion_multiple
           
            validador = true

        end
         
        ###################################################################
        #   Lógica de vista para aprobado/rechazado y los motivos
        ###################################################################


        if validador == true 
            render 'student/validations/correct'
        else 
            @errors = []

            if @data_user.regular_student == false
                @errors.push("No tiene la condición de alumno regular")
            end

            if @data_user.has_debts == true
                @errors.push("Posee deudas de arancel")
            end

            if @data_user.has_intern_debts == true
                @errors.push("Posee deudas con los servicios de su universidad")
            end
            
            if  @data_user.credits_approved < @announcement.min_creditos_sct
                @errors.push("Usted tiene menos créditos aprobados que el mínimo solicitado de la convocatoria (Tiene: #{@data_user.credits_approved} y el mínimo es #{@announcement.min_creditos_sct})")
            end

            if  @data_user.credits_approved > creditos_max_convocatoria.to_i
                @errors.push("Usted tiene más créditos aprobados que el máximo solicitado de la convocatoria (Tiene: #{@data_user.credits_approved} y el máximo es #{@creditos_max_convocatoria})")
            end
            
            if  @data_user.failed_subjects > @announcement.ramos_reprobados
                @errors.push("Usted tiene más ramos reprobados que el límite permitido por la convocatoria (Tiene: #{@data_user.failed_subjects} y el máximo es #{@announcement.ramos_reprobados})")
            end

            if  postulacion_multiple == true
                @errors.push("Ya has realizado una postulación a esta convocatoria.")
            end

            render 'student/validations/error'
        end

    end
end
