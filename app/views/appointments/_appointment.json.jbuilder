json.extract! appointment, :id, :advisor_id, :client_id, :appointment_date, :status, :notes, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
