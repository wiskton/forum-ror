ENV['FACEBOOK_KEY'] = '867514650028963'
ENV['FACEBOOK_SECRET'] = '8e4052e1e68d1ecd9e1b3bb8be760d6e'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
           :scope => 'email,user_birthday', :display => 'page'
# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
#            :scope => 'email,user_birthday,read_stream', :display => 'page'
end
