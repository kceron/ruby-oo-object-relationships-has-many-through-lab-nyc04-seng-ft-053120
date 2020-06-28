class Patient
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
    def new_appointment(doctor, date)
        Appointment.new(date, self, doctor)
    end

    def appointments
        Appointment.all.select {|appointment_instance| appointment_instance.patient == self}
    end

    def doctors
        self.appointments.collect {|appointment_instance| appointment_instance.doctor}.uniq
    end

end