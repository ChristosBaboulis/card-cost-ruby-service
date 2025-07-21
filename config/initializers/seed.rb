Rails.application.config.after_initialize do
  load Rails.root.join('db', 'seeds.rb')
end
