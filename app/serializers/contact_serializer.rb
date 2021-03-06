class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  belongs_to :kind do
    link(:related) { kind_url(object.kind.id) }
  end
  has_many :phones
  has_one :address

  # Hyperlinks related to aassociations
  # link(:self) { contact_url(object.id) }
  # link(:kind) { kind_url(object.kind.id) }

  # Add meta information in all actions
  # meta do
  #   { info: "Info u want" }
  # end

  def attributes(*args)
    h = super(*args)
    # pt-BR ---> h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
    h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    h
  end
end
