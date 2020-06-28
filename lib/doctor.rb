class Doctor
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name

        @@all << self 
    end

    def self.all 
        @@all 
    end
     
    #(date, patient, doctor)
    def new_appointment(patient_instance, date)
        Appointment.new(date, patient_instance, self)
    end

    def appointments 
        Appointment.all.select {|appointment_instance| appointment_instance.doctor == self}
    end

    def patients 
        self.appointments.collect {|appointment_instance| appointment_instance.patient}
    end
end