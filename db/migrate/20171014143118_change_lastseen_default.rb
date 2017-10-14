class ChangeLastseenDefault < ActiveRecord::Migration[5.0]
  def change
  	change_column_default :notes, :lastseen, Time.now
  end
end
