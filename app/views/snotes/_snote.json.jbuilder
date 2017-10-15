json.extract! snote, :id, :title, :answer, :pnote, :freq, :user_id, :note_id, :created_at, :updated_at
json.url snote_url(snote, format: :json)
