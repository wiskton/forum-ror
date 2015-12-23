class User < ActiveRecord::Base

  validate :name_required

  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :comments

  PERMISSIONS = [["Administrador", 1], ["Moderador", 2], ["Usuário", 3]]

  def is_admin?
    self.permission == 1
  end

  def is_moderator?
    self.permission == 2
  end

  def get_user_permission
    PERMISSIONS[self.permission - 1] ? PERMISSIONS[self.permission - 1][0] : 'Não encontrado'
  end

  def image
    url = Gravatar.new(self.email).image_url
  end

  def img
    "<img src='#{Gravatar.new(self.email).image_url}' />".html_safe
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  private
  def name_required
    if name == ""
      errors[:base] << "Name can't be blank"
    end
  end
end
