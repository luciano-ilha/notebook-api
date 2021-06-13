class Contact < ApplicationRecord
  belongs_to :kind
  has_many :phones

  def birthdate_br
    I18n.l(self.birthdate) unless self.birthdate.blank?
  end

  # def author
  #   "Luciano Ilha"
  # end

  # def kind_description
  #   self.kind.description
  # end

  # def as_json(options={})
  #   super(
  #     root: true,
  #     methods: [:kind_description, :author],
  #     include: { kind: { only: :description }}
  #   )
  # end
end
