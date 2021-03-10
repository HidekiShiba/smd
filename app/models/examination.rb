class Examination < ApplicationRecord
  belongs_to :reservation, optional: true
  belongs_to :reception, optional: true

  enum prescription_status: {あり: 0, なし: 1}
  enum update_status: {入力前: 0, 入力済: 1}

  validate :duplicate

  def duplicate
    return false unless new_record?
    if Examination.where("reservation_id = ? or reception_id = ?", self.reservation_id, self.reception_id).count() > 0
      errors.add(:id, "<該当の受診履歴はすでに作成済です>")
    end
  end
end