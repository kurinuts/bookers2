class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.timestamps
    end
  end
end

# migrationはdownの状態でないと編集しちゃダメ
# bundle exec rake db:migrate:down VERSION=20220327090536
# (rails db:migrate:downでまず挑戦)