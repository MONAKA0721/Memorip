class AddPrefectureCodeToMicropost < ActiveRecord::Migration[5.1]
  def change
    add_column :microposts, :prefecture_code, :integer
  end
end
